package com.aja.productprint.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.productprint.model.dto.ProductQnaDTO;
import com.aja.productprint.model.dto.ReviewDTO;

public class ProductQnaPrintDao {

	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql/product/productprint.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<ProductQnaDTO> selectProductAllQna(Connection conn, String prodName){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductQnaDTO> qnaList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductAllQna"));
			pstmt.setString(1, prodName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qnaList.add(getProductQnaDTO(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			System.out.println("qnaList : "+qnaList);
		}return qnaList;
		
		
	}
	
	
	
	
	private ProductQnaDTO getProductQnaDTO(ResultSet rs) throws SQLException{
		return ProductQnaDTO.builder()
				.pqnaKey(rs.getInt("PQNA_KEY"))
				.custKey(rs.getInt("CUST_KEY"))
				.prodKey(rs.getInt("PROD_KEY"))
				.pqnaTitle(rs.getString("PQNA_TITLE"))
				.pqnaContent(rs.getString("PQNA_CONTENT"))
				.pqnaImage(rs.getString("PQNA_IMAGE"))
				.pqnaEnrolldate(rs.getDate("PQNA_ENROLLDATE"))
				.pqnaSecret(rs.getString("PQNA_SECRET"))
				.pqnaCategory(rs.getString("PQNA_CATEGORY"))
				.prodName(rs.getString("PROD_NAME"))
				.prodcsContent(rs.getString("PRODCS_CONTENT"))
				.prodcsEnrollMent(rs.getDate("PRODCS_ENROLLMENT"))
				.custNickname(rs.getString("CUST_NICKNAME"))
				.build();
		
				
	}
	
	
	
	
	
}
