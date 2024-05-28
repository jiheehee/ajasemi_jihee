package com.aja.order.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.order.model.dao.OrderDao;
import com.aja.order.model.dto.CustomerOrder;
import com.aja.order.model.dto.OrderDetail;

public class OrderService {
	private OrderDao dao = new OrderDao();
	
	public List<CustomerOrder> selectOrderAll(int cPage,int numPerpage){
	Connection conn = getConnection();
	List<CustomerOrder> orderList = dao.selectOrderAll(conn,cPage,numPerpage);
	close(conn);
	return orderList;
	}
	public List<CustomerOrder> selectOrderAll(int cPage,int numPerpage, String status){
		Connection conn = getConnection();
		List<CustomerOrder> orderList = dao.selectOrderAll(conn,cPage,numPerpage,status);
		close(conn);
		return orderList;
		}
	public int selectOrderCount() {
		Connection conn = getConnection();
		int result = dao.selectOrderCount(conn);
		close(conn);
		return result;
	}
	public int selectOrderCount(String status) {
		Connection conn = getConnection();
		int result = dao.selectOrderCount(conn,status);
		close(conn);
		return result;
	}
	public List<OrderDetail> selectOrderDetailAll(int orderKey){
		Connection conn = getConnection();
		List<OrderDetail> orderDetailList = dao.selectOrderDetailAll(conn,orderKey);
		close(conn);
		return orderDetailList;
	}
	public int updateDeliveryStatus(int orderKey) {
		Connection conn = getConnection();
		int result = dao.updateDeliveryStatus(conn,orderKey);
		close(conn);
		return result;
	}
	public int updateDelivery(String type,int[] realOrders) {
		Connection conn = getConnection();
		int result = dao.updateDelivery(conn,type,realOrders);
		close(conn);
		return result;
	}
	
}
