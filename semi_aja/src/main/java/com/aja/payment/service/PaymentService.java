package com.aja.payment.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.aja.payment.dao.PaymentDao;
import com.aja.payment.model.dto.Order;
public class PaymentService {
	
	PaymentDao dao = new PaymentDao();
	
	public int updatePaymentInfo(Order orderInfo) {
		Connection conn = getConnection();
		int result = dao.updatePaymentInfo(conn, orderInfo);
		close(conn);
		return result;
	}
}
