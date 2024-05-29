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

import com.aja.productprint.model.dto.ReviewDTO;

public class ProductReviewPrintDao {

	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql/product/productprint.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<ReviewDTO> selectProductAllReview(Connection conn, String prodName){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> reviewList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductAllReview"));
			pstmt.setString(1, prodName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reviewList.add(getReviewDTO(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			//System.out.println("reviewList : "+reviewList);
		}return reviewList;
		
		
	}
	
	
//public int selectProductAllReviewCount (Connection conn ,String prodName) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int reviewCount = 0;
//		try {
//			pstmt = conn.prepareStatement(sql.getProperty("selectProductAllReviewCount"));
//			pstmt.setString(1, prodName);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				reviewCount = rs.getInt("COUNT");
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//			//System.out.println("reviewCount : "+reviewCount);
//		}return reviewCount;
//	}
	
	
	
	
	
	
	
	
	private ReviewDTO getReviewDTO(ResultSet rs) throws SQLException{
		return ReviewDTO.builder()
				.reviewKey(rs.getInt("REVIEW_KEY"))
				.prodKey(rs.getInt("PROD_KEY"))
				.custKey(rs.getInt("CUST_KEY"))
				.reviewContent(rs.getString("REVIEW_CONTENT"))
				.reviewRate(rs.getInt("REVIEW_RATE"))
				.reviewEnrolldate(rs.getDate("REVIEW_ENROLLDATE"))
				.reviewRedate(rs.getDate("REVIEW_REDATE"))
				.custNickname(rs.getString("CUST_NICKNAME"))
				.build();
	}
	
	
	
	
}
