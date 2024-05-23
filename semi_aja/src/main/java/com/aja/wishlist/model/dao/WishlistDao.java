package com.aja.wishlist.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.aja.wishlist.model.dto.Wishlist;

public class WishlistDao {
	
	public ArrayList <Wishlist> getList(String userID,int pageNumber){
		//지희야 오류만 안나게 수정했어
		String sql="SELECT * FROM Wishlist WHERE wishKey IN(select from wish where userID=?)ORDER BY wishKey DESC LIMIT 10";
		ArrayList<Wishlist> list=new ArrayList<Wishlist>();
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<Wishlist> wishtlist = new ArrayList<Wishlist>();
		PreparedStatement pstmt = null;		
		try {
			//Connection conn;
			pstmt=conn.prepareStatement(sql);
			//ResultSet rs=null;
			rs=pstmt.executeQuery();
			String result=null;
			while(rs.next()) {
				Wishlist wish=new Wishlist();
				wish.setCustKey(rs.getInt(1));
				wish.setProdKdy(rs.getInt(2));
				list.add(wish);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return null;				
	}

}
