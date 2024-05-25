package com.aja.payment.dao;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.rollback;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.aja.member.model.dto.ProductInfo;
import com.aja.payment.model.dto.Order;

public class PaymentDao {
	
	Properties driver = new Properties();
	
	{		
		String path = PaymentDao.class.getResource("/sql/payment/sql_payment.properties").getPath();
		try(FileReader fr = new FileReader(path)) {
			driver.load(fr);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updatePaymentInfo(Connection conn, Order orderInfo, List<ProductInfo> purchaseList, int custKey) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int orderKey = 0;
		try {
			pstmt = conn.prepareStatement("INSERT INTO PROD_ORDER VALUES(SEQ_ORDER.NEXTVAL,?,?,?,DEFAULT,'결제완료',null,?,?,?,?,?,?,?)");
			setOrder(pstmt, orderInfo);
			result = pstmt.executeUpdate();
			if(result > 0) commit(conn);
			else rollback(conn);
			close(pstmt);
			
			//TEST를 위해 DB에서 주문고유번호를 가져옵니다.
			pstmt = conn.prepareStatement("SELECT ORDER_KEY FROM PROD_ORDER WHERE CUST_KEY = ?");
			pstmt.setInt(1, custKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderKey = rs.getInt("order_key");
			}
			close(rs);
			close(pstmt);
			
			//여기는 장바구니를 먼저 구현한 후에 해야할것같습니다.
			for(ProductInfo p : purchaseList) {
				int totalProductPrice = p.getOptionPrice() + p.getProdPrice();
				pstmt = conn.prepareStatement("INSERT INTO ORDER_DETAIL VALUES(SEQ_ORDER_DETAIL.NEXTVAL,?,?,?,?,?)");
				pstmt.setInt(1, p.getOptionKey());
				pstmt.setInt(2, p.getProdKey());
				pstmt.setInt(3, orderKey);
				pstmt.setInt(4, totalProductPrice);
				pstmt.setInt(5, p.getCartQuantity());
				result = pstmt.executeUpdate();
				if(result > 0) commit(conn);
				else rollback(conn);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePointState(Connection conn, int custKey, int usingPoint) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE CUSTOMER SET CUST_POINT = CUST_POINT - ? WHERE CUST_KEY = ?");
			pstmt.setInt(1, usingPoint);
			pstmt.setInt(2, custKey);
			result = pstmt.executeUpdate();
			if(result > 0) commit(conn);
			else rollback(conn);
			close(pstmt);
			
			if(usingPoint > 0) {
				String usingPointToString = "" + (usingPoint * -1);
				System.out.println("usingPoint : " + usingPoint);
				pstmt = conn.prepareStatement("INSERT INTO POINT VALUES(SEQ_POINT.NEXTVAL,?,?,DEFAULT,NULL)");
				pstmt.setInt(1, custKey);
				pstmt.setString(2, usingPointToString);
				result = pstmt.executeUpdate();
				if(result > 0) commit(conn);
				else rollback(conn);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int couponStateUpdate(Connection conn, int dcKey, int custKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE DETAILCOUPON SET COUPON_USED = 'Y' WHERE CUST_KEY = ? AND DC_KEY = ?");
			pstmt.setInt(1, custKey);
			pstmt.setInt(2, dcKey);
			result = pstmt.executeUpdate();
			System.out.println("update성공");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteCartAfterPay(Connection conn, String cartKies, int custKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String[] cartKeyArr = cartKies.split(",");
		
		StringBuffer sql = new StringBuffer("DELETE CART WHERE CART_KEY IN(");
		for(int i = 0; i < cartKeyArr.length; i++) {
			System.out.println(cartKeyArr[i]);
			if(i + 1 == cartKeyArr.length) {
				sql.append("?)");
			} else {
				sql.append("?,");
			}
		}
		sql.append(" AND CUST_KEY = ?");
		System.out.println("sql : " + sql);
		try {
			pstmt = conn.prepareStatement(sql.toString());
			int numForPrepareSt = 1;
			for(int i = 0; i < cartKeyArr.length; i++) {
				System.out.println("cartKey : " + cartKeyArr[i]);
				pstmt.setString(i + 1, cartKeyArr[i]);
				numForPrepareSt++;
			}
			pstmt.setInt(numForPrepareSt, custKey);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	private void setOrder(PreparedStatement pstmt, Order orderInfo) throws SQLException {
		pstmt.setInt(1, orderInfo.getCustKey());
		pstmt.setInt(2, orderInfo.getOrderPrice());
		pstmt.setInt(3, orderInfo.getOrderSale());
		pstmt.setString(4, orderInfo.getOrderPayoption());
		pstmt.setString(5, orderInfo.getOrderName());
		pstmt.setString(6, orderInfo.getOrderPostcode());
		pstmt.setString(7, orderInfo.getOrderAddress());
		pstmt.setString(8, orderInfo.getOrderDetailaddr());
		pstmt.setString(9, orderInfo.getOrderPhone());
		pstmt.setString(10, orderInfo.getOrderRequest());
	}
}
