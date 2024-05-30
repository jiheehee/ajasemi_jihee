package com.aja.product.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.product.model.dao.ProductDao;
import com.aja.product.model.dto.Product;
import com.aja.product.model.dto.Product2;
import com.oreilly.servlet.MultipartRequest;

public class ProductService {
	private ProductDao dao = new ProductDao();
	
	public int[] enrollProduct(Product p) {
		Connection conn = getConnection();
		int[] result = dao.enrollProduct(conn,p);
		close(conn);
		return result;
	}
	public int updateImages(MultipartRequest mr,int prodKey) {
		Connection conn = getConnection();
		int result = dao.updateImages(conn,mr,prodKey);
		close(conn);
		return result;
	}
	public int enrollImages(MultipartRequest mr,int prodKey) {
		Connection conn = getConnection();
		int result = dao.enrollImages(conn,mr,prodKey);
		close(conn);
		return result;
	}
	public int selectProductCount() {
		Connection conn = getConnection();
		int result = dao.selectProductCount(conn);
		close(conn);
		return result;
	}
	public List<Product2> searchAllProduct(int cPage, int numPerpage){
		Connection conn = getConnection();
		
		List<Product2> list = dao.searchAllProduct(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int deleteProduct(int prodKey) {
		Connection conn = getConnection();
		int result = dao.deleteProduct(conn,prodKey);
		close(conn);
		return result;
	}
	public Product2 selectProduct(int prodKey) {
		Connection conn = getConnection();
		Product2 p = dao.selectProduct(conn, prodKey);
		close(conn);
		return p;
	}
	public int updateProduct(Product p) {
		Connection conn = getConnection();
		int result= dao.updateProduct(conn,p);
		close(conn);
		return result;
	}
	public int selectOption(String flavor,int size) {
		Connection conn = getConnection();
		int optionKey = dao.selectOption(conn,flavor,size);
		close(conn);
		return optionKey;
	}
}
