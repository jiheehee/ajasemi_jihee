package com.aja.qna.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static com.aja.common.JDBCTemplate.*;

import com.aja.qna.model.dao.QnaDao;
import com.aja.qna.model.dto.Qna;

public class QnaService {
	
	QnaDao dao=new QnaDao();
	
	public List<Qna> qnaList(int custKey){		
		Connection conn=getConnection();
		List<Qna> qna=dao.qnaList(conn,custKey);
		close(conn);
		return qna;
	}
	
	public int insertQna(Qna q) {
		Connection conn=null;
		int result=dao.insertQna(conn, q);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	
	
	

}
