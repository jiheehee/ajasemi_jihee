package com.aja.cart.service;

import static com.aja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.aja.cart.model.dao.CartDao;
import com.aja.cart.model.dto.Cart;

public class CartService {
	
	private CartDao dao=new CartDao();
	
	public List<Cart> getCartList(int custKey){
		
		Connection conn=getConnection();
		List<Cart> cart=dao.getCartList(conn,custKey);
		close(conn);
		return cart;		
	}

}
