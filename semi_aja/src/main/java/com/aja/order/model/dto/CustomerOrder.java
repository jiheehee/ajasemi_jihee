package com.aja.order.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerOrder {
	int orderKey;
	int custKey;
	String custName;
	int orderPrice;
	//상품가 + 옵션가
	Date orderDate;
	String orderDelivery;
	String orderStatus;
	
	
}
