package com.aja.cart.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.rollback;

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
	
	public int updateAmountFromCart(int custKey, int cartKey, int amount) {
		Connection conn = getConnection();
		int result = new CartDao2().updateAmountFromCart(conn, custKey, cartKey, amount);
		if(result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
}
