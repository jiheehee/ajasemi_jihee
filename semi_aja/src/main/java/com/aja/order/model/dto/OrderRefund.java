package com.aja.order.model.dto;

import javax.annotation.processing.SupportedAnnotationTypes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderRefund {
	int dcKey;
	int custKey;
	int orderPoint;
	int osKey;
	
}
