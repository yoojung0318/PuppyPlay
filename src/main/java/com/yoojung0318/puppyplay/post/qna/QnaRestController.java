package com.yoojung0318.puppyplay.post.qna;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yoojung0318.puppyplay.post.qna.BO.QnaBO;

@RestController
public class QnaRestController {

	@Autowired 
	private QnaBO qnaBO;
	
	@PostMapping("/post/qna/create")
	public Map<String, String> createQna(
			@RequestParam("title") String title
			,@RequestParam("content") String content
			,HttpServletRequest request ){
	
			HttpSession session = request.getSession();
			int userId = (Integer) session.getAttribute("userId");
			
			int count = qnaBO.addQna(userId,title,content);
			
			
			Map<String, String> result = new HashMap<>();
			if(count == 1) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}
			
			return result;
			
	}
	@PostMapping("/post/qna/reply")
	public Map<String, String> createReplyQna(
			@RequestParam("postId") int postId
			,@RequestParam("answer")String answer){
		
			int count = qnaBO.replyQna( postId, answer);
			
			Map<String, String> map = new HashMap<>();
			if(count == 1) {
				map.put("result", "success");
			}else {
				map.put("result", "fail");
			}
			return map;
		
	};
}
