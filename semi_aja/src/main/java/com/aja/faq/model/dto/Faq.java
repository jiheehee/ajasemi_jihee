package com.aja.faq.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Faq {

	private String faqTitle;
	private String faqCategory;
	private String faqContent;	
	
}
