package com.aja.productprint.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.productprint.model.dto.Product;



public class ProductDetailDao {

	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql/product/productprint.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Product selectDetailProduct(Connection conn ,int prodKey) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product result = new Product();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectDetailProduct"));
			pstmt.setInt(1, prodKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = getProduct(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
//			System.out.println(result);
		}return result;
	}
	
	
	public List<Product> selectDetailProductList(Connection conn, int cateKey){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectDetailProductList"));
			pstmt.setInt(1, cateKey);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getProduct(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
//			System.out.println(list);
		}return list;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	//Product객체    // option 상품사진(나중에) 
		private Product getProduct(ResultSet rs) throws SQLException{
			return Product.builder()
					.prodKey(rs.getInt("PROD_KEY"))
					.optionKey(rs.getInt("OPTION_KEY"))
					.cateKey(rs.getInt("CATE_KEY"))
//					.keywordKey(rs.getInt("KEYWORD_KEY"))
					.prodName(rs.getString("PROD_NAME"))
					.prodPrice(rs.getInt("PROD_PRICE"))
					.prodStock(rs.getInt("PROD_STOCK"))
					.prodContent(rs.getString("PROD_CONTENT"))
					.prodDetailCon(rs.getString("PROD_DETAILCON"))
					.prodComponent(rs.getString("PROD_COMPONENT"))
					.prodEnrollDate(rs.getDate("PROD_ENROLLDATE"))
					.prodDeleted(rs.getBoolean("PROD_DELETED"))
					
					.keywordName(rs.getString("KEYWORD_NAME"))
					.cateName(rs.getString("CATE_NAME"))
					.optionFlavor(rs.getString("OPTION_FLAVOR"))
					.optionSize(rs.getInt("OPTION_SIZE"))
					.optionPrice(rs.getInt("OPTION_PRICE"))
					.build();
		}
	
	
		
	
}
