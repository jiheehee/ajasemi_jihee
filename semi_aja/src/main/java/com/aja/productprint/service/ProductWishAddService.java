package com.aja.productprint.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.commit;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.aja.productprint.model.dao.ProductWishAddDao;
import com.aja.productprint.model.dto.WishDTO;

public class ProductWishAddService {

	ProductWishAddDao dao = new ProductWishAddDao();
			
	public int insertProductWishAdd(WishDTO wish) {
		Connection conn = getConnection();
		int result = dao.insertProductWishAdd(conn, wish);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
}
