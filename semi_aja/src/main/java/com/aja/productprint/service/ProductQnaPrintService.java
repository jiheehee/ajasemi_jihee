package com.aja.productprint.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.productprint.model.dao.ProductQnaPrintDao;
import com.aja.productprint.model.dao.ProductReviewPrintDao;
import com.aja.productprint.model.dto.ProductQnaDTO;
import com.aja.productprint.model.dto.ReviewDTO;

public class ProductQnaPrintService {

	private ProductQnaPrintDao dao = new ProductQnaPrintDao();
	
	public List<ProductQnaDTO> selectProductAllQna (String prodName){
		Connection conn = getConnection();
		List<ProductQnaDTO> qnaList = dao.selectProductAllQna(conn, prodName);
		close(conn);
		return qnaList;
	}
	
	
}
