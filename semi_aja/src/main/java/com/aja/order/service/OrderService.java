package com.aja.order.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.order.model.dao.OrderDao;
import com.aja.order.model.dto.CustomerOrder;
import com.aja.order.model.dto.OrderDetail;
import com.aja.order.model.dto.OrderRefund;
import com.aja.order.model.dto.OrderStock;

public class OrderService {
	private OrderDao dao = new OrderDao();
	
	public List<CustomerOrder> selectOrderAll(int cPage,int numPerpage){
	Connection conn = getConnection();
	List<CustomerOrder> orderList = dao.selectOrderAll(conn,cPage,numPerpage);
	close(conn);
	return orderList;
	}
	public List<CustomerOrder> selectOrderAll1(String status){
		Connection conn = getConnection();
		List<CustomerOrder> orderList = dao.selectOrderAll1(conn,status);
		close(conn);
		return orderList;
		}
	public List<CustomerOrder> selectOrderAll(String type){
		Connection conn = getConnection();
		List<CustomerOrder> orderList = dao.selectOrderAll(conn,type);
		close(conn);
		return orderList;
	}
	public List<CustomerOrder> selectOrderAll(){
		Connection conn = getConnection();
		List<CustomerOrder> orderList = dao.selectOrderAll(conn);
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
	public int deliveryComplete(int orderKey) {
		Connection conn = getConnection();
		int result = dao.deliveryComplete(conn,orderKey);
		close(conn);
		return result;
	}
	public OrderRefund orderRefundInfo(int orderKey){
		Connection conn = getConnection();
		OrderRefund or = dao.orderRefundInfo(conn,orderKey);
		close(conn);
		return or;
	}
	public List orderDetailList(int orderKey) {
		Connection conn = getConnection();
		List orderDetailList = dao.orderDetailList(conn,orderKey);
		close(conn);
		return orderDetailList;
	}
	public int refundPoint(int orderPoint, int custKey) {
		Connection conn = getConnection();
		int result = dao.refundPoint(conn,orderPoint,custKey);
		close(conn);
		return result;
	}
	public int refundCoupon(int dcKey) {
		Connection conn = getConnection();
		int result = dao.refundCoupon(conn,dcKey);
		close(conn);
		return result;
	}
	public int orderStatusUpdate(int osKey) {
		Connection conn = getConnection();
		int result = dao.orderStatusUpdate(conn, osKey);
		close(conn);
		return result;
	}
	public OrderStock orderStockRollback(int odKey) {
		Connection conn = getConnection();
		OrderStock os = dao.orderStockRollback(conn,odKey);
		close(conn);
		return os;
	}
	public int orderStockUpdate(int prodKey, int quantity) {
		Connection conn = getConnection();
		int result = dao.orderStockUpdate(conn,prodKey,quantity);
		close(conn);
		return result;
	}
	
}
