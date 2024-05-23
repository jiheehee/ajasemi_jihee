package com.aja.member.service;

import static com.aja.common.JDBCTemplate.*;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;

import com.aja.member.model.dao.MemberDao;
import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.KakaoDTO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoLoginService {
	private MemberDao dao = new MemberDao();
	
	public Customer searchById(String custEmail) {
		// kakao login시 동일한 아이디가 db 에 있는지 없는지 확인 !! 
		Connection conn = getConnection();
		Customer ct = dao.searchMemberById(conn, custEmail);
		close(conn);
		return ct;
	}
	
	
	
	public String getAccessToken(String code) {
		// access토큰 받기 !
		System.out.println("--토큰발급--");
		String accessToken="";
		String refreshToken="";
		String idToken="";
		
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=cb27b0d18235587769af0f402ac2e929");
			sb.append("&redirect_uri=http://localhost:9090/semi_aja/member/kakaologin.do");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line="";
			String result="";
			
			while ((line = br.readLine())!=null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonElement element= JsonParser.parseString(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			idToken = element.getAsJsonObject().get("id_token").getAsString();
			
			System.out.println("accessToken : " + accessToken );
			System.out.println("refreshToken : " + refreshToken );
			System.out.println("idToken : " + idToken );
			
			br.close();
			bw.close();
			
		} catch(IOException e) {
			e.printStackTrace();
		} 
		
		return accessToken;
				
	}
	
	public KakaoDTO getUserInfo(String accessToken) {
		// accessToken 으로 사용자 정보 가져와서 정보 담아주기 ! !
		
		Connection cn = getConnection();
		
		System.out.println("-- 사용자 정보 보기 --");
		System.out.println(accessToken);
		KakaoDTO ct = null;
		
 		String reqURl = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			
			conn.setRequestProperty("Authorization","Bearer "+accessToken);
			
	        System.out.println("Authorization: Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			
			String line = "";
			String result = "";
			
			while((line=br.readLine())!=null) {
				result += line;
			}
			System.out.println("response body : " + result );
			
			JsonElement element = JsonParser.parseString(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			Long id = element.getAsJsonObject().get("id").getAsLong();
			
			System.out.println(id);
			
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			
			Customer customer = new MemberDao().searchMemberById(cn, email);
			// 카카오 계정 이메일이 이미 db에 존재하는지 확인 !! 
			
			if(customer==null) {
				// db에 존재하지 않는다 . -> 회원가입 처리 
				ct = KakaoDTO.builder().custNickname(nickname).custEmail(email).build();
				int rs = dao.signUp(cn,ct); // db 에 저장 ! 
				if(rs>0) {
					commit(cn);
				} else {
					rollback(cn);
				}
				
			} else {
				// db에 존재한다.->카카오 로그인 || 일반 로그인인데, 카카오 로그인 아이디와 겹침. 
				ct = KakaoDTO.builder().custNickname(nickname).custEmail(email).build();

				// email 이 이미 디비에 저장되어 있을 경우 
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		} 
		return ct;
	}
}
