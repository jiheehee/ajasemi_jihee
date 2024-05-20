package com.aja.member.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.aja.member.model.dao.MemberDao;
import com.aja.member.model.dto.Address;
import com.aja.member.model.dto.Customer;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public int signUp(Customer ct) {
		Connection conn = getConnection();
		
		int result = dao.signUp(conn,ct);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	public Address getDefaultAddress(int memberNo) {
		Connection conn = getConnection();
		Address result = dao.getDefaultAddress(conn, memberNo);
		close(conn);
		return result;
	}
	
}
