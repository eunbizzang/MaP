package com.spring.map;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.BoardDTO;
import com.spring.model.PageDTO;
import com.spring.model.ReviewLikeDTO;
import com.spring.model.ReviewReplyDTO;
import com.spring.model.BoardDAO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	private final int rowsize = 10;        // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;          // DB 상의 게시물 전체 수

	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	
	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		String keyword;	// 키워드 변수
		int page;  // 현재 페이지 변수
		
		// 검색 키워드 확인
		if(request.getParameter("keyword") != null) {
			// 넘어온 검색 키워드 값이 있을 경우, keyword 변수에 저장 
			keyword = request.getParameter("keyword");
		}else {
			// 없을 경우 null을 저장
			keyword = null;
		}
		
        // 넘어온 페이지 변수가 있는지 확인
		if(request.getParameter("page") != null) {
			// 넘어온 페이지 값이 있을 경우, page변수에 저장.
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// 넘어온 값이 없을 경우, 1을 저장.
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		// id세션값 확인
		// id세션 없을경우 id값에 빈 값을 입력
		HttpSession session = request.getSession();
		String id = "";
		if(session.getAttribute("id") !=null) {
			id = (String) session.getAttribute("id");	
		}
		
		// 검색키워드 없는 경우
		if(keyword==null) {
			
			// DB 상의 전체 게시물의 수를 확인하는 작업
			totalRecord = this.dao.getListCount();
			// 페이징처리
			PageDTO dto = new PageDTO(page, rowsize, totalRecord);
					
			// 페이지에 해당하는 게시물을 가져오는 메서드 호출
			List<BoardDTO> pageList = this.dao.getBoardList(dto);
			System.out.println(pageList);
			
			// 게시물이 있는 경우
			if(!pageList.isEmpty()) {
						
				// 로그인을 한 경우
				if(!id.equals("")) {
					
					// 현재 페이지에 맞는 좋아요 리스트 불러오기위한 데이터set
					Map<String, Object> likelist = new HashMap<String, Object>();
					
					// 현재 페이지, 아이디 설정
					likelist.put("start", pageList.get(pageList.size()-1).getBno());
					likelist.put("end", pageList.get(0).getBno());
					likelist.put("id", id);

					// 설정한 데이터에 맞는 현재 페이지의 like리스트 불러오는 메서드 호출
					List<Integer> likecheck = this.dao.getListLike(likelist);
	
					// 페이지의 게시물번호를 확인해서 로그인 한 아이디의 like여부를 저장
					// like 했으면 1 안 했으면 0
					for(int i=0; i<pageList.size(); i++) {
						if(likecheck.contains(pageList.get(i).getBno())) {
							pageList.get(i).setBchecklike(1);
						}else {
							pageList.get(i).setBchecklike(0);
						}
					}
				}
			}
			
			// 게시물리스트
			model.addAttribute("List", pageList);
			// 페이징 정보
			model.addAttribute("Paging", dto);
			System.out.println("keyword>>>" + dto.getKeyword());
		// 검색 키워드 값이 있는 경우
		}else {

			System.out.println("검색한 키워드 >>>" + keyword);
			// DB 상의 전체 게시물의 수를 확인하는 작업(with keyword)
			totalRecord = this.dao.getKListCount(keyword);
			
			// 페이징 처리 (with keyword)
			PageDTO dto = new PageDTO(page, rowsize, totalRecord, "", keyword);
			
			// 페이지에 해당하는 게시물을 가져오는 메서드 호출(with keyword)
			List<BoardDTO> pageList = this.dao.getKBoardList(dto);

			// 게시물이 있는 경우
			if(!pageList.isEmpty()) {
			
				// 로그인 한 경우
				if(!id.equals("")) {
					
					// 현재 페이지에 맞는 좋아요 리스트 불러오기위한 데이터set
					Map<String, Object> likelist = new HashMap<String, Object>();

					// 현재 페이지, 아이디 설정
					likelist.put("start", pageList.get(pageList.size()-1).getBno());
					likelist.put("end", pageList.get(0).getBno());
					likelist.put("id", id);
					
					System.out.println(likelist);
		
					// 설정한 데이터에 맞는 현재 페이지의 like리스트 불러오는 메서드 호출
					List<Integer> likecheck = this.dao.getListLike(likelist);
					System.out.println(likecheck);

					// 페이지의 게시물번호를 확인해서 로그인 한 아이디의 like여부를 저장
					// like 했으면 1 안 했으면 0
					for(int i=0; i<pageList.size(); i++) {
						if(likecheck.contains(pageList.get(i).getBno())) {
							pageList.get(i).setBchecklike(1);
						}else {
							pageList.get(i).setBchecklike(0);
						}
					}
				}
			}

			System.out.println("keyword>>>" + dto.getKeyword());
			model.addAttribute("List", pageList);
			model.addAttribute("Paging", dto);
		}
		return "board_list";
		
	}
	
	
	@RequestMapping(value="/board_writeForm", method=RequestMethod.GET)
	public void boardwriteForm() {
		// board_writeForm으로 포워딩
	}
	
	@RequestMapping(value="/board_writeForm",produces = "text/plain;charset=UTF-8", method=RequestMethod.POST)
	public String uploadForm(BoardDTO dto) throws Exception {
		
		if(!dto.getUploadFile().isEmpty()) {
			String savedName = dto.getUploadFile().getOriginalFilename();
			savedName = uploadFile(savedName, dto.getUploadFile().getBytes());
			dto.setBfile_name( year + "-" + month + "-" + day + "/" +savedName);
		}else {
			dto.setBfile_name("");
		}
		
		this.dao.insertBoard(dto);
		
		return "redirect:/board_list.do";
	}
	
	// 파일명 랜덤생성 메서드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		// 실제 폴더를 만들어 보자.
		// .....\\resources\\upload\\2021-12-24
		String homedir = uploadPath + year + "-" + month + "-" + day;
					
		File path1 = new File(homedir);
					
		if(!path1.exists()) {
			path1.mkdirs();
		}
					
		// uuid생성
		UUID uuid = UUID.randomUUID();
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(homedir+"/", savedName);
		// 임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	
	@RequestMapping("board_content.do")
	public String cont(Model model, HttpServletRequest request) {
		
		int bno = Integer.parseInt(request.getParameter("no"));
        int nowPage = Integer.parseInt(request.getParameter("page"));
        String keyword = request.getParameter("keyword");
		
		// 조회수 증가시키는 메서드 호출
		this.dao.readCount(bno);
		
		// 게시글 상세 내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(bno);
		
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			// 좋아요 확인을 위한 데이터 저장
			ReviewLikeDTO likedto = new ReviewLikeDTO();
			likedto.setBno(bno);
			likedto.setId((String)session.getAttribute("id"));
			
			// 게시글 좋아요 확인하는 메서드 호출
			int testlike = this.dao.selectLike(likedto);
			
			model.addAttribute("liked", testlike);
		}
		
		// 게시글 댓글 내역 조회하는 메서드 호출
		List<ReviewReplyDTO> rdto = this.dao.replyList(bno);		
		
		// 페이지 데이터 담기
		PageDTO pdto = new PageDTO(nowPage, bno, nowPage, "", keyword);
		
		System.out.println("keyword" + keyword);
		BoardDTO leftboard = null;
		BoardDTO rightboard = null;
		
		// 전글 후글 게시글 데이터 설정
		leftboard = this.dao.getLeftBoard(bno);
		rightboard = this.dao.getRightBoard(bno);
		
		model.addAttribute("leftboard", leftboard);
		
		model.addAttribute("rightboard", rightboard);
		
		model.addAttribute("rlist", rdto);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("pnk", pdto);
		
		return "board_content";
	}
	
	
	@ResponseBody
	@RequestMapping(value="board_reviewlike.do")
	public Map<String, Object> clickLike(@RequestParam("bno") int bno, @RequestParam("id") String id){
        int resultCode = 1;
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        ReviewLikeDTO likedto = new ReviewLikeDTO();
		likedto.setBno(bno);
		likedto.setId(id);
		System.out.println(bno);
		System.out.println(id);
		// 게시글 좋아요 확인하는 메서드 호출
		int testlike = this.dao.selectLike(likedto);
		
		try {
			if(testlike == 0) {
				// 좋아요 테이블 인서트
				this.dao.boardLike(likedto);
				// 테이블 업데이트 +1
				this.dao.plusLike(bno);
				
				int likecheck = 1;
				resultMap.put("likecheck", likecheck);
				System.out.println("좋아요 했음");
			}else {
				// 좋아요 테이블 삭제
				this.dao.boardDislike(likedto);
				// 테이블 업데이트 -1
				this.dao.minusLike(bno);

				int likecheck = -1;
				resultMap.put("likecheck", likecheck);
				System.out.println("좋아요 취소 했음");
			}
			resultCode = 0;
		}catch(Exception e) {
            resultCode = -1;
            System.out.println(e.getMessage() + "에서 예외를 받았습니다.");
		}
		
		// 갱신된 게시글 좋아요 수 확인하는 메서드 호출
		// 게시글 상세 내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(bno);
		int nowlike = dto.getBlike();		
		System.out.println(nowlike);
		
		resultMap.put("likecnt", nowlike);
		resultMap.put("resultCode", resultCode);
		
		System.out.println(resultMap);
		return resultMap;
		
    }

	
	@RequestMapping("board_delete.do")
	public String delete(@RequestParam("no") int bno, @RequestParam(value="keyword", required=false) String keyword,
			@RequestParam("page") int nowPage) {

		System.out.println("board_delete.do");
		// 게시글 상세 내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(bno);
		System.out.println();
		// 파일 삭제
		File file = new File(uploadPath +dto.getBfile_name());
		if(file.exists()) { 
			// 파일이 존재하면 
			if(file.delete()){ 
				System.out.println("파일삭제 성공"); 
				}else{ 
					System.out.println("파일삭제 실패"); 
					} 
		}else{ 
			System.out.println("파일이 존재하지 않습니다."); 
			
		}
		// 게시물 삭제하는 메서드 호출
		this.dao.deleteBoard(bno);
        
		return "forward:board_list.do?page="+nowPage+"&keyword="+keyword;
	}
	
	
	@RequestMapping("board_edit.do")
	public String edit(@RequestParam("no") int bno, @RequestParam("page") int nowPage,
			@RequestParam(value="keyword", required=false) String keyword, Model model) {

		System.out.println("board_edit.do");
		// 게시글 상세 내역 조회하는 메서드 호출
		BoardDTO dto = this.dao.boardCont(bno);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("page", nowPage);
		
		model.addAttribute("keyword", keyword);
		
		return "board_edit";
	}
	
	@RequestMapping("board_edit_ok.do")
	public String editOk(BoardDTO dto, @RequestParam("page") int nowPage, 
			@RequestParam(value="keyword", required=false) String keyword, Model model) throws IOException, Exception {

		System.out.println("board_edit_ok.do");
		if(!dto.getUploadFile().isEmpty()) {
			System.out.println("첨부있다");
			
			// 원래 첨부 된 파일 삭제
			File file = new File(uploadPath +dto.getBfile_name());
			if(file.exists()) { 
				file.delete(); 
			}
			
			// 파일 첨부 된 경우 파일 생성
			String savedName = dto.getUploadFile().getOriginalFilename();
			savedName = uploadFile(savedName, dto.getUploadFile().getBytes());
			dto.setBfile_name( year + "-" + month + "-" + day + "/" +savedName);
			
		}else {
			System.out.println("첨부없다");
			dto.setBfile_name("");
		}
		
		System.out.println("filename" + dto.getBfile_name());
		// 게시글 수정 메서드 호출
		int i = this.dao.boardEdit(dto);
		if(i>0) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		
		
		return "forward:board_content.do?no="+dto.getBno()+"&page="+nowPage+"&keyword="+keyword;
	}
	
	@RequestMapping("comment_insert.do")
	public String comment(ReviewReplyDTO dto, @RequestParam("page") int nowPage,
			@RequestParam(value="keyword", required=false) String keyword, Model model) {

		System.out.println("comment_insert.do");
		
		// 댓글 입력 메서드 호출
		this.dao.boardComment(dto);
		
		// 댓글수 증가시키는 메서드 호출
		this.dao.commentCount(dto.getBno());
				
		
		return "forward:board_content.do?no="+dto.getBno()+"&page="+nowPage+"&keyword="+keyword;
	}
	@RequestMapping("comment_delete.do")
	public String commentDelete(@RequestParam("bno") int bno, @RequestParam("no") int no, 
			@RequestParam("page") int nowPage, @RequestParam(value="keyword", required=false) String keyword, Model model) {

		System.out.println("comment_delete.do");
		// 댓글 삭제 메서드 호출
		this.dao.boardCommentDelete(no);
		
		// 댓글수 감소시키는 메서드 호출
		this.dao.commentDown(bno);
				
		
		return "forward:board_content.do?no="+bno+"&page="+nowPage+"&keyword="+keyword;
	}
	
	@RequestMapping("comment_update.do")
	public String commentUpdate(ReviewReplyDTO dto, @RequestParam("bno") int bno,
			@RequestParam("page") int nowPage, @RequestParam(value="keyword", required=false) String keyword) {
	
		System.out.println("comment_update.do");
		// 댓글 수정 메서드 호출
		this.dao.replyUpdate(dto);
				
		return "forward:board_content.do?no="+bno+"&page="+nowPage+"&keyword="+keyword;
	}
}
