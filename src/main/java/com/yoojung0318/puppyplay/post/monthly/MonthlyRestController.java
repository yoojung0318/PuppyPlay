package com.yoojung0318.puppyplay.post.monthly;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yoojung0318.puppyplay.post.monthly.bo.MonthlyBO;
import com.yoojung0318.puppyplay.user.bo.UserBO;

@RestController
public class MonthlyRestController {
	
	
	@Autowired
	private MonthlyBO monthlyBO;
	
	
	//이달의 일정 입력 api
	@PostMapping("/post/monthly/create")
	public Map<String, String> createMonthly(
			@RequestParam("title") String title
			,@RequestParam("start") Date start
			,@RequestParam("end") Date end){
					
			//글쓴 사람 정보를 같이 저장하기 위해서
			// 로그인된 사용자의 id(userId - User 테이블의 PK)를 세션을 통해 얻어내고, 이를 사용

			int count = monthlyBO.addMonthly(title,start,end);
			
			Map<String, String> result = new HashMap<>();
			if(count == 1) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}	
			
			return result;	
	}
	
	//view가 아니라 api니까 controller에 만드거 여기로 가져오기 
	
}
