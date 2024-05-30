package com.aja.productprint.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Option {
	private int optionKey;
	private String optionName;
	private int optionSize;
	private int optionPrice;
}
