package com.aja.notice.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aja.notice.dto.Notice;

public class NoticeDao {

	public List<Notice> noticeList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> result=new ArrayList<>();
		try{
			pstmt=conn.prepareStatement("SELECT * FROM NOTICE WHERE ");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n=Notice.builder()
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getString("notice_content"))
				.noticeImage(rs.getString("notice_image"))
				.noticeEnrolldate(rs.getDate("notice_enrolldate"))
				.build();
			result.add(n);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;						
	}
	
	
}
