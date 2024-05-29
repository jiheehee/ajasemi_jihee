package com.aja.wish.model.dto;

import com.aja.productprint.model.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Wish {
	
	private int custKey;
	private int prodKey;
	private Product product; 

}
