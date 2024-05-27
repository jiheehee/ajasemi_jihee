package com.aja.productprint.service;

import java.sql.Connection;

import com.aja.productprint.model.dao.ProductCartAddDao;
import com.aja.productprint.model.dto.CartDTO;
import static com.aja.common.JDBCTemplate.*;


public class ProductCartAddService {

	private ProductCartAddDao dao = new ProductCartAddDao();
	
	public int insertProductCartAdd(CartDTO cart) {
		Connection conn = getConnection();
		int result = dao.insertProductCartAdd(conn, cart);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
