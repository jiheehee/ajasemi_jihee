package com.aja.coupon.model.dao;

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

import com.aja.coupon.model.dto.Coupon;
import com.aja.product.model.dao.ProductDao;

public class CouponDao {
	Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/coupon/sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Coupon> selectCouponAll(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coupon> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectCouponAll"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getCoupon(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int enrollCoupon(Connection conn,String couponName,int couponSale) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("enrollCoupon"));
			pstmt.setString(1, couponName);
			pstmt.setInt(2, couponSale);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	
	}
	public int deleteCoupon(Connection conn,int couponKey) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteCoupon"));
			pstmt.setInt(1, couponKey);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public Coupon searchCoupon(Connection conn, int couponKey) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Coupon c = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchCoupon"));
			pstmt.setInt(1, couponKey);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = getCoupon(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
	public int updateCoupon(Connection conn,Coupon c) {
		PreparedStatement pstmt= null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updateCoupon"));
			pstmt.setString(1, c.getCouponName());
			pstmt.setInt(2, c.getCouponSale());
			pstmt.setInt(3, c.getCouponKey());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int birthdayCouponDistribute(Connection conn,int custKey,int couponKey) {
		PreparedStatement pstmt =null;
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("birthdayCouponDistribute"));
			pstmt.setInt(1, custKey);
			pstmt.setInt(2, couponKey);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public List selectBirthdayCustomer(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> custKeyList = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBirthdayCustomer"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				custKeyList.add(rs.getInt("CUST_KEY"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return custKeyList;
	}
	private Coupon getCoupon(ResultSet rs)throws SQLException{
		return Coupon.builder()
				.couponKey(rs.getInt("COUPON_KEY"))
				.couponName(rs.getString("COUPON_NAME"))
				.couponSale(rs.getInt("COUPON_SALE"))
				.build();
	}
}
