package com.aja.product.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product2 {
	private int prodKey;
	private String prodName;
	private String optionFlavor;
	private int optionSize;
	private int optionPrice;
	private String cateName;
	private String keywordName;
	private int prodPrice;
	private int prodStock;
	private String prodImage1;
	private String prodImage2;
	private String prodImage3;
	private String prodImage4;
	private String prodImage5;
	private String prodContent;
	private String prodDetailCon;
	private String prodComponent;
	private Date prodEnrollDate;
	private boolean prodDeleted;
	
}
