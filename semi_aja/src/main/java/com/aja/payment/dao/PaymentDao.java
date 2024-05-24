package com.aja.payment.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

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
	
	public int updatePaymentInfo(Connection conn, Order orderInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("INSERT INTO PROD_ORDER VALUES(SEQ_ORDER.NEXTVAL,?,?,?,DEFAULT,?,?,?,?,?,?,?)");
			setOrder(pstmt, orderInfo);
			result = pstmt.executeUpdate();
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
