package com.aja.productprint.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductQnaDTO {

	private int pqnaKey;
	private int custKey;
	private int prodKey; 
	private String pqnaTitle;
	private String pqnaContent;
	private String pqnaImage;
	private Date pqnaEnrolldate;
	private String pqnaSecret;
	private String pqnaCategory;
	
	private String prodName;
	
	private String prodcsContent;
	private Date prodcsEnrollMent;
	
	private String custNickname;
}
