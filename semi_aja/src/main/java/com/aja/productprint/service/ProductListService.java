package com.aja.productprint.service;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductListDao;
import com.aja.productprint.model.dto.Product;
import static com.aja.common.JDBCTemplate.*;


public class ProductListService {

	private ProductListDao dao = new ProductListDao();
	
	public List<Product> selectAllProduct(){
		Connection conn = getConnection();
		List<Product> result = dao.selectAllProduct(conn);
		close(conn);
		return result;
	}
	
	
	
	
}
