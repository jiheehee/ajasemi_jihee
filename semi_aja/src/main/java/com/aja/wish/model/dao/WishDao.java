package com.aja.wish.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aja.productprint.model.dto.Product;
import com.aja.wish.model.dto.Wish;


public class WishDao {
	
	public List<Wish> wishList(Connection conn,int custKey){
		
//		String sql="SELECT * FROM WISH LEFT JOIN PRODUCT p USING(PROD_KEY) WHERE CUST_KEY=?";
		
		PreparedStatement pstmt=null;		
		ResultSet rs=null;
		List<Wish> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM WISH LEFT JOIN PRODUCT USING(PROD_KEY) LEFT JOIN KEYWORD USING(KEYWORD_KEY) LEFT JOIN CATEGORY USING(CATE_KEY) LEFT JOIN PROD_OPTION USING(OPTION_KEY) WHERE CUST_KEY= ?");
			pstmt.setInt(1,custKey);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Wish w = new Wish();
				w.setCustKey(rs.getInt("cust_key"));
				w.setProdKey(rs.getInt("prod_key"));
				w.setProduct(getProduct(rs));
				result.add(w);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;		
	}
	
	private Product getProduct(ResultSet rs) throws SQLException{
		return Product.builder()
				.prodKey(rs.getInt("PROD_KEY"))
				.optionKey(rs.getInt("OPTION_KEY"))
				.cateKey(rs.getInt("CATE_KEY"))
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
	
	public int deleteWish(Connection conn,int prodKey){
		
		PreparedStatement pstmt=null;		
		int rs=0;
		try {
			pstmt=conn.prepareStatement("DELETE FROM WISH WHERE PROD_KEY =?");
			pstmt.setInt(1,prodKey);
			rs=pstmt.executeUpdate();						
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	

}
