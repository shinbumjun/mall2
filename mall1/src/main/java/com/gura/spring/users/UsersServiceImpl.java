package com.gura.spring.users;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.movie.dao.MovieDao;
import com.gura.spring.movie.dto.MovieDto;


@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private MovieDao moviedao;
	@Autowired
	private UsersDao dao;
	@Override
	public Map<String, Object> isExistId(String inputId) {
		//Map 객체를 생성해서 
		Map<String, Object> map=new HashMap<String, Object>();
		//isExist 라는 키값으로 아이디가 존재하는지 여부를 담고 
		map.put("isExist", dao.isExist(inputId));
		//Map 객체를 리턴해 준다. 
		return map;
	}

	@Override
	public void addUser(UsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);

		dao.insert(dto);
	}

	@Override
	public void loginProcess(UsersDto dto, HttpSession session) {
		//입력한 정보가 맞는여부
				boolean isValid=false;
				
				//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 해 본다. 
				UsersDto result=dao.getData(dto.getId());
				if(result != null) {//만일 존재하는 아이디 라면
					//비밀번호가 일치하는지 확인한다.
					String encodedPwd=result.getPwd(); //DB 에 저장된 암호화된 비밀번호 
					String inputPwd=dto.getPwd(); //로그인폼에 입력한 비밀번호
					//Bcrypt 클래스의 static 메소드를 이용해서 일치 여부를 얻어낸다.
					isValid=BCrypt.checkpw(inputPwd, encodedPwd);
				}
				
				if(isValid) {//만일 유효한 정보이면 
					//로그인 처리를 한다.
					session.setAttribute("id", dto.getId());
				}
	}

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		UsersDto dto=dao.getData(id);
		mView.addObject("dto",dto);
	}

	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView) {
		//세션 영역에서 로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		//DB 에 저장된 회원정보 얻어오기
		UsersDto resultDto=dao.getData(id);
		//DB 에 저장된 암호화된 비밀 번호
		String encodedPwd=resultDto.getPwd();
		//클라이언트가 입력한 비밀번호
		String inputPwd=dto.getPwd();
		//두 비밀번호가 일치하는지 확인
		boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		//만일 일치 한다면
		if(isValid) {
			//새로운 비밀번호를 암호화 한다.
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedNewPwd=encoder.encode(dto.getNewPwd());
			//암호화된 비밀번호를 dto 에 다시 넣어준다.
			dto.setNewPwd(encodedNewPwd);
			//dto 에 로그인된 아이디도 넣어준다.
			dto.setId(id);
			//dao 를 이용해서 DB 에 수정 반영한다.
			dao.updatePwd(dto);
			//로그아웃 처리
			session.removeAttribute("id");
		}
		//작업의 성공여부를 ModelAndView 객체에 담아 놓는다(결국 HttpServletRequest 에 담긴다)
		mView.addObject("isSuccess", isValid);
		//로그인된 아이디도 담아준다.
		mView.addObject("id", id);
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	

		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;

		// webapp/upload 폴더까지의 실제 경로 얻어내기 
		String realPath=request.getServletContext().getRealPath("/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}

		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);

		return map;
	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.update(dto);
	}

	@Override
	public void getList(HttpServletRequest request) {
		final int PAGE_ROW_COUNT=10;
		final int PAGE_DISPLAY_COUNT=5;
		
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum!=null) {
			pageNum=Integer.parseInt(strPageNum);
		}
		
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		String idWord=request.getParameter("idWord");
		if(idWord==null) {
			idWord="";
		}
		
		String encodedK=URLEncoder.encode(idWord);
		
		UsersDto dto=new UsersDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		if(!idWord.equals("")) {
			dto.setIdWord(idWord);
		}
		
		List<UsersDto> list=dao.userList(dto);
		int totalRow=dao.getCount(dto);
		
		int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		if(endPageNum>totalPageCount) {
			endPageNum=totalPageCount;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageNum", totalPageCount);
		request.setAttribute("idWord", idWord);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void deleteUser2(String id, HttpServletRequest request) {
		UsersDto dto=dao.getData(id);
		dao.delete2(id);
	}
	
	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		dao.delete(id);
		session.removeAttribute("id");
		mView.addObject("id",id);
	}

	@Override
	public void upgraded(String id, HttpServletRequest request) {
		dao.upgrade(id);
	}

	@Override
	public void chargePoint(HttpSession session, UsersDto dto, ModelAndView mView) {
		//세션 영역에서 로그인된 아이디 읽어오기
		String id=(String)session.getAttribute("id");
		//DB 에 저장된 회원정보 얻어오기
		UsersDto resultDto=dao.getData(id);
		//DB 에 저장된 포인트
		int point=resultDto.getPoint();
		//클라이언트가 입력한 포인트
		int newpoint =dto.getPoint();
	
		int sumPoint = point + newpoint;
		
		dto.setPoint(sumPoint);
		//dto 에 로그인된 아이디도 넣어준다.
		dto.setId(id);
		//dao 를 이용해서 DB 에 수정 반영한다.
		dao.chargePoint(dto);
	
		mView.addObject("id", id);
	}
	
	@Override
	public void buyMovie(HttpSession session, UsersDto dto, ModelAndView mView, MovieDto moviedto, int num,HttpServletRequest request) {
		//세션 영역에서 로그인된 아이디 읽어오기
				String id=(String)session.getAttribute("id");
				//DB 에 저장된 회원정보 얻어오기
				UsersDto resultDto=dao.getData(id);
				//DB 에 저장된 포인트
				int point=resultDto.getPoint();
				//영화 가격
				MovieDto moviedto1 = moviedao.getData(num);
				int movieprice =moviedto1.getPrice();
				
				//전달 값
				request.setAttribute("point", point);
				request.setAttribute("price", movieprice);
				request.setAttribute("num", num);
				
				if (point>=movieprice) {
					int resultPoint = point - movieprice;
					dto.setPoint(resultPoint);
					//dto 에 로그인된 아이디도 넣어준다.
					dto.setId(id);
					//dao 를 이용해서 DB 에 수정 반영한다.
					dao.buyMovie(dto);
					mView.addObject("id", id);
					request.setAttribute("newpoint", resultPoint);
				}
				
	}

	public Object member_login(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
