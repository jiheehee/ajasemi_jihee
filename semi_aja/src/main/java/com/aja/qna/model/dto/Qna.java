package com.aja.qna.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Qna {
	
	private int qnaKey;
	private int custKey;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaEnrollDate;
	private String qnaImage;
	private String filePath;

}
