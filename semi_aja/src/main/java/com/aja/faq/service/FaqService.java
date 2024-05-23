package com.aja.faq.service;

import java.sql.Connection;
import java.util.List;

import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.close;

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
	
	
}
