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
import com.aja.member.model.dto.CouponInfo;
import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.KakaoDTO;
import com.aja.member.model.dto.ProductInfo;
import com.aja.payment.model.dto.Order;

public class MemberDao {
	private Properties prop = new Properties();
	
	{
		// 프로펄티즈 파일 내 쿼리문 변경될 때, dao 로직 실행 시 프로펄티즈 파일을 재로드해서 실행하기 때문에 유지보수성 향상됨
		String path = MemberDao.class.getResource("/sql/member/sql_member.properties").getPath();
		try (FileReader fr = new FileReader(path)){
			
			prop.load(fr);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int signUp(Connection conn, Customer ct) {
		PreparedStatement pstmt = null;
		int result = 0;
//		String sql = "INSERT INTO CUSTOMER VALUES(CK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT,?)";
		// 리소스파일(프로펄티즈파일) 만들어서 넣기 ~
		try {
			pstmt = conn.prepareStatement(prop.getProperty("signUp"));
			pstmt.setString(1, ct.getCustEmail());
			pstmt.setString(2, ct.getCustPw());
			pstmt.setString(3, ct.getCustName());
			pstmt.setString(4, ct.getCustNickname());
			pstmt.setString(5, ct.getCustPhone());
			pstmt.setString(6, ct.getCustGender());
			pstmt.setString(7, ct.getCustBirth());
			pstmt.setString(8, ct.getCustAddress());
			pstmt.setString(9, ct.getCustDetailAddress());
			pstmt.setString(10, ct.getCustPostcode());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int signUp(Connection conn, KakaoDTO ct) {
		PreparedStatement pstmt = null;
		int result = 0;
//		String sql = "INSERT INTO CUSTOMER(CUST_KEY, CUST_EMAIL, CUST_NICKNAME, CUST_DELETE, CUST_ENROLL_DATE) VALUES (CUST_SEQ.NEXTVAL,?,?,DEFAULT, DEFAULT)";
		// 리소스파일(프로펄티즈파일) 만들어서 넣기 ~
		try {
			pstmt = conn.prepareStatement(prop.getProperty("signUpKakao"));
			pstmt.setString(1, ct.getCustEmail());
			pstmt.setString(2, ct.getCustNickname());
			
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
	
	public int editCustomer(Connection conn, Customer editCt) {
		int result = 0;
		PreparedStatement pstmt = null;
//		String sql = "UPDATE CUSTOMER SET CUST_NAME=?,CUST_NICKNAME=?, CUST_PW= CASE WHEN ? IS NULL THEN CUST_PW ELSE ?, 
		// CUST_PHONE=?, CUST_POSTCODE=?, CUST_ADDRESS=?, CUST_DETAIL_ADDRESS = ? WHERER CUST_EMAIL =?";
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("editCustomer"));
			pstmt.setString(1, editCt.getCustName());
			pstmt.setString(2, editCt.getCustNickname());
			pstmt.setString(3, editCt.getCustPw());
			pstmt.setString(4, editCt.getCustPw());
			pstmt.setString(5, editCt.getCustPhone());
			pstmt.setString(6, editCt.getCustPostcode());
			pstmt.setString(7, editCt.getCustAddress());
			pstmt.setString(8, editCt.getCustDetailAddress());
			pstmt.setString(9, editCt.getCustEmail());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<ProductInfo> getCartInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductInfo> productInCart = new ArrayList<ProductInfo>();
		try {
			pstmt = conn.prepareStatement("SELECT P.PROD_IMAGE, P.PROD_NAME, P.PROD_CONTENT, O.OPTION_FLAVOR, O.OPTION_SIZE, O.OPTION_PRICE, P.PROD_PRICE, C.CART_QUANTITY, C.CART_KEY, C.OPTION_KEY, C.PROD_KEY "
												+ "FROM CART C "
												+ "LEFT JOIN PRODUCT P ON C.PROD_KEY = P.PROD_KEY "
												+ "LEFT JOIN PROD_OPTION O ON C.OPTION_KEY = O.OPTION_KEY "
												+ "WHERE CUST_KEY = ?");
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
										.cartQuantity(rs.getInt("cart_Quantity"))
										.cartKey(rs.getInt("cart_key"))
										.optionKey(rs.getInt("option_key"))
										.prodKey(rs.getInt("prod_key"))
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
	
	public List<CouponInfo> getCouponInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CouponInfo> coupons = new ArrayList<CouponInfo>();
		try {
			pstmt = conn.prepareStatement("SELECT COUPON_NAME, SUBSTR(COUPON_SALE,1,LENGTH(COUPON_SALE)-1) AS \"COUPON_SALE\", COUPON_ENDDATE, CUST_POINT, DC_KEY "
											+ "FROM DETAILCOUPON "
											+ "LEFT JOIN COUPON USING(COUPON_KEY) "
											+ "LEFT JOIN CUSTOMER USING(CUST_KEY) "
											+ "WHERE CUST_KEY = ? AND COUPON_USED = 'N'");
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				coupons.add(CouponInfo.builder()
								.dcKey(rs.getInt("dc_key"))
								.couponName(rs.getString("coupon_name"))
								.couponSale(rs.getInt("coupon_sale"))
								.couponEnddate(rs.getDate("coupon_enddate"))
								.custPoint(rs.getString("cust_point"))
								.build());
			}
			
			if(coupons == null || coupons.isEmpty()) {
				close(rs);
				close(pstmt);
				pstmt = conn.prepareStatement("SELECT CUST_POINT FROM CUSTOMER WHERE CUST_KEY = ?");
				pstmt.setInt(1, memberNo);
				rs = pstmt.executeQuery();
				rs.next();
				coupons.add(CouponInfo.builder().custPoint(rs.getString("cust_point")).build());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return coupons;
	}
	
	public static Customer getCustomer(ResultSet rs) throws SQLException{
		
		return Customer.builder()
				.custEmail(rs.getString("cust_email"))
				.custAddress(rs.getString("cust_address"))
				.custDetailAddress(rs.getString("cust_detail_address"))
				.custBirth(rs.getString("cust_birth"))
				.custEnrollDate(rs.getDate("cust_enroll_date"))
				.custGender(rs.getString("cust_gender"))
				.custKey(rs.getInt("cust_key"))
				.custNickname(rs.getString("cust_nickname"))
				.custPhone(rs.getString("cust_phone"))
				.custPw(rs.getString("cust_pw"))
				.custDelete(rs.getString("cust_delete"))
				.custName(rs.getString("cust_name"))
				.custPostcode(rs.getString("cust_postcode"))
				.build();
	}
}
