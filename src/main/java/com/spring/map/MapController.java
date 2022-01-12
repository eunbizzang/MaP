package com.spring.map;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.PageDTO;
import com.spring.model.FreeReplyDTO;
import com.spring.model.Free_boardDAO;
import com.spring.model.Free_boardDTO;

@Controller
public class MapController {
	

	
	@Autowired
	private Free_boardDAO dao;
	
	private final int rowsize = 10;        // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;          // DB 상의 게시물 전체 수
	
	@RequestMapping("free_board_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		int page;  // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		List<Free_boardDTO> list = this.dao.getFree_boardList(dto);
		
		model.addAttribute("LIST", list);
		model.addAttribute("Paging", dto);
		
		return "free_board_list";
	
	}
	
	@RequestMapping("free_board_write.do")
	public String write() {
		
		return "free_board_write";
		
	}
	
		
	@RequestMapping("free_board_content.do")
	public String cont(@RequestParam("no") int bno,
			@RequestParam("page") int nowPage, Model model) {
		
		// 조회수 증가시키는 메서드 호출
		this.dao.readCount(bno);
		
		// 게시글 상세 내역 조회하는 메서드 호출
		Free_boardDTO dto = this.dao.Free_boardCont(bno);
		
		// 게시글 댓글 내역 조회하는 메서드
		List<FreeReplyDTO> rdto = this.dao.getReplyList(bno);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("page", nowPage);
		
		model.addAttribute("rlist", rdto);
		
		return "free_board_content";
		
	}
	@RequestMapping("free_board_update.do")
	public String modify(@RequestParam("no") int bno, 
			@RequestParam("page") int nowPage, Model model) {
		
		//게시글 상세 내역을 조회하는 메서드 호출
		Free_boardDTO dto = this.dao.Free_boardCont(bno);
		
		model.addAttribute("modify", dto);
		
		model.addAttribute("page", nowPage);
		
		return "free_board_update";
	}
	
	@RequestMapping("free_board_update_ok.do")
	public void modifyOk(Free_boardDTO dto,
			@RequestParam("page") int nowPage, HttpServletResponse response,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		MultipartFile mf = mRequest.getFile("file_new");
		
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

					dto.setBuploadd(finalname);
	              dto.setBupload(originalFileName);
			
			// 다 작성되었을 경우 그대로 진행 
			int check = this.dao.updateFree_board(dto);
						
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공')");
				out.println("location.href='free_board_content.do?no="+dto.getBno()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		// 파일 추가 안했을때 진행
		} else if(mf.isEmpty()) {
			
			
							
			int check = this.dao.updateFree_board(dto);
						
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공')");
				out.println("location.href='free_board_content.do?no="+dto.getBno()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}

	}
	@RequestMapping("free_board_delete.do")
	public void delete(@RequestParam("no") int bno,@RequestParam("page") int nowPage,
					HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteFree_board(bno);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.dao.updateSequence(bno);
			
			out.println("<script>");
			out.println("alert('글 삭제 성공')");
			out.println("location.href='free_board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('글 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
				
	}
	
	@RequestMapping("free_board_search.do")
	public String search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,
			@RequestParam("page") int nowPage, Model model) {
		
		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchBoardCount(field, keyword);
		
		PageDTO dto = 
				new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
		
		System.out.println("검색 게시물 수 >>> " + dto.getTotalRecord());
		System.out.println("전체 페이지 수 >>> " + dto.getAllPage());
		
		// 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<Free_boardDTO> searchList = this.dao.searchBoardList(dto);
		
		model.addAttribute("searchPageList", searchList);
		
		model.addAttribute("paging", dto);
	
		return "free_board_search";
		
	}
	 @RequestMapping("free_board_write_ok.do")
	   public void writeOk(Free_boardDTO dto,
	         HttpServletResponse response,
	         MultipartHttpServletRequest mRequest) throws IOException {
	      
	      response.setContentType("text/html; charset=UTF-8");
	      
	      PrintWriter out = response.getWriter();
	      
	      // 지정구역을 안정한 경우 돌려보내기
	         
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

	               dto.setBuploadd(finalname);
	               dto.setBupload(originalFileName);
	            
	            // 다 작성되었을 경우 그대로 진행 
	            int check = this.dao.insertFree_board(dto);
	                     
	            if(check > 0) {
	               out.println("<script>");
	               out.println("alert('게시물 추가 성공!!!')");
	               out.println("location.href='free_board_list.do'");
	               out.println("</script>");
	            }else {
	               out.println("<script>");
	               out.println("alert('게시물 추가 실패~~')");
	               out.println("history.back()");
	               out.println("</script>");
	            }
	            
	         } else if(mf==null) {
	            
	        	dto.setBuploadd("");
	            dto.setBupload("");

	            // 다 작성되었을 경우 그대로 진행 
	            int check = this.dao.insertFree_board(dto);
	                     
	            if(check > 0) {
	               out.println("<script>");
	               out.println("alert('게시물 추가 성공!!!')");
	               out.println("location.href='free_board_list.do'");
	               out.println("</script>");
	            }else {
	               out.println("<script>");
	               out.println("alert('게시물 추가 실패~~')");
	               out.println("history.back()");
	               out.println("</script>");
	            }
	            
	         }
	         


     
	   }
	 @RequestMapping("free_reply_write.do")
		
	 public String replywrite(FreeReplyDTO dto,
			 @RequestParam("page") int nowPage,
			 @RequestParam("keyword")String keyword,Model model,
			 HttpServletRequest request) throws IOException {
			this.dao.insertReply(dto);
			Free_boardDTO bdto = this.dao.Free_boardCont(dto.getBno());
			List<FreeReplyDTO> rdto = this.dao.getReplyList(dto.getBno());
			model.addAttribute("Cont", bdto);
			
			model.addAttribute("rlist", rdto);
			
			model.addAttribute("page", nowPage);
			
			model.addAttribute("keyword", keyword);
			
			return "free_board_content";

			
		}
	 @RequestMapping("free_reply_delete.do")
	 public String replydelete(@RequestParam("no") int no,@RequestParam("bno") int bno,
			 HttpServletRequest request,
			 @RequestParam("page") int nowPage,
			 @RequestParam("keyword")String keyword, Model model) {
	
		 	this.dao.deleteReply(no);
		 	Free_boardDTO bdto = this.dao.Free_boardCont(bno);
			List<FreeReplyDTO> rdto = this.dao.getReplyList(bno);
			model.addAttribute("Cont", bdto);
			
			model.addAttribute("rlist", rdto);
			
			model.addAttribute("page", nowPage);
			
			model.addAttribute("keyword", keyword);
			
			return "free_board_content";
		}
	 @RequestMapping("free_reply_update.do")
	 public String replymodify(@RequestParam("no") int no, Model model) {
			
			//게시글 상세 내역을 조회하는 메서드 호출
		 	FreeReplyDTO rdto = this.dao.Free_replyCont(no);
			
			model.addAttribute("replymodify", rdto);
			
			
			return "free_reply_board_update";
	
	 }
	 @RequestMapping("free_reply_board_update_ok.do")
	 public void modifyOk(FreeReplyDTO dto, HttpServletResponse response) throws IOException {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
				
				int check = this.dao.updateReply(dto);
				
				if(check > 0) {
					out.println("<script>");
					out.println("alert('댓글 수정 성공')");
					out.println("location.href='free_board_list.do'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('댓글 수정 실패')");
					out.println("history.back()");
					out.println("</script>");
				}

	 }
}