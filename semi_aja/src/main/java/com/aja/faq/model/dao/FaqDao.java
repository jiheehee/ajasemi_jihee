package com.aja.faq.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aja.faq.model.dto.Faq;

public class FaqDao {
	
	public List<Faq> faqList(Connection conn){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> result=new ArrayList<>();
		try {
				pstmt=conn.prepareStatement("SELECT * FROM FAQ");
				rs=pstmt.executeQuery();
				while(rs.next()) {
				Faq f=Faq.builder()
				.faqTitle(rs.getString("faq_title"))
				.faqCategory(rs.getString("faq_category"))
				.faqContent(rs.getString("faq_content"))
				.build();
				result.add(f);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return result;		
	}
	
	public List<Faq> searchFaqByTitle(Connection conn,String search){				
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> result=new ArrayList<>();
		String searchTitle = "%"+search+"%";
		
		try {
			pstmt=conn.prepareStatement("SELECT * FROM FAQ WHERE FAQ_TITLE LIKE ? ");
			pstmt.setString(1, searchTitle);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Faq q=Faq.builder()
					.faqCategory(rs.getString("faq_Category"))
					.faqTitle(rs.getString("faq_Title"))
					.faqContent(rs.getString("faq_Content"))
					.build();
				result.add(q);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;		
	}

	public List<Faq> submitCategory(Connection conn, String category){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> result=new ArrayList<>();
		String submit=category;
		try {
			
			pstmt=conn.prepareStatement("SELECT * FROM FAQ WHERE FAQ_CATEGORY LIKE ? ");
			pstmt.setString(1, submit);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Faq q=Faq.builder()
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
	}
	
	
	
	
}
