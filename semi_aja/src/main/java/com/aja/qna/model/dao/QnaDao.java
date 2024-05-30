package com.aja.qna.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.member.model.dao.MemberDao;
import com.aja.qna.model.dto.Qna;
//import com.web.board.model.dto.Board;

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
		
	public int insertQna(Connection conn, Qna q,int custKey) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertQna"));
			
			pstmt.setInt(1, custKey);
			pstmt.setString(2, q.getCustTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setString(4, q.getQnaImage());
			pstmt.setString(5, q.getFilePath());
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
		 pstmt=conn.prepareStatement("SELECT * FROM QNA WHERE CUST_KEY LIKE ?");		 		 
		 
		 pstmt.setInt(1, custKey);
		 rs=pstmt.executeQuery();
		 while(rs.next()) {
			 Qna q=Qna.builder()
				.qnaKey(rs.getInt("qna_key"))
				.custKey(rs.getInt("cust_key"))
				.custTitle(rs.getString("cust_title"))
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
	 
	 public Qna selectQnaByNo(Connection conn, int qnaKey) {
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 Qna q=null;
		 try {
			 pstmt=conn.prepareStatement(sql.getProperty("selectQnaByNo"));
			 pstmt.setInt(1, qnaKey);
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				 q=getQna(rs);
			 }			 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 close(rs);
			 close(pstmt);
		 }return q;		 				 
	 }
	 
	 public static Qna getQna(ResultSet rs) throws SQLException{
		return Qna.builder()
				.custKey(rs.getInt("cust_key"))
				.custTitle(rs.getString("cust_title"))
				.qnaContent(rs.getString("qna_content"))
				.qnaEnrollDate(rs.getDate("qna_enrolldate"))
				.qnaImage(rs.getString("qna_image"))
				.filePath(rs.getString("qna_image2"))
				.build();		
	 }	 
	 
//		public static void getQnaComment(List<Qna> qna,ResultSet rs)throws SQLException{
//			int pk=rs.getInt("board_no");
////			List<Board> boards=new ArrayList<>();
//			if(qna.stream().anyMatch(b->b.getBoardNo()==pk)) {
//				qna.stream().filter(b->b.getBoardNo()==pk)
//				.forEach(b->{
//					try {
//						if(rs.getString("board_comment_no")!=null) {
//							b.getComments().add(getBoardComment(rs));
//						}
//					}catch(SQLException e) {
//						e.printStackTrace();
//					}
//				});
//			}else {
//				Qna b=getQna(rs);
//				if(rs.getString("board_comment_no")!=null) {
//					b.getComments().add(getBoardComment(rs));
//				}
//				qna.add(b);
//			}
//		}
		
	 
	 

}
