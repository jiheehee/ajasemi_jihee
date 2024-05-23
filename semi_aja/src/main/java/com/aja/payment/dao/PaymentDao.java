package com.aja.payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.aja.common.JDBCTemplate.close;

import com.aja.payment.model.dto.Order;

public class PaymentDao {
	
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
