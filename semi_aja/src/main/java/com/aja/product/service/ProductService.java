package com.aja.product.service;

import static com.aja.admin.common.JDBCTemplate.close;
import static com.aja.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.product.model.dao.ProductDao;
import com.aja.product.model.dto.Product;
import com.aja.product.model.dto.Product2;

public class ProductService {
	private ProductDao dao = new ProductDao();
	
	public int enrollProduct(Product p) {
		Connection conn = getConnection();
		int result = dao.enrollProduct(conn,p);
		close(conn);
		return result;
	}
	public List<Product2> searchAllProduct(){
		Connection conn = getConnection();
		
		List<Product2> list = dao.searchAllProduct(conn);
		close(conn);
		return list;
	}
	public int deleteProduct(int prodKey) {
		Connection conn = getConnection();
		int result = dao.deleteProduct(conn,prodKey);
		close(conn);
		return result;
	}
}
