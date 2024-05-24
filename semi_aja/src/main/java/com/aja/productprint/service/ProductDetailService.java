package com.aja.productprint.service;

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
	
	
	public List<Product> selectDetailProductList(int cateKey){
		Connection conn = getConnection();
		List<Product> list = dao.selectDetailProductList(conn, cateKey);
		close(conn);
		return list;
	}
	
	
	
	
}
