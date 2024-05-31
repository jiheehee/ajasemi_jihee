package com.aja.cart.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartInfo {
	private int cartKey;
	private String optionFlavor;
	private int optionSize;
	private int optionPrice;
	private int cartQuantity;
	private int prodPrice;
	private String prodName;
	private int prodStock;
	private String cartImage1;
}
