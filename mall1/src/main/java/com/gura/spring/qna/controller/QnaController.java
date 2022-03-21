package com.gura.spring.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gura.spring.users.UsersServiceImpl;

import com.gura.spring.users.UsersDto;
import com.gura.spring.qna.service.QnaPage;
import com.gura.spring.qna.service.QnaServiceImpl;
import com.gura.spring.qna.service.QnaVO;

@Controller
public class QnaController {
	@Autowired private com.gura.spring.qna.service.QnaServiceImpl service;
	@Autowired private UsersServiceImpl users;
	@Autowired private com.gura.spring.qna.service.QnaPage page;
	
	//글 목록
	@RequestMapping("/list.qna")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage, String search, String keyword) {
		//QNA 클릭 하면 관리자로 자동 로그인
		HashMap<String, String> map = new HashMap<String, String>();
		//HashMap : 데이터를 담을 자료 구조
		map.put("id", "admin");
		map.put("pw", "1234");
		session.setAttribute("login_info", users.member_login(map));
		session.setAttribute("category", "qna");
		
		//DB에서 글 목록 조회해와 화면에 출력
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.qna_list(page));
		
		return "qna/list";
	}
	
	//신규 글 작성 화면 요청=========================================================
	@RequestMapping("/new.qna")
	public String qna() {
		return "qna/new";
	}
	
	//신규 글 저장 처리 요청
	@RequestMapping("/insert.qna")
	public String insert(MultipartFile file, com.gura.spring.qna.service.QnaVO vo, HttpSession session) {
		//첨부한 파일을 서버 시스템에 업로드하는 처리
		if(!file.isEmpty()) {
			vo.setFilepath(upload("qna", file, session));
			vo.setFilename(file.getOriginalFilename());
		}
		
		vo.setWriter( ((UsersDto) session.getAttribute("login_info")).getId() );
		//화면에서 입력한 정보를 DB에 저장한 후
		service.qna_insert(vo);
		//목록 화면으로 연결
		return "redirect:list.qna";
	}
	
	//QNA 글 상세 화면 요청
	@RequestMapping("/detail.qna")
	public String detail(int id, Model model) {
		//선택한 QNA 글에 대한 조회수 증가 처리
		service.qna_read(id);
		
		//선택한 QNA 글 정보를 DB에 조회해와 상세 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		
		return "qna/detail";
	} //detail()
	
	//첨부 파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.qna")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		com.gura.spring.qna.service.QnaVO vo = service.qna_detail(id);
		download(vo.getFilename(), vo.getFilepath(), session, response);
	} // download()
	
	//QNA 글 삭제 처리 요청
	@RequestMapping("/delete.qna")
	public String delete(int id, HttpSession session) {
		//선택한 QNA 글에 첨부한 파일이 있다면 서버의 물리적 영역에서 해당 파일도 삭제한다
		com.gura.spring.qna.service.QnaVO vo = service.qna_detail(id);
		if(vo.getFilepath() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + vo.getFilepath());
			if( file.exists() ) { file.delete(); }
		}
		
		//선택한 QNA 글을 DB에서 삭제한 후 목록 화면으로 연결
		service.qna_delete(id);
		
		return "redirect:list.qna";
	} //delete()
	
	//QNA 글 수정 화면 요청
	@RequestMapping("/modify.qna")
	public String modify(int id, Model model) {
		//선택한 QNA 글 정보를 DB에서 조회해와 수정 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		return "qna/modify";
	} //modify()
	
	//QNA 글 수정 처리 요청
	@RequestMapping("/update.qna")
	public String update(com.gura.spring.qna.service.QnaVO vo, MultipartFile file, HttpSession session, String attach) {
		//원래 글의 첨부 파일 관련 정보를 조회
		com.gura.spring.qna.service.QnaVO qna = service.qna_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + qna.getFilepath();
		
		//파일을 첨부한 경우 - 없었는데 첨부 / 있던 파일을 바꿔서 첨부
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(upload("qna", file, session));
			
			//원래 있던 첨부 파일은 서버에서 삭제
			if(qna.getFilename() != null) {
				File f = new File(uuid);
				if (f.exists()) { f.delete(); }
			}
		} else {
			//원래 있던 첨부 파일을 삭제됐거나 원래부터 첨부 파일이 없었던 경우
			if(attach.isEmpty()) {
				//원래 있던 첨부 파일은 서버에서 삭제
				if(qna.getFilename() != null) {
					File f = new File(uuid);
					if (f.exists()) { f.delete(); }
				}
				

			} else { //원래 있던 첨부 파일을 그대로 사용하는 경우
				vo.setFilename(qna.getFilename());
				vo.setFilepath(qna.getFilepath());
			}
		}
		
		//화면에서 변경한 정보를 DB에 저장한 후 상세 화면으로 연결
		service.qna_update(vo);
		
		return "redirect:detail.qna?id=" + vo.getId();
	} //update()
	
	//답글 쓰기 화면 요청==================================================================
	@RequestMapping("/reply.qna")
	public String reply(Model model, int id) {
		//원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
		model.addAttribute("vo", service.qna_detail(id));
		
		return "qna/reply";
	} //reply()
	
	//신규 답글 저장 처리 요청==============================================================
	@RequestMapping("/reply_insert.qna")
	public String reply_insert(com.gura.spring.qna.service.QnaVO vo, HttpSession session, MultipartFile file) {
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(upload("qna", file, session));
		}
		vo.setWriter(((UsersDto) session.getAttribute("login_info")).getId());
		
		//화면에서 입력한 정보를 DB에 저장한 후 목록 화면으로 연결
		service.qna_reply_insert(vo);
		return "redirect:list.qna";
	} //reply_insert()
	
	public String upload(String category, MultipartFile file, HttpSession session) {
		//서버의 업로드할 물리적 위치
		// workspace/.metadata/....../wtpwebapps/iot/resources
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		
		//폴더가 없다면 폴더를 생성
		File f = new File(folder);
		if(!f.exists()) { f.mkdirs(); } //폴더가 존재하지 않으면 경로 생성
		
		//동시 다발적 동일명의 파일 업로드를 위한 고유 ID 부여: afd324adfa_abc.txt
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo( new File(folder, uuid) );
		} catch (Exception e) {
			System.out.println(e.getMessage());		
		}
		
		// /upload/.../asdfadsfsa_abc.txt ▶ 업로드한 파일의 경로를 반환
		// ① folder.replace(resources, "")
		// ② folder.substring(resources.length()) + "/" + uuid;
		return folder.substring(resources.length()) + "/" + uuid;
	} //upload()
	
	//첨부 파일 다운로드 처리///////////////////////////////////////////////////////
	public File download(String filename, String filepath, HttpSession session, HttpServletResponse response) {
		File file = new File(session.getServletContext().getRealPath("resources") + filepath);
		//filepath에 resources/ << 슬래쉬부터의 경로가 저장되어 있다
		String mime = session.getServletContext().getMimeType(filename);
		
		response.setContentType(mime);
		
		try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			// + 는 기호라 \ 필요, \ 또한 기호라 \ 필요
			// %20 = 스페이스바
			
			response.setHeader("content-disposition", "attachment; filename=" + filename);
			
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	} //download()
}	

