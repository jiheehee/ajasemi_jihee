package com.aja.product.service;

import static com.aja.common.JDBCTemplate.close;
import static com.aja.common.JDBCTemplate.getConnection;
import static com.aja.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.aja.product.model.dao.CategoryDao;
import com.aja.product.model.dto.Category;
import com.aja.product.model.dto.Keyword;

public class CategoryService {
	CategoryDao dao= new CategoryDao();
	
	public int enrollCategory(String name) {
		Connection conn = getConnection();
		int result = dao.enrollCategory(conn,name);
		if(result==0) rollback(conn);
		close(conn);
		return result;
	}
	public List<Category> searchAllCategory(){
		Connection conn = getConnection();
		List<Category> list = dao.searchAllCategory(conn);
		close(conn);
		return list;
	}
	public int enrollKeyword(String name) {
		Connection conn = getConnection();
		int result = dao.enrollKeyword(conn,name);
		if(result==0) rollback(conn);
		close(conn);
		return result;
	}
	public List<Keyword> searchAllKeyword(){
		Connection conn = getConnection();
		List<Keyword> list = dao.searchAllKeyword(conn);
		close(conn);
		return list;
	}
	public int deleteCategory(int num) {
		Connection conn = getConnection();
		int result = dao.deleteCategory(conn,num);
		close(conn);
		return result;
	}
	public int deleteKeyword(int num) {
		Connection conn = getConnection();
		int result = dao.deleteKeyword(conn,num);
		close(conn);
		return result;
	}
}
