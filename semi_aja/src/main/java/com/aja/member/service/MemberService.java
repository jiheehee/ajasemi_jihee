package com.aja.member.service;

import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.aja.member.model.dao.MemberDao;
import com.aja.member.model.dto.Customer;

import static com.aja.common.JDBCTemplate.*;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public int signUp(Customer ct) {
		Connection conn = getConnection();
		
		int result = dao.signUp(conn,ct);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
}
