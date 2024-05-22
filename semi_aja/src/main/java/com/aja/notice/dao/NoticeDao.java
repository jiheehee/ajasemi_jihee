//package com.aja.notice.dao;
//
//import static com.aja.common.JDBCTemplate.getConnection;
//
//import java.io.FileReader;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Properties;
//
//import com.aja.notice.dto.Notice;
//
//public class NoticeDao {
//	
//	//db자료 골라서 뽑아오는 역할
//	private Properties prop=new Properties();
//	
//	//sql_notice.properties 파일 읽어오기
//	{
//		String path=NoticeDao.class.getResource("sql/notice/sql_notice.properties").getPath();
//		try(FileReader fr=new FileReader(path)){
//			prop.load(fr);
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public List<Notice> getNotices(){
//		List<Notice> notices=new ArrayList<>();
//		String query="SELECT * FROM NOTICE";
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		
//		try(Connection conn=getConnection();
//				pstmt=conn.pstmt(prop);
//				rs=pstmt.executeQuery()){			
//		}
//		while(rs.next()) {
//			Notice notice=new Notice();
//			notice.set
//		}		
//	}
//	
//	
//	
//}
