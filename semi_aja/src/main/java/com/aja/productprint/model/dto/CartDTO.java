package com.aja.productprint.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.NonFinal;

@Data
@AllArgsConstructor
@NonFinal
@Builder
public class CartDTO {
	private int cartKey;
	private int custKey;
	private int prodKey;
	private int optionKey;
	private int productCount;
	
	
	
}
