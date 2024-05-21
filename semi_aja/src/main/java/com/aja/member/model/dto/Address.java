package com.aja.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Address {
	private int addrKey;
	private int custKey;
	private String addrName;
	private String addrPostcode;
	private String addrAddress;
	private String addrDetail;
	private String addrPhone;
	private String addrRequest;
	private String addrDefault;
}
