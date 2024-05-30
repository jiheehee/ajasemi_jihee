package com.aja.productprint.service;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductListDao;
import com.aja.productprint.model.dto.Product;
import static com.aja.common.JDBCTemplate.*;


public class ProductListService {

	private ProductListDao dao = new ProductListDao();
	
	public List<Product> selectAllProduct(int cateKey ,int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Product> result = dao.selectAllProduct(conn, cateKey, cPage, numPerpage);
		close(conn);
		return result;
	}
	
	
	public int selectAllProductCount(int cateKey){
		Connection conn = getConnection();
		int result = dao.selectAllProductCount(conn, cateKey);
		close(conn);
		return result;
	}
	
	
	public List<Integer> selectWishProduct(int custKey) {
		Connection conn = getConnection();
		List<Integer> result = dao.selectWishProduct(conn, custKey);
		close(conn);
		return result;
	}
	public Product selectProductImage(int prodKey) {
		Connection conn = getConnection();
		Product p = dao.selectProductImage(conn,prodKey);
		close(conn);
		return p;
	}
	
	
	
}
