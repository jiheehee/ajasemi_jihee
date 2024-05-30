package com.aja.qna.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.member.model.dao.MemberDao;
import com.aja.qna.model.dto.Qna;

public class QnaDao {		
	
	private Properties sql=new Properties();
	
	{
		String path=QnaDao.class.getResource("/sql/qna/sql_qna.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setDate(3, q.getQnaEnrollDate());
			result=pstmt.executeUpdate();			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;			
	}
	

	 public List<Qna> qnaList(Connection conn,int custKey){ 
		 
		 PreparedStatement pstmt=null;
		 ResultSet rs=null; 
		 List<Qna> result=new ArrayList<>();		 
		 try {
		 pstmt=conn.prepareStatement("SELECT QNA_CONTENT ,QNA_ENROLLDATE FROM QNA");		 		 
		 
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
