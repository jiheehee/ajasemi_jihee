package com.aja.productprint.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.aja.product.model.dto.ProdImage;

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
	private int cateKey;
	private int optionKey;
	//private int keywordKey;
	private String prodName;
	private int prodPrice;
	private int prodStock;
	private String prodContent;
	private String prodDetailCon;
	private String prodComponent;
	private Date prodEnrollDate;
	private boolean prodDeleted;
	
	private String keywordName;
	private String optionFlavor;
	private int optionSize;
	private int optionPrice;
	private String cateName;
	//이미지 리스트형식으로 한번에 가져오기
}
