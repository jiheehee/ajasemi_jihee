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
import com.aja.productprint.model.dto.WishDTO;



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
	
	
	
	public int selectWishProduct (Connection conn ,WishDTO wish) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int wishNumber = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectWishProductDetail"));
			pstmt.setInt(1, wish.getCustKey());
			pstmt.setInt(2, wish.getProdKey());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				wishNumber = rs.getInt("COUNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
//			System.out.println(list);
		}return wishNumber;
	}
	
	
	
public List<Integer> selectDetailProductCount(Connection conn, String prodName){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> reviewQnaCount = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectDetailProductCount"));
			pstmt.setString(1, prodName);
			pstmt.setString(2, prodName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reviewQnaCount.add(rs.getInt("REVIEW_COUNT"));
				reviewQnaCount.add(rs.getInt("QNA_COUNT"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			System.out.println("Dao에서 reviewQnaCount : "+reviewQnaCount.toString());
		}return reviewQnaCount;
		
		
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
					.prodDeleted(rs.getString("PROD_DELETED"))
					
					.keywordName(rs.getString("KEYWORD_NAME"))
					.cateName(rs.getString("CATE_NAME"))
					.optionFlavor(rs.getString("OPTION_FLAVOR"))
					.optionSize(rs.getInt("OPTION_SIZE"))
					.optionPrice(rs.getInt("OPTION_PRICE"))
					.build();
		}
	
	
		
	
}
