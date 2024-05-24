package com.aja.productprint.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.aja.productprint.model.dto.CartDTO;

public class ProductCartAddDao {

	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql/product/productprint.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public int insertProductCartAdd(Connection conn ,CartDTO cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			//장바구니고유번호, 회원고유번호, 상품고유번호, 옵션고유번호, 수량
			pstmt = conn.prepareStatement(sql.getProperty("insertProductCartAdd"));
			pstmt.setInt(1, cart.getCustKey());
			pstmt.setInt(2, cart.getProdKey());
			pstmt.setInt(3, cart.getOptionKey());
			pstmt.setInt(4, cart.getProductCount());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
