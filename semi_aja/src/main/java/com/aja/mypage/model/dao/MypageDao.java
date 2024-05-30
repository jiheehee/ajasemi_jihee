package com.aja.mypage.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.mypage.model.dto.Order;
import com.aja.mypage.model.dto.OrderDetail;
import com.aja.mypage.model.dto.Product;
import com.aja.product.model.dto.ProdImage;

public class MypageDao {
	
	private Properties sql = new Properties();
	
	{	
		String path = MypageDao.class.getResource("/sql/order/sql_order.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Order> selectOrderAll(Connection conn, int custKey, int cPage, int numPerpage){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Order> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectOrderAll"));
			pstmt.setInt(1, custKey);			
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				getOrderAndOrderDetail(result,rs);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectOrderAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectOrderCount"));
			rs=pstmt.executeQuery();
			
			if(rs.next()) result=rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	private void getOrderAndOrderDetail(List<Order> result, ResultSet rs) throws SQLException {
		int pk = rs.getInt("order_key");
		
		if(result.stream().anyMatch(r->r.getOrderKey()==pk)) { 
			result.stream().filter(o->o.getOrderKey()==pk)
			.forEach(o-> {
				try {
					if(rs.getString("prod_key")!=null) {
						o.getOrderDetail().add(getOrderDetail(rs));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			});
		} else {
			Order o = getOrder(rs);
			if(rs.getString("prod_key")!=null) {
				o.getOrderDetail().add(getOrderDetail(rs));
			}
			result.add(o);
			
		}
		
	}
	
	private Product getProduct(ResultSet rs) throws SQLException {
		return Product.builder().prodName(rs.getString("prod_name"))
				.prodPrice(rs.getInt("prod_price"))
				.optionSize(rs.getInt("option_size"))
				.optionPrice(rs.getInt("option_price"))
				.optionFlavor(rs.getString("option_flavor"))
				.build();
	}
	
	private Order getOrder(ResultSet rs) throws SQLException{
		return Order.builder()
				.orderKey(rs.getInt("order_key"))
				.orderAddress(rs.getString("order_address"))
				.orderDate(rs.getDate("order_date"))
				.orderDetailaddr(rs.getString("order_detailaddr"))
				.orderName(rs.getString("order_name"))
				.orderPayoption(rs.getString("order_payoption"))
				.orderPhone(rs.getString("order_phone"))
				.orderPostcode(rs.getString("order_postcode"))
				.orderPrice(rs.getInt("order_price"))
				.orderSale(rs.getInt("order_sale"))
				.orderStatus(rs.getString("order_status"))
				.orderDelivery(rs.getString("order_delivery"))
				.build();
	}
	
	private OrderDetail getOrderDetail(ResultSet rs) throws SQLException{
		return OrderDetail.builder()
				.odQuantity(rs.getInt("od_quantity"))
				.optionKey(rs.getInt("option_key"))
				.prodKey(rs.getInt("prod_key"))
				.product(getProduct(rs))
				.build();
	}
	
}
