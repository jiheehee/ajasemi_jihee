package com.aja.mypage.service;

import static com.aja.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import com.aja.mypage.model.dao.MypageDao;
import com.aja.mypage.model.dto.Order;

public class OrderService {
	
	private MypageDao dao = new MypageDao();
	
	public List<Order> selectOrderAll(int custKey, int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Order> result=dao.selectOrderAll(conn,custKey,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public int selectOrderCount() {
		Connection conn=getConnection();
		int result=dao.selectOrderAllCount(conn);
		close(conn);
		return result;
	}
}
