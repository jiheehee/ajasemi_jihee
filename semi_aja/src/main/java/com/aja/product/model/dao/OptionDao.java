package com.aja.product.model.dao;

import static com.aja.admin.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.product.model.dto.ProdOption;

public class OptionDao {
	Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<ProdOption> searchAllOption(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProdOption> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllOption"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getOption(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int enrollOption(Connection conn,ProdOption o) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("enrollOption"));
			pstmt.setString(1, o.getOptionFlavor());
			pstmt.setString(2, o.getOptionSize());
			pstmt.setInt(3, o.getOptionPrice());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteOption(Connection conn,int optionKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteOption"));
			pstmt.setInt(1, optionKey);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	private ProdOption getOption(ResultSet rs) throws SQLException{
		return ProdOption.builder()
				.optionKey(rs.getInt("OPTION_KEY"))
				.optionFlavor(rs.getString("OPTION_FLAVOR"))
				.optionSize(rs.getString("OPTION_SIZE"))
				.optionPrice(rs.getInt("OPTION_PRICE"))
				.build();
	}
}
