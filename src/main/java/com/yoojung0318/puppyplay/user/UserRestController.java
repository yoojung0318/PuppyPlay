
package com.yoojung0318.puppyplay.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yoojung0318.puppyplay.user.bo.UserBO;
import com.yoojung0318.puppyplay.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	// 회원가입 api
	@PostMapping("/user/signup")
	public Map<String, String> singUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
			
		int count = userBO.addUser(loginId, password, name, email);
			
		Map<String, String> map = new HashMap<>();
			
		if(count == 1) {
				map.put("result", "success");
		} else {
				map.put("result", "fail");
		}
			
		return map;
			
	}
	
	// 아이디 중복 확인 api
	@GetMapping("/user/duplicate_id")
	public Map<String, Boolean> isDuplicate(String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicate(loginId)) { // 중복된경우(중복:true)s
			result.put("is_duplicate", true);
		} else { // 중복되지 않은 경우 
			result.put("is_duplicate", false);			
		}
		
		return result;
		
		
	}
	
	//로그인 api
	@PostMapping("/user/signin")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpServletRequest request){
		
		User user = userBO.getUser(loginId, password);
	
		Map<String, String> result = new HashMap<>();
		
		if(user != null) { //로그인 성공 (loginId, password not null)
			result.put("result", "success");
			
			//session
			HttpSession session = request.getSession();
			
			//user id, user loginId 
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
		} else { // 로그인 실패
			result.put("result", "fail");
		}
		return result;	 
	}
	
	
}
