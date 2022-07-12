package com.kh.mars.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@NoArgsConstructor@Builder
public class PaymentDetailDto {

	private int memberNo;
	private int paymentDetailNo;
	private int paymentNo;
	private String paymentDetailName;
	private int paymentDetailPrice;
	private String paymentStatus;
}
