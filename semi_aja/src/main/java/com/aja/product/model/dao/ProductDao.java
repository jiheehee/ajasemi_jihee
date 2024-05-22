package com.aja.product.model.dao;

import static com.aja.admin.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import com.aja.product.model.dto.Product;
import com.aja.product.model.dto.Product2;
import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/product/sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int[] enrollProduct(Connection conn,Product p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int[] result = new int[2];
		try {
			pstmt = conn.prepareStatement(sql.getProperty("enrollProduct"));
			pstmt.setInt(1,p.getKeywordKey());
			pstmt.setInt(2,p.getCateKey());
			pstmt.setString(3,p.getProdName());
			pstmt.setInt(4, p.getProdPrice());
			pstmt.setInt(5, p.getProdStock());
			pstmt.setString(6, p.getProdContent());
			pstmt.setString(7,p.getProdDetailCon());
			pstmt.setString(8, p.getProdComponent());
			int enrollResult = pstmt.executeUpdate();
			result[0] = enrollResult;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchProduct"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int prodKey = rs.getInt("PROD_KEY");
				result[1] = prodKey;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int enrollImages(Connection conn,MultipartRequest mr, int prodKey) {
		PreparedStatement pstmt= null;
		int result = 0 ;
		StringBuilder sqlBuilder = new StringBuilder("INSERT INTO PROD_IMAGE VALUES(SEQ_PROD_IMAGE.NEXTVAL,?,");
		int count = 0;
		
		Enumeration files = mr.getFileNames();
		while(files.hasMoreElements()) {
			if(count>0) {
				sqlBuilder.append(",");
			}
			sqlBuilder.append("?");
			files.nextElement();
			count++;
		}
		sqlBuilder.append(")");
		String sql1 = sqlBuilder.toString();
		System.out.println(sql1);
		try {
			pstmt = conn.prepareStatement(sql1);
			int index =2;
			pstmt.setInt(1, prodKey);
			files = mr.getFileNames();
			while(files.hasMoreElements()) {
				String fileName = (String)files.nextElement();
				String fileSystemName = mr.getFilesystemName(fileName);
				System.out.println(fileSystemName);
				System.out.println(fileName);
				pstmt.setString(index,fileSystemName);
				index++;
			}
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	public List<Product2> searchAllProduct(Connection conn){
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		List<Product2> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchAllProduct"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getProduct(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int deleteProduct(Connection conn,int prodKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteProduct"));
			pstmt.setInt(1, prodKey);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	private Product2 getProduct(ResultSet rs) throws SQLException{
		return Product2.builder()
				.prodKey(rs.getInt("PROD_KEY"))
				.prodName(rs.getString("PROD_NAME"))
				.optionFlavor(rs.getString("OPTION_FLAVOR"))
				.optionSize(rs.getInt("OPTION_SIZE"))
				.optionPrice(rs.getInt("OPTION_PRICE"))
				.cateName(rs.getString("CATE_NAME"))
				.keywordName(rs.getString("KEYWORD_NAME"))
				.prodPrice(rs.getInt("PROD_PRICE"))
				.prodStock(rs.getInt("PROD_STOCK"))
				.prodContent(rs.getString("PROD_CONTENT"))
				.prodDetailCon(rs.getString("PROD_DETAILCON"))
				.prodComponent(rs.getString("PROD_COMPONENT"))
				.prodEnrollDate(rs.getDate("PROD_ENROLLDATE"))
				.prodDeleted(rs.getBoolean("PROD_DELETED"))
				.build();
	}
	
	
}
