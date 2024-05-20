package com.aja.notice.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private String noticeTitle;
	private String noticeImage;
	private String noticeContent;
	private Date noticeEnrolldate;	
	
}
