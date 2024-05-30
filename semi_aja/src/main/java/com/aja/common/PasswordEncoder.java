package com.aja.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncoder extends HttpServletRequestWrapper{

	public PasswordEncoder(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String oriVal=super.getParameter(name);
		if(name.equals("custPw")) {
			//암호화처리
			System.out.println("암호화 전 : "+oriVal);
			String encode=getSHA512(oriVal);
			System.out.println("암호화된 값 : "+encode);
			return encode;
		}
		return oriVal;
	}
	
	private String getSHA512(String oriVal) {
		//java.security.MessageDigest클래스를 이용해서 암호화함
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//bit연산처리 -> String -> byte로 변환
		byte[] oriValByte=oriVal.getBytes();
		md.update(oriValByte);//내부 변경할 값을 설정
		byte[] encryptVal=md.digest();//변경된 값을 가져옴.
		//String변환 -> Base64인코더를 이용해서 변환
		String encryptStr=Base64.getEncoder().encodeToString(encryptVal);
		return encryptStr;
		
	}
}




