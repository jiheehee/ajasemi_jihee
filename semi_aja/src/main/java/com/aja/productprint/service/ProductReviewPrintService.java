package com.aja.productprint.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductReviewPrintDao;
import com.aja.productprint.model.dto.ReviewDTO;

public class ProductReviewPrintService {

	private ProductReviewPrintDao dao = new ProductReviewPrintDao();
			
	public List<ReviewDTO> selectProductAllReview (String prodName){
		Connection conn = getConnection();
		List<ReviewDTO> reviewList = dao.selectProductAllReview(conn, prodName);
		close(conn);
		return reviewList;
	}
	
//	public int selectProductAllReviewCount(String prodName){
//		Connection conn = getConnection();
//		int reviewCount = dao.selectProductAllReviewCount(conn,prodName);
//		close(conn);
//		return reviewCount;
//	}
	
	
}
