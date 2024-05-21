package com.aja.admin.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@14.36.141.71:10011:xe","AJA","AJA");
			conn.setAutoCommit(false);
		}catch(ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null&&!stmt.isClosed()) stmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null&&!rs.isClosed()) rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
