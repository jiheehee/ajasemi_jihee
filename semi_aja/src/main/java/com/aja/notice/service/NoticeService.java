package com.aja.notice.service;

import java.sql.Connection;
import java.util.List;

import com.aja.notice.dao.NoticeDao;
import com.aja.notice.dto.Notice;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.rollback;


public class NoticeService {
	
	private NoticeDao dao=new NoticeDao();
	public List<Notice> selectNotice(int cPage, int numPerPage) {
		
	//1. 공지사항 목록 조회
	Connection conn=getConnection();
	
	List<Notice> listNotice=dao.selectNoticeAll(conn,cPage,numPerPage);
	
	close(conn);
	return listNotice;
	}
	
	//2. 
	public int selectNoticeCount() {		
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	//3.
	public Notice selectNoticeByNo(int no) {
		Connection conn=getConnection();
		Notice n=dao.selectNoticeByNo(conn,no);
		close(conn);
		return n;		
	}
	
	//4.
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	
}
