package com.pj.pet.pay;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class PayVO {
	private Long payNum;
	private String id;
	private Date payDate;
	private Long totalPrice;
	private Long totalCount;
	@NotNull(message = "필수 항목 입니다")
	private String arrive;
	@NotNull(message = "필수 항목 입니다")
	private String recipient;
	@NotNull(message = "필수 항목 입니다")
	private String recipientPhone;
}
