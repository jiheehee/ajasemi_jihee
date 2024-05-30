package com.aja.mypage.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {
	private int orderKey;
	private int custKey;
	private int orderPrice;
	private int orderSale;
	private Date orderDate;
	private String orderState;
	private String orderReason;
	private String orderPayoption;
	private String orderName;
	private String orderPostcode;
	private String orderAddress;
	private String orderDetailaddr;
	private String orderPhone;
	private String orderRequest;
	private String orderStatus;
	private String orderDelivery;
	@Builder.Default
	private List<OrderDetail> orderDetail = new ArrayList<>();
}
