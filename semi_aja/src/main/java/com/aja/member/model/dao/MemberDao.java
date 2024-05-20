package com.aja.member.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.member.model.dto.Address;
import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.ProductInfo;

public class MemberDao {
	private Properties prop = new Properties();
	
	{
		// 프로펄티즈 파일 내 쿼리문 변경될 때, dao 로직 실행 시 프로펄티즈 파일을 재로드해서 실행하기 때문에 유지보수성 향상됨
		String path = MemberDao.class.getResource("/member.properties").getPath();
		try (FileReader fr = new FileReader(path)){
			
			prop.load(fr);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int signUp(Connection conn, Customer ct) {
		PreparedStatement pstmt = null;
		int result = 0;
//		String sql = "INSERT INTO CUSTOMER VALUES(CK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT)";
		// 리소스파일(프로펄티즈파일) 만들어서 넣기 ~
		try {
			pstmt = conn.prepareStatement(prop.getProperty("signUp"));
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
			close(pstmt);
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
	
	public Customer searchMemberById(Connection conn, String custEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Customer ct = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchMemberById"));
			pstmt.setString(1, custEmail);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ct = getCustomer(rs);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return ct;
		
	}
	
	public List<ProductInfo> getCartInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductInfo> productInCart = new ArrayList<ProductInfo>();
		try {
			pstmt = conn.prepareStatement("SELECT PROD_IMAGE, PROD_NAME, PROD_CONTENT, OPTION_FLAVOR, OPTION_SIZE, OPTION_PRICE, PROD_PRICE, CART_QUANTITY"
											+ "FROM CART"
											+ "LEFT JOIN CUSTOMER USING(CUST_KEY)"
											+ "LEFT JOIN PROD_OPTION USING(OPTION_KEY)"
											+ "LEFT JOIN PRODUCT USING(PROD_KEY)"
											+ "WHERE CUST = ?");
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				productInCart.add(ProductInfo.builder()
										.prodImage(rs.getString("prod_image"))
										.prodName(rs.getString("prod_name"))
										.prodContent(rs.getString("prod_content"))
										.optionFlavor(rs.getString("option_flavor"))
										.optionSize(rs.getString("option_size"))
										.optionPrice(rs.getInt("option_price"))
										.prodPrice(rs.getInt("prod_price"))
										.cartQuantity(rs.getInt("cartQuantity"))
										.build());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return productInCart;
	}
	
	public static Customer getCustomer(ResultSet rs) throws SQLException{
		
		return Customer.builder()
				.custEmail(rs.getString("cust_email"))
				.custAddress(rs.getString("cust_address"))
				.custBirth(rs.getString("cust_birth"))
				.custEnrollDate(rs.getDate("cust_enroll_date"))
				.custGender(rs.getString("cust_gender"))
				.custKey(rs.getInt("cust_key"))
				.custNickname(rs.getString("cust_nickname"))
				.custPhone(rs.getString("cust_phone"))
				.custPw(rs.getString("cust_pw"))
				.custDelete(rs.getString("cust_delete"))
				.build();
	}
}
