package com.aja.coupon.service;

import static com.aja.admin.common.JDBCTemplate.close;
import static com.aja.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.coupon.model.dao.CouponDao;
import com.aja.coupon.model.dto.Coupon;

public class CouponService {
	private CouponDao dao = new CouponDao();
	
	public List<Coupon> selectCouponAll(){
		Connection conn = getConnection();
		List<Coupon> list = dao.selectCouponAll(conn);
		close(conn);
		return list;
	}
	public int enrollCoupon(String couponName,int couponSale) {
		Connection conn = getConnection();
		int result = dao.enrollCoupon(conn,couponName,couponSale);
		close(conn);
		return result;
	}
	public int deleteCoupon(int couponKey) {
		Connection conn = getConnection();
		int result = dao.deleteCoupon(conn,couponKey);
		close(conn);
		return result;
	}
	public Coupon searchCoupon(int couponKey) {
		Connection conn = getConnection();
		Coupon c = dao.searchCoupon(conn,couponKey);
		close(conn);
		return c;
	}
	public int updateCoupon(Coupon c) {
		Connection conn = getConnection();
		int result = dao.updateCoupon(conn,c);
		close(conn);
		return result;
	}
	public int birthdayCouponDistribute(int couponKey){
		Connection conn = getConnection();
		int result = dao.birthdayCouponDistribute(conn,couponKey);
		close(conn);
		return result;
	}
	public List selectBirthdayCustomer() {
		Connection conn = getConnection();
		List result = dao.selectBirthdayCustomer(conn);
		close(conn);
		return result;
	}
}
