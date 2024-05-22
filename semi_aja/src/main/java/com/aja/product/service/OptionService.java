package com.aja.product.service;
import static com.aja.admin.common.JDBCTemplate.close;
import static com.aja.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.aja.product.model.dao.OptionDao;
import com.aja.product.model.dto.ProdOption;

public class OptionService {
	OptionDao dao = new OptionDao();
	
	public List<ProdOption> searchAllOption(){
		Connection conn = getConnection();
		List<ProdOption> list = dao.searchAllOption(conn);
		close(conn);
		return list;
	}
	public int enrollOption(ProdOption o) {
		Connection conn = getConnection();
		int result = dao.enrollOption(conn,o);
		close(conn);
		return result;
	}
}
