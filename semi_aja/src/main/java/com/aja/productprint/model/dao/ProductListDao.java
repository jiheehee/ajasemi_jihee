package com.aja.productprint.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import static com.aja.common.JDBCTemplate.close;

public class ProductListDao {

	private Properties sql = new Properties();
	{
		String path = ProductListDao.class.getResource("/sql.product/productlist.properties").getPath();
		try (FileReader fr = new FileReader(path)) {	
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
