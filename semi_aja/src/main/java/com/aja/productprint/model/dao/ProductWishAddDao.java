package com.aja.productprint.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.aja.productprint.model.dto.WishDTO;

public class ProductWishAddDao {

	
	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql/product/productprint.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertProductWishAdd(Connection conn ,WishDTO wish) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("ckeckProductWish"));
			pstmt.setInt(1, wish.getCustKey());
			pstmt.setInt(2, wish.getProdKey());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("COUNT");
			}
			if(result > 0) {
				//삭제
				pstmt = conn.prepareStatement(sql.getProperty("deleteProductWish"));
				pstmt.setInt(1, wish.getCustKey());
				pstmt.setInt(2, wish.getProdKey());
				result = pstmt.executeUpdate();
			}else {
				//등록
				//찜 고유번호(시퀸스), 회원고유번호, 상품고유번호
				pstmt = conn.prepareStatement(sql.getProperty("insertProductWishAdd"));
				pstmt.setInt(1, wish.getCustKey());
				pstmt.setInt(2, wish.getProdKey());
				result = pstmt.executeUpdate();		
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
}
