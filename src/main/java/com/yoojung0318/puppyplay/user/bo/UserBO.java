package com.yoojung0318.puppyplay.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.puppyplay.common.EncryptUtils;
import com.yoojung0318.puppyplay.user.dao.UserDAO;
import com.yoojung0318.puppyplay.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO ;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		//암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	//아이디를 전달 받고, 중복 여부 확인
	public boolean isDuplicate(String loginId) {
			
		//LoginId 전달 받아서, 개수를 확인한다.
		// 0일 경우 중복 X
		// 그게 아닐경우 중복
		
		int count = userDAO.selectCountLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUser(String loginId, String password){
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	// id로 사용자 정보 조회 기능
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
}
	
	
	

