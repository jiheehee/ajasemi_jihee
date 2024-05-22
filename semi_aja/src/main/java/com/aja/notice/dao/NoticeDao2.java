//package com.aja.notice.dao;
//
//import static com.aja.common.JDBCTemplate.close;
//
//import java.io.FileReader;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Properties;
//
//import com.aja.notice.dto.Notice;
//
//// 공지사항 목록 조회하는 로직 NoticeDao 
//// 전체 쿼리를 반환받아 List<Notice>로 저장하고 반환한다. 
//public class NoticeDao2 {
//	
//	// db에서 가져올 자료들 골라서 뽑아오는 역할
//	private Properties prop=new Properties();
//	
//	//sql_notice.properties 파일 읽어오기
//	{
//		String path=NoticeDao2.class.getResource("/sql/notice/sql_notice.properties")
//				.getPath();
//		try(FileReader fr=new FileReader(path)){ 
//			prop.load(fr);
//		}catch(IOException e){
//			e.printStackTrace();
//		}
//	}
//	
//	public List<Notice> selectNoticeAll(Connection conn,int cPage,int numPerpage){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Notice> result=new ArrayList<>();
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeAll"));
//			pstmt.setInt(1,(cPage-1)*numPerpage+1);
//			pstmt.setInt(2,cPage*numPerpage);
//			rs=pstmt.executeQuery();
//			while(rs.next()) result.add(getNotice(rs));
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;		
//	}
//	
//	public int selectNoticeCount(Connection conn) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		int result=0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeCount"));
//			rs=pstmt.executeQuery();
//			rs.next();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;		
//	}
//	
//	public Notice selectNoticeByNo(Connection conn,int no) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		Notice n=null;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeByNo"));
//			pstmt.setInt(1, no);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				n=getNotice(rs);
//			}					
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return n;		
//	}
//	
//	public int insertNotice(Connection conn, Notice n) {
//		PreparedStatement pstmt=null;
//		int result=0;
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("insertNotice"));
//			pstmt.setString(1,n.getNoticeTitle());
//			pstmt.setDate(2,n.getNoticeEnrolldate());			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}return result;		
//	}		
//	
//	public static Notice getNotice(ResultSet rs) throws SQLException{
//		return Notice.builder()
//				.noticeTitle(rs.getString("notice_title"))
//				.noticeImage(rs.getString("notice_image"))
//				.noticeContent(rs.getString("notice_content"))
//				.noticeEnrolldate(rs.getDate("notice_enrolldate"))
//				.build();		
//	}	
//}
