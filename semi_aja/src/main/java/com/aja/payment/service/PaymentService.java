package com.aja.payment.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.aja.payment.dao.PaymentDao;
import com.aja.payment.model.dto.Order;
public class PaymentService {
	
	PaymentDao dao = new PaymentDao();	
	
	public int updatePaymentInfo(Order orderInfo) {
		Connection conn = getConnection();
		int result = dao.updatePaymentInfo(conn, orderInfo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int couponStateUpdate(int dcKey, int custKey) {
		Connection conn = getConnection();
		int result = dao.couponStateUpdate(conn, dcKey, custKey);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteCartAfterPay(String cartKies, int custKey) {
		Connection conn = getConnection();
		int result = dao.deleteCartAfterPay(conn, cartKies, custKey);
		if(result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
}
