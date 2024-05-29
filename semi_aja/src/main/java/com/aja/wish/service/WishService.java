package com.aja.wish.service;

import static com.aja.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.aja.wish.model.dao.WishDao;
import com.aja.wish.model.dto.Wish;

public class WishService {
	
	private WishDao dao=new WishDao(); 
	
	public List<Wish> wishList(int custKey){		
		
		Connection conn=getConnection();
		List<Wish> wish=dao.wishList(conn,custKey);
		close(conn);
		return wish;
	}
	

}
