package com.spring.map;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.PageDTO;
import com.spring.model.getherBoardDAO;
import com.spring.model.getherBoardDTO;
import com.spring.model.getherReplyDTO;

@Controller
public class GetherBoardController {

	@Autowired
	private getherBoardDAO dao;
	
	private final int rowsize = 10;        // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;          // DB 상의 게시물 전체 수
	
	@RequestMapping("gether_board_list.do")
	public String getGetherBoardList(HttpServletRequest request,
			Model model) {
		
		int page;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");


		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<getherBoardDTO> pageList = this.dao.getBoardList(dto);
		
		model.addAttribute("secter", "마포구 전체");
		model.addAttribute("id", id);
		model.addAttribute("List", pageList);
		model.addAttribute("Paging", dto);
		model.addAttribute("page", 0);
		
		return "gether_board_list";		
		
	}
	
	@RequestMapping("gether_board_write.do")
	public String write(Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		model.addAttribute("id", id);
			
		return "gether_board_write";
	
	}
	
	@RequestMapping("gether_board_write_ok.do")
	public void writeOk(getherBoardDTO dto,
			HttpServletResponse response,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// 지정구역을 안정한 경우 돌려보내기
		if(dto.getBsecter()!="") {
			
			MultipartFile mf = mRequest.getFile("file1");
			
			// 파일이 들어간 경우
			if(mf!=null) {

				// 업로드한 파일의 이름을 구하는 메서드.
				String originalFileName = mf.getOriginalFilename();	
				String finalname="";
				String uploadPath = 
						"C:\\NCS\\workspace(spring)\\MaP\\src\\main\\webapp\\resources\\upload\\";
				
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DATE);
				

					// 실제 폴더를 만들어 보자.
					// .....\\resources\\upload\\2021-12-24
					String homedir = uploadPath + year + "-" + month + "-" + day;
					
					File path1 = new File(homedir);
					
					if(!path1.exists()) {
						path1.mkdirs();
					}
					
					// 실제적으로 파일을 만들어 보자.
					String saveFileName = originalFileName;
					
					if(saveFileName != null && !saveFileName.equals("")) {
						saveFileName =
								System.currentTimeMillis() + "_" + saveFileName;
						
						try {
							// .....\\resources\\upload\\2021-12-24\\실제파일
							File origin = new File(homedir+"/"+ saveFileName);

							// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
							mf.transferTo(origin);
							
							finalname=year + "-" + month + "-" + day+"/"+saveFileName;
							
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

					dto.setBcode(finalname);
					dto.setBupload(originalFileName);
				
				// 다 작성되었을 경우 그대로 진행 
				int check = this.dao.insertBoard(dto);
							
				if(check > 0) {
					out.println("<script>");
					out.println("alert('게시물 추가 성공!!!')");
					out.println("location.href='gether_board_list.do'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시물 추가 실패~~')");
					out.println("history.back()");
					out.println("</script>");
				}
				
			} else if(mf==null) {
				
				dto.setBcode("");
				dto.setBupload("");

				// 다 작성되었을 경우 그대로 진행 
				int check = this.dao.insertBoard(dto);
							
				if(check > 0) {
					out.println("<script>");
					out.println("alert('게시물 추가 성공!!!')");
					out.println("location.href='gether_board_list.do'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시물 추가 실패~~')");
					out.println("history.back()");
					out.println("</script>");
				}
				
			}
			

		} else {
			out.println("<script>");
			out.println("alert('지정구역을 정해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}		
	}
	
	@RequestMapping("gether_board_content.do")
	public String content(@RequestParam("bno") int bno,
			@RequestParam("page") int nowpage,
			HttpServletResponse response,
			Model model, HttpServletRequest request) {
		
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 조회수 증가시키는 메서드 호출
		this.dao.readCount(bno);
		
		// 게시글 상세 내역 조회하는 메서드 호출
		getherBoardDTO dto = this.dao.boardCont(bno);
		
		// 댓글 리스트 호출
		List<getherReplyDTO> reply = this.dao.getReplyList(bno);
		
		model.addAttribute("reply", reply);
		
		model.addAttribute("dto", dto);
				
		model.addAttribute("page", nowpage);
		
		model.addAttribute("id", id);
			
		return "gether_board_content";
		
	}
	
	@RequestMapping("gether_board_update.do")
	public String update(@RequestParam("bno") int bno,
			@RequestParam("page") int page,
			Model model) {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		getherBoardDTO dto = this.dao.boardCont(bno);
			
		
		model.addAttribute("modify", dto);
				
		model.addAttribute("page", page);
				
		return "gether_board_updateForm";
		
	}
	
	@RequestMapping("gether_board_update_ok.do")
	public void updateOk(getherBoardDTO dto,
			@RequestParam("page") int page, 
			HttpServletResponse response,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		MultipartFile mf = mRequest.getFile("file_new");
		
		// 파일을 넣은 경우
		if(! mf.isEmpty()) {
						
				// 업로드한 파일의 이름을 구하는 메서드.
				String originalFileName = mf.getOriginalFilename();	
				String finalname="";
				String uploadPath = 
						"C:\\NCS\\workspace(spring)\\MaP\\src\\main\\webapp\\resources\\upload\\";
				
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DATE);
				

					// 실제 폴더를 만들어 보자.
					// .....\\resources\\upload\\2021-12-24
					String homedir = uploadPath + year + "-" + month + "-" + day;
					
					File path1 = new File(homedir);
					
					if(!path1.exists()) {
						path1.mkdirs();
					}
					
					// 실제적으로 파일을 만들어 보자.
					String saveFileName = originalFileName;
					
					if(saveFileName != null && !saveFileName.equals("")) {
						saveFileName =
								System.currentTimeMillis() + "_" + saveFileName;
						
						try {
							// .....\\resources\\upload\\2021-12-24\\실제파일
							File origin = new File(homedir+"/"+ saveFileName);

							// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
							mf.transferTo(origin);
							
							finalname=year + "-" + month + "-" + day+"/"+saveFileName;
							
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

					dto.setBcode(finalname);
					dto.setBupload(originalFileName);
				
				// 다 작성되었을 경우 그대로 진행 
				int check = this.dao.updateBoard(dto);
							
				if(check > 0) {
					out.println("<script>");
					out.println("alert('게시물 수정 성공!!!')");
					out.println("location.href='gether_board_content.do?bno="+dto.getBno()+"&page="+page+"'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시물 수정 실패~~')");
					out.println("history.back()");
					out.println("</script>");
				}
				
			// 파일 추가 안했을때 진행
			} else if(mf.isEmpty()) {
								
				int check = this.dao.updateBoard(dto);
							
				if(check > 0) {
					out.println("<script>");
					out.println("alert('게시물 수정 성공!!!')");
					out.println("location.href='gether_board_content.do?bno="+dto.getBno()+"&page="+page+"'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('게시물 수정 실패~~')");
					out.println("history.back()");
					out.println("</script>");
				}
				
			}
				
	}
	
	@RequestMapping("gether_board_delete.do")
	public void delete(@RequestParam("bno") int bno,
			@RequestParam("page") int page, 
			HttpServletResponse response) throws IOException {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		getherBoardDTO dto = this.dao.boardCont(bno);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		int check = this.dao.deleteBoard(dto.getBno());
		
		if(check > 0) {
			
			this.dao.updateSequence(dto.getBno());
			
			// 해당 글 댓글 삭제
			this.dao.deleteAllReply(dto.getBno());
			
			out.println("<script>");
			out.println("alert('게시물 삭제 성공!!!')");
			out.println("location.href='gether_board_list.do?page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시물 수정 실패~~')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	
	@RequestMapping("gether_board_search.do")
	public String search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,
			@RequestParam("page") int nowPage, 
			Model model) {
		
		
		
		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchBoardCount(field, keyword);
		
		PageDTO dto = 
				new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
		
		System.out.println("검색 게시물 수 >>> " + dto.getTotalRecord());
		System.out.println("전체 페이지 수 >>> " + dto.getAllPage());
		
		// 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<getherBoardDTO> searchList = this.dao.searchBoardList(dto);
		
		
		// 리스트를 그대로 활용하기 위해서 gether_board_list.do와 같은 형식으로 전달
		
		model.addAttribute("List", searchList);
		
		model.addAttribute("Paging", dto);
		
		
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", 1);
		
		return "gether_board_list";
	}
	
	@RequestMapping("gether_board_secter_list.do")
	public String search(@RequestParam("secter") String secter,
			@RequestParam("page") int nowPage, 
			HttpServletResponse response,
			Model model) {
		
		System.out.println("1번:"+secter);
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 지역에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.secterBoardCount(secter);
		
		PageDTO dto = 
				new PageDTO(nowPage, rowsize, totalRecord, secter);
		
		System.out.println("검색 게시물 수 >>> " + dto.getTotalRecord());
		System.out.println("전체 페이지 수 >>> " + dto.getAllPage());
		
		// 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<getherBoardDTO> searchList = this.dao.secterBoardList(dto);
		
		
		// 리스트를 그대로 활용하기 위해서 gether_board_list.do와 같은 형식으로 전달
		
		model.addAttribute("List", searchList);		
		model.addAttribute("Paging", dto);		
		model.addAttribute("secter", secter);
		model.addAttribute("page", 1);
		System.out.println("2번:"+secter);
		return "gether_board_list";
	}
	
	// 댓글 관련
	@RequestMapping("gether_reply_insert.do")
	public void replyInsert(getherReplyDTO dto,
			@RequestParam("smno") String smno,
			@RequestParam("page") int page,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		int imno=Integer.parseInt(smno);
		
		dto.setMno(imno);
		
		int res= this.dao.insertReply(dto);
		
		if(res > 0) {	
			out.println("<script>");
			out.println("alert('댓글 작성 성공!!!')");
			out.println("location.href='gether_board_content.do?bno="+dto.getMno()+"&page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('댓글 작성 실패~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("gether_reply_update.do")
	public String replyUpdate(@RequestParam("rno") int rno,
			@RequestParam("page") int page,
			Model model) throws IOException {
		
		getherReplyDTO dto = this.dao.getReply(rno);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		
		return "gether_reply_update";
	}

	@RequestMapping("gether_reply_update_ok.do")
	public void replyUpdateOk(getherReplyDTO dto,
			@RequestParam("page") int page,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		int res = this.dao.updateReply(dto);
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('댓글 수정 성공!!!')");
			out.println("location.href='gether_board_content.do?bno="+dto.getMno()+"&page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('댓글 수정 실패~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("gether_reply_delete.do")
	public void replyDelete(@RequestParam("mno") int mno,
			@RequestParam("rno") int rno,
			@RequestParam("page") int page,
			HttpServletResponse response) throws IOException {
		System.out.println("1");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		int res= this.dao.deleteReply(rno);
		
		if(res>0) {
			
			this.dao.updateReplySequence(rno);
			
			out.println("<script>");
			out.println("alert('댓글 삭제 성공!!!')");
			out.println("location.href='gether_board_content.do?bno="+mno+"&page="+page+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('댓글 수정 실패~~')");
			out.println("history.back()");
			out.println("</script>");
		}		
	}
	@RequestMapping("map.do")
	public String goMap(Model model) {
		return "mapRestaurant";
	}
}
