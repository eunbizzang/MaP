package com.spring.map;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.spring.model.Map_eventDAO;
import com.spring.model.Map_eventDTO;
import com.spring.model.PageDTO;

@Controller
public class EventController {

	@Autowired
	private Map_eventDAO dao;
	
	private final int rowsize = 10;    //한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;       //DB상의 전체 게시물 수
	
	@RequestMapping("map_event_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		//현재 페이지 변수
		int page;  
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음 리스트 페이지를 누른 경우
		}
		
		//DB상의 진행중인 이벤트 리스트만 가져오는 메서드 호출.
		totalRecord = this.dao.getEventListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		//페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<Map_eventDTO> List = this.dao.getEventList(dto);
		
		model.addAttribute("List", List);
		model.addAttribute("Paging", dto);
		
		return "map_event_list";
	}
	
	@RequestMapping("event_content.do")
	public String cont(@RequestParam("bno") int bno, 
				@RequestParam("page") int nowPage, Model model) {
		
		//조회수 증가 메서드 호출
		this.dao.hitCount(bno);
		
		//게시글 상세 내역 조회하는 메서드 호출
		Map_eventDTO dto = this.dao.eventCont(bno);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("page", nowPage);
		
		System.out.println("파일경로 >>> " + dto.getBpath());
		
		return "map_event_content";
	}
	
	@RequestMapping("end_event_list.do")
	public String endList(HttpServletRequest request, Model model) {
		
		//현재 페이지 변수
		int page;  
				
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음 리스트 페이지를 누른 경우
		}
		
		//DB상의 종료된 이벤트 리스트만 가져오는 메서드 호출
		totalRecord = this.dao.endEventListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		//페이지에 해당하는 게시물 가져오는 메서드.
		List<Map_eventDTO> list = this.dao.endEventList(dto);
		
		model.addAttribute("endList", list);
		model.addAttribute("Paging", dto);
		
		return "map_event_endList";
	}
	
	@RequestMapping("map_event_admin.do")
	public String adminEvent(HttpServletRequest request, Model model) {
		
		//현재 페이지 변수
		int page;  
				
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음 리스트 페이지를 누른 경우
		}
		
		//DB상의 전체 이벤트 리스트를 가져오는 메서드 호출
		totalRecord = this.dao.allEventListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		//페이지에 해당하는 게시물 가져오는 메서드.
		List<Map_eventDTO> allList = this.dao.allEventList(dto);
		
		model.addAttribute("allList", allList);
		model.addAttribute("Paging", dto);
		
		return "admin_event_list";
	}
	
	@RequestMapping("event_write.do")
	public String eventInsert() {
		return "admin_event_insert";
	}
	
	@RequestMapping("event_upload.do")
	public void eventInsertOk(Map_eventDTO dto,
			HttpServletResponse response, MultipartFile file) throws Exception {
	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(!file.isEmpty()) {
			String uploadPath = 
					"C:\\NCS\\workspace(spring)\\MaP\\src\\main\\webapp\\resources\\upload\\";
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DATE);
			
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			//고유 식별자 생성
			UUID uuid = UUID.randomUUID();
			
			String fileName = uuid + "_" + file.getOriginalFilename();
			
			String finalName = year + "-" + month + "-" + day +"\\"+ fileName;
			
			File saveFile = new File(homedir, fileName);
			
			file.transferTo(saveFile);
			
			dto.setBupload(fileName);
			dto.setBpath(finalName);
		}else {
			dto.setBupload("");
			dto.setBpath("");
		}
		
		int check = this.dao.insertEvent(dto);
			
		if(check > 0) {
			out.println("<script>");
			out.println("alert('이벤트 추가 성공!!')");
			out.println("location.href='map_event_admin.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('이벤트 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("admin_event_content.do")
	public String adminEventcont(@RequestParam("bno") int bno, 
			@RequestParam("page") int nowPage, Model model) {
		
		//게시글 상세 내역 조회하는 메서드 호출
		Map_eventDTO dto = this.dao.eventCont(bno);
				
		model.addAttribute("adminCont", dto);
		model.addAttribute("page", nowPage);
		
		
				
		return "admin_event_content";
	}
	
	@RequestMapping("admin_event_delete.do")
	public void eventDelete(@RequestParam("bno") int bno, 
				@RequestParam("page") int nowPage, 
				HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteEvent(bno);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			this.dao.updateSequence(bno);
			
			out.println("<script>");
			out.println("alert('이벤트 삭제 완료!')");
			out.println("location.href='map_event_admin.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('이벤트 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("admin_event_update.do")
	public String eventmodify(@RequestParam("bno") int bno, 
				@RequestParam("page") int nowPage, Model model) {
		
		//게시글 상세 내역 조회하는 메서드 호출.
		Map_eventDTO dto = this.dao.eventCont(bno);
		
		model.addAttribute("modify", dto);
		model.addAttribute("page", nowPage);
		
		return "admin_event_updateForm";
	}
	
	//미완성
	@RequestMapping("admin_event_update_ok.do")
	public void eventmodifyOk(Map_eventDTO dto, @RequestParam("page") int nowPage,
			HttpServletResponse response, MultipartFile file) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// 파일을 수정하지 않은 경우
		if(file.isEmpty()) {
			int check = this.dao.updateEvent(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('이벤트 수정 성공')");
				out.println("location.href='admin_event_content.do?bno="+dto.getBno()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('이벤트 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else {  // 파일을 수정한 경우
			String uploadPath = 
					"C:\\NCS\\workspace(spring)\\MaP\\src\\main\\webapp\\resources\\upload\\";
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DATE);
			
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			//고유 식별자 생성
			UUID uuid = UUID.randomUUID();
			
			String fileName = uuid + "_" + file.getOriginalFilename();
			
			String finalName = year + "-" + month + "-" + day +"\\"+ fileName;
			
			File saveFile = new File(homedir + "/" +fileName);
			
			file.transferTo(saveFile);
			
			dto.setBupload(fileName);
			dto.setBpath(finalName);
			
			int check = this.dao.updateFileEvent(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('이벤트 수정 성공')");
				out.println("location.href='admin_event_content.do?bno="+dto.getBno()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('이벤트 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}
}
