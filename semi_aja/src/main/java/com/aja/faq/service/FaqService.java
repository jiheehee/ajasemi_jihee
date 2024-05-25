package com.aja.faq.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.faq.model.dao.FaqDao;
import com.aja.faq.model.dto.Faq;

public class FaqService {
	
	private FaqDao dao=new FaqDao();

	//Dao에서 받아온 값 여기서 어쩌구 저장해서 controller로 넘어가야 함 
	public List<Faq> faqlist(){
		
		Connection conn=getConnection();
		List<Faq> faq=dao.faqList(conn);
		close(conn);
		return faq;
	}
	
	public List<Faq> searchFaqByTitle(String search){  //받아온 값을 이용해서 sql문 조회하는거라 매개변수 필요
		
		Connection conn=getConnection();
		List<Faq> faq=dao.searchFaqByTitle(conn,search);
		close(conn);
		return faq;		
	}
	
	public List<Faq> submitCategory(String category){
		
		Connection conn=getConnection();
		List<Faq> faqCategory=dao.submitCategory(conn,category);
		close(conn);
		return faqCategory;
	}
	
	
	
}
