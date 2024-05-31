package com.aja.product.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProdOption {
	private int optionKey;
	private String optionFlavor;
	private String optionSize;
	private int optionPrice;
}
