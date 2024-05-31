package com.aja.cart.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.aja.common.JDBCTemplate.close;

import com.aja.cart.model.dto.Cart;
import com.aja.product.model.dto.ProdOption;
import com.aja.productprint.model.dto.Product;

public class CartDao {

	public List<Cart> getCartList(Connection conn,int custKey){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Cart> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM cart c JOIN PRODUCT p ON (p.PROD_KEY=c.prod_key) JOIN CATEGORY c2 using(cate_key) "
					+ "				JOIN KEYWORD k using(keyword_key)"
					+ "JOIN PROD_OPTION po ON po.option_key=c.OPTION_KEY WHERE cust_key=?");
			pstmt.setInt(1,custKey);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Cart c=getCart(rs);
				result.add(c);
			}						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {			
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	private Cart getCart(ResultSet rs) throws SQLException{
		return Cart.builder()
				.custKey(rs.getInt("cust_key"))
				.prodKey(rs.getInt("prod_key"))
				.optionKey(rs.getInt("option_key"))
				.cartQuantity(rs.getInt("CART_QUANTITY"))
				.product(getProduct(rs))
				.option(getOption(rs))
				.build();
	}
	
	private ProdOption getOption(ResultSet rs) throws SQLException{
		return ProdOption.builder()
				.optionKey(rs.getInt("OPTION_KEY"))
				.optionFlavor(rs.getString("OPTION_FLAVOR"))
				.optionSize(rs.getString("OPTION_SIZE"))
				.optionPrice(rs.getInt("OPTION_PRICE"))
				.build();
	}
	private Product getProduct(ResultSet rs) throws SQLException{
		return Product.builder()
				.prodKey(rs.getInt("PROD_KEY"))
				.optionKey(rs.getInt("OPTION_KEY"))
				.cateKey(rs.getInt("CATE_KEY"))
				.prodName(rs.getString("PROD_NAME"))
				.prodPrice(rs.getInt("PROD_PRICE"))
				.prodStock(rs.getInt("PROD_STOCK"))
				.prodContent(rs.getString("PROD_CONTENT"))
				.prodDetailCon(rs.getString("PROD_DETAILCON"))
				.prodComponent(rs.getString("PROD_COMPONENT"))
				.prodEnrollDate(rs.getDate("PROD_ENROLLDATE"))
				.prodDeleted(rs.getString("PROD_DELETED"))
				.keywordName(rs.getString("KEYWORD_NAME"))
				.cateName(rs.getString("CATE_NAME"))
				.optionFlavor(rs.getString("OPTION_FLAVOR"))
				.optionSize(rs.getInt("OPTION_SIZE"))
				.optionPrice(rs.getInt("OPTION_PRICE"))
				.build();
	}
	
	
}
