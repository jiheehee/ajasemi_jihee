package com.aja.notice.service;

import java.sql.Connection;
import java.util.List;

import com.aja.notice.dao.NoticeDao;
import com.aja.notice.dto.Notice;

import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.admin.common.JDBCTemplate.close;

public class NoticeService {
	
	private NoticeDao dao=new NoticeDao();
	
	public List<Notice> noticeList(){
		Connection conn=getConnection();
		List<Notice> notice=dao.noticeList(conn);
		close(conn);
		return notice;
	}
	
	
	

}
