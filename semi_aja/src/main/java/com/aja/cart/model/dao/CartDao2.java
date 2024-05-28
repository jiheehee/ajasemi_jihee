package com.aja.cart.model.dao;

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

import com.aja.cart.model.dto.CartInfo;

public class CartDao2 {
	
//	Properties sql = new Properties();
//	
//	{
//		String path = CartDao2.class.getResource("/").getPath();
//		try(FileReader fr = new FileReader(path)) {
//			sql.load(fr);
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	public List<CartInfo> getCartInfo(Connection conn, int custKey) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CartInfo> cartInfoList = new ArrayList<CartInfo>();
		try {
			pstmt = conn.prepareStatement("SELECT P.PROD_NAME, P.PROD_STOCK, C.CART_KEY, O.OPTION_FLAVOR, O.OPTION_SIZE, O.OPTION_PRICE, C.CART_QUANTITY, P.PROD_PRICE "
													+ "FROM CART C "
													+ "LEFT JOIN PRODUCT P ON C.PROD_KEY = P.PROD_KEY "
													+ "LEFT JOIN PROD_OPTION O ON C.OPTION_KEY = O.OPTION_KEY "
													+ "WHERE C.CUST_KEY = ?");
			pstmt.setInt(1, custKey);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartInfoList.add(CartInfo.builder()
						.cartKey(rs.getInt("cart_key"))
						.optionFlavor(rs.getString("option_flavor"))
						.optionSize(rs.getInt("option_size"))
						.optionPrice(rs.getInt("option_price"))
						.cartQuantity(rs.getInt("cart_quantity"))
						.prodPrice(rs.getInt("prod_price"))
						.prodName(rs.getString("prod_name"))
						.prodStock(rs.getInt("prod_stock"))
						.build());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cartInfoList;
	}
}
