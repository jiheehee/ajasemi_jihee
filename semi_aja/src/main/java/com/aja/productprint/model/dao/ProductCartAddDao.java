package com.aja.productprint.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		ResultSet rs = null;
		int result = 0;
		try {
			//장바구니고유번호(시퀸스), 회원고유번호, 상품고유번호, 옵션고유번호, 수량
			
			//	회원번호로 상품번호를 조회했을떄 이미 등록되어 있으면 등록안되게 막고, 이미 장바구니에 있는 상품입니다. 띄우기
			pstmt = conn.prepareStatement(sql.getProperty("ckeckProductCart"));
			pstmt.setInt(1, cart.getCustKey());
			pstmt.setInt(2, cart.getProdKey());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("COUNT");
			}
			if(result == 0) {
				//등록
				pstmt = conn.prepareStatement(sql.getProperty("insertProductCartAdd"));
				pstmt.setInt(1, cart.getCustKey());
				pstmt.setInt(2, cart.getProdKey());
				pstmt.setInt(3, cart.getOptionKey());
				pstmt.setInt(4, cart.getProductCount());
				result = pstmt.executeUpdate();
			}else {
				result = 0;
			}
				
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
