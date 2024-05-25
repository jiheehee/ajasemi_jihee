package com.aja.member.model.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	private String prodImage;
	private String prodName;
	private String prodContent;
	private String optionFlavor;
	private String optionSize;
	private int optionPrice;
	private int prodPrice;
	private int cartQuantity;
	private int cartKey;
	private int optionKey;
	private int prodKey;
}
