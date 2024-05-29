package com.aja.productprint.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductDetailDao;
import com.aja.productprint.model.dto.Product;
import com.aja.productprint.model.dto.WishDTO;

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
	
	
	public int selectWishProduct(WishDTO wish) {
		Connection conn = getConnection();
		int wishNumber = dao.selectWishProduct(conn, wish);
		close(conn);
		return wishNumber;
	}
	
	
	public List<Integer> selectDetailProductCount(String prodName){
		Connection conn = getConnection();
		List<Integer> reviewQnaCount = dao.selectDetailProductCount(conn, prodName);
		close(conn);
		return reviewQnaCount;
	}
	
	
	
}
