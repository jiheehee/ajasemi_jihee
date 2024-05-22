package com.aja.productlist.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private int prodKey;
	private int optionKey;
	private int cateKey;
	private int keywordKey;
	private String prodName;
	private int prodPrice;
	private int prodStock;
	private String prodContent;
	private String prodDetailCon;
	private String prodComponent;
	private Date prodEnrollDate;
	private boolean prodDeleted;
}
