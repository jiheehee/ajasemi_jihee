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
public class Customer {
	private int custKey;
	private String custEmail;
	private String custPw;
	private String custName;
	private String custNickname;
	private String custPhone;
	private String custGender;
	private String custBirth;
	private String custPostcode;
	private String custAddress;
	private String custDetailAddress;
	private String custDelete;
	private Date custEnrollDate;
}
