package com.aja.productprint.service;

import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductDetailDao;
import com.aja.productprint.model.dto.Product;
import static com.aja.common.JDBCTemplate.*;

public class ProductDetailService {

	private ProductDetailDao dao = new ProductDetailDao();
	
	public Product selectDetailProduct(int prodKey){
		Connection conn = getConnection();
		Product result = dao.selectDetailProduct(conn,prodKey);
		close(conn);
		return result;
	}
	
	
	
	
}
