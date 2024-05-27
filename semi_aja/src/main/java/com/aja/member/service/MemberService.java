package com.aja.member.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.aja.member.model.dao.MemberDao;
import com.aja.member.model.dto.Address;
import com.aja.member.model.dto.CouponInfo;
import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.ProductInfo;

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
	
	public Customer searchMemberById(String custEmail, String custPw) {
		Connection conn = getConnection();
		Customer ct = dao.searchMemberById(conn,custEmail);
		// 1. id 가 존재하지 않음
		// 2. pw 가 일치하지 않음
		if(ct==null || !ct.getCustPw().equals(custPw)) ct = null;
		
		System.out.println(ct);
		
		return ct;
	}
	
	public List<ProductInfo> getCartInfo(int memberNo, String cartKies) {
		Connection conn = getConnection();
		List<ProductInfo> products = dao.getCartInfo(conn, memberNo, cartKies);
		close(conn);
		return products;
	}
	
	public List<CouponInfo> getCouponInfo(int memberNo) {
		Connection conn = getConnection();
		List<CouponInfo> coupons = dao.getCouponInfo(conn, memberNo);
		close(conn);
		return coupons;
	}
	
}
