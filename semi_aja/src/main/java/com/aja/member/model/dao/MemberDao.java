package com.aja.member.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.aja.member.model.dto.Address;
import com.aja.member.model.dto.Customer;

public class MemberDao {
	
//	private Properties prop = new Properties();
//	
//	{
//		String path = MemberDao.class.getResource("").getPath();
//		try (FileReader fr = new FileReader(path)){
//			
//			prop.load(fr);
//			
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	public int signUp(Connection conn, Customer ct) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO MEMBER VALUES(CK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getCustEmail());
			pstmt.setString(2, ct.getCustPw());
			pstmt.setString(3, ct.getCustNickname());
			pstmt.setString(4, ct.getCustPhone());
			pstmt.setString(5, ct.getCustGender());
			pstmt.setString(6, ct.getCustBirth());
			pstmt.setString(7, ct.getCustAddress());
			pstmt.setString(8, ct.getCustDetailAddress());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return result;
	}
	
	public Address getDefaultAddress(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Address defaultAddress = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM ADDRESS WHERE CUST_KEY = ? AND ADDR_DEFAULT = 'Y'");
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				defaultAddress = Address.builder()
										.addrName(rs.getString("addr_name"))
										.addrPostcode(rs.getString("addr_postcode"))
										.addrAddress(rs.getString("addr_address"))
										.addrDetail(rs.getString("addr_detail"))
										.addrPhone(rs.getString("addr_phone"))
										.addrRequest(rs.getString("addr_request"))
										.build();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return defaultAddress;
	}
}
