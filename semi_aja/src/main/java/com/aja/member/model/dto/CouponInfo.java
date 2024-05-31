package com.aja.member.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CouponInfo {
	private int dcKey;
	private String couponName;
	private int couponSale;
	private Date couponDate;
	private Date couponEnddate;
	private String custPoint;
}
