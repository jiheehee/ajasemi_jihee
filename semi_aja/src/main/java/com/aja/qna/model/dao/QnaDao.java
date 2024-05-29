package com.aja.qna.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aja.qna.model.dto.Qna;

public class QnaDao {


	 public List<Qna> qnaList(Connection conn,int custKey){ 
		 
		 PreparedStatement pstmt=null;
		 ResultSet rs=null; 
		 List<Qna> result=new ArrayList<>();
		 
		 try {
		 pstmt=conn.prepareStatement("SELECT QNA_CONTENT ,QNA_ENROLLDATE FROM QNA");
		 
		 pstmt=conn.prepareStatement("SELECT * FROM cart c JOIN PRODUCT p ON (p.PROD_KEY=c.prod_key) JOIN CATEGORY c2 using(cate_key) "
				+ "				JOIN KEYWORD k using(keyword_key)"
				+ "JOIN PROD_OPTION po ON po.option_key=c.OPTION_KEY WHERE cust_key=?");
		 
		 
		 pstmt.setInt(1, custKey);
		 rs=pstmt.executeQuery();
		 while(rs.next()) {
			 Qna q=Qna.builder()
				.qnaKey(rs.getInt("qna_key"))
				.custKey(rs.getInt("cust_key"))
				.qnaTitle(rs.getString("qna_title"))
				.qnaContent(rs.getString("qna_content"))
				.qnaEnrollDate(rs.getDate("qna_enrolldate"))
				.build();
			 result.add(q);
		 	}
		 }catch(SQLException e) { 
			 e.printStackTrace(); 
		 }finally { 
			 close(pstmt);
			 close(rs); 
		}return result;
	 }
	 

}
