package com.aja.qna.model.dao;

import static com.aja.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aja.qna.model.dto.Qna;

public class QnaDao {
	
	/*
	 * public List<Qna> QnaList(Connection conn){ PreparedStatement pstmt=null;
	 * ResultSet rs=null; List<Qna> result=new ArrayList<>();
	 * 
	 * try {
	 * 
	 * pstmt=conn.prepareStatement("SELECT * FROM QNA)
	 * 
	 * 
	 * }catch(SQLException e) { e.printStackTrace(); }finally { close(pstmt);
	 * close(rs); }
	 * 
	 * 
	 * }
	 */

}
