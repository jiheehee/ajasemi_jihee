package com.aja.order.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDetail {
	private int odKey;
	private String optionName;
	private String prodName;
	private int odPrice;
	private int odQuantity;
}
