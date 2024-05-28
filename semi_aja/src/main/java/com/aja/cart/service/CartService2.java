package com.aja.cart.service;

import static com.aja.admin.common.JDBCTemplate.close;
import static com.aja.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.cart.model.dao.CartDao2;
import com.aja.cart.model.dto.CartInfo;

public class CartService2 {
	
	public List<CartInfo> getCartInfo(int custKey) {
		Connection conn = getConnection();
		List<CartInfo> cartList = new CartDao2().getCartInfo(conn, custKey);
		close(conn);
		return cartList;   
	}
}
