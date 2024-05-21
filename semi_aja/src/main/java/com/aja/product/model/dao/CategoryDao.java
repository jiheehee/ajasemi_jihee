package com.aja.product.model.dao;

import static com.aja.admin.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.aja.product.model.dto.Category;
import com.aja.product.model.dto.Keyword;

public class CategoryDao {
	
	Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollCategory(Connection conn,String name) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("enrollCategory"));
			pstmt.setString(1, name);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int enrollKeyword(Connection conn,String name) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("enrollKeyword"));
			pstmt.setString(1,name);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public List<Category> searchAllCategory(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllCategory"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getCategory(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<Keyword> searchAllKeyword(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Keyword> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllKeyword"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getKeyword(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int deleteKeyword(Connection conn,int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteKeyword"));
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteCategory(Connection conn,int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteCategory"));
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	private Keyword getKeyword(ResultSet rs) throws SQLException{
		return Keyword.builder()
				.keywordKey(rs.getInt("KEYWORD_KEY"))
				.keywordName(rs.getString("KEYWORD_NAME"))
				.build();
	}
	private Category getCategory(ResultSet rs) throws SQLException{
		return Category.builder()
				.cateKey(rs.getInt("CATE_KEY"))
				.cateName(rs.getString("CATE_NAME"))
				.build();
	}
	
}
