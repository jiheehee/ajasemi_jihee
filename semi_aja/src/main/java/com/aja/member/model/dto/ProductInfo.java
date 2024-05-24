package com.aja.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductInfo {
	private String prodImage;
	private String prodName;
	private String prodContent;
	private String optionFlavor;
	private String optionSize;
	private int optionPrice;
	private int prodPrice;
	private int cartQuantity;
	private int cartKey;
}
