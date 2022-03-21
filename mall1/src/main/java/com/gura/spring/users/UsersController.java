package com.gura.spring.users;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.movie.dto.MovieDto;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;

	
	@RequestMapping("/users/loginform")
	public String loginform() {
	
		return "/users/loginform";
	}
	
	@RequestMapping("/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto, String url, HttpSession session) {
		
		service.loginProcess(dto, session);
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		mView.setViewName("users/login");
		
		return mView;
	}
	
	@RequestMapping("/users/signupform")
	public String signupform() {
	
		return "/users/signupform";
		
	}	

	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {
		
		service.addUser(dto);
		mView.setViewName("users/signup");
		return mView;
	}

	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		//세션에서 id 라는 키값으로 저장된 값 삭제 
		session.removeAttribute("id");
		return "redirect:/home.do";
	}
	
	//아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드 
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(String inputId){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다. 
		return service.isExistId(inputId);
	}	

	@RequestMapping("/users/private/upgrade")
	public ModelAndView upgrade(@RequestParam String id, ModelAndView mView, HttpServletRequest request) {
		service.upgraded(id, request);
		mView.setViewName("users/upgrade");
		return mView;
	}
	
	@RequestMapping("/users/private/management")
	public String list(HttpServletRequest request) {
		service.getList(request);
		
		return "users/management";
	}
	
	@RequestMapping("/users/private/delete2")
	public ModelAndView delete2(@RequestParam String id, ModelAndView mView,HttpServletRequest request) {
		service.deleteUser2(id, request);
		
		mView.setViewName("redirect:/users/private/management.do");
		return mView;
	}	
	
	@RequestMapping("/users/delete")
	public ModelAndView delete(HttpSession session, ModelAndView mView,HttpServletRequest request) {
		service.deleteUser(session, mView);
		mView.setViewName("users/delete");
		return mView;
	}
	
	@RequestMapping(value = "/users/private/ajax_profile_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){

		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveProfileImage(request, image);
	}
	
	@RequestMapping("/users/private/pwd_update")
	public ModelAndView pwdUpdate(UsersDto dto, 
			ModelAndView mView, HttpSession session) {
		//서비스에 필요한 객체의 참조값을 전달해서 비밀번호 수정 로직을 처리한다.
		service.updateUserPwd(session, dto, mView);
		//view page 로 forward 이동해서 작업 결과를 응답한다.
		mView.setViewName("users/pwd_update");
		return mView;
	}
	
	@RequestMapping("/users/private/pwd_updateform")
	public String pwdUpdateForm() {

		return "users/pwd_updateform";
	}
	
	@RequestMapping("/users/private/info")
	public ModelAndView info(HttpSession session, ModelAndView mView) {
		service.getInfo(session, mView);
		mView.setViewName("users/info");
		
		return mView;
	}
	
	@RequestMapping("/users/private/mypage")
	public ModelAndView mypage(HttpSession session, ModelAndView mView, HttpServletRequest request,UsersDto dto) {
		service.getInfo(session, mView);
		mView.setViewName("users/mypage");
		return mView;
	}
	
	@RequestMapping(value="/users/mypageupdate", method = RequestMethod.POST)
	public ModelAndView update(UsersDto dto, HttpSession session, ModelAndView mView, HttpServletRequest request) {
		service.updateUser(dto, session);
		mView.setViewName("redirect:/users/private/info.do");
		return mView;
	}
	
	@RequestMapping("/chargePoint")
	public ModelAndView chargePoint(HttpSession session, UsersDto dto, ModelAndView mView) {
		service.chargePoint(session,dto,mView);
		mView.setViewName("/chargePoint");
		return mView;
	}
	
	@RequestMapping(value = "/movie/buy", method = RequestMethod.GET)
	public ModelAndView buyMovie(HttpSession session, UsersDto dto, ModelAndView mView,MovieDto moviedto, @RequestParam int num,HttpServletRequest request) {
		service.buyMovie(session,dto,mView,moviedto,num,request);
		mView.setViewName("movie/buy");
		return mView;
	}

}


