package com.aja.mypage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDetail {
	private int odKey;
	private int optionKey;
	private int prodKey;
	private int orderKey;
	private int odPrice;
	private int odQuantity;
	private	Product product; 
	// 이렇게 해줘야 할 거 같고 
	// Product 클래스 안에는, 기본값 + 조인값 + (List 로 상품이미지) 가져와야 할 거 같음 !!
}
