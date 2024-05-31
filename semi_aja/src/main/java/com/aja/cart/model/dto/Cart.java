package com.aja.cart.model.dto;

import com.aja.product.model.dto.ProdOption;
import com.aja.productprint.model.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Cart {

	private int custKey;
	private int prodKey;
	private int optionKey;
	private int cartQuantity;
	private Product product;
	private ProdOption option;
}
