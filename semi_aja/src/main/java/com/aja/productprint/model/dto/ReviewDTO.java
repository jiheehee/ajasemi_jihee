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
public class ReviewDTO {

	private int reviewKey;
	private int prodKey;
	private int custKey;
	private String reviewContent;
	private int reviewRate;
	private Date reviewEnrolldate;
	private Date reviewRedate;
	private String custNickname;
	
	
}
