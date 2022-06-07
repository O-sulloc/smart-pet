package com.pj.pet.pay;

import java.sql.Date;

import lombok.Data;

@Data
public class PayVO {
	private Long payNum;
	private String id;
	private Date payDate;
	private Long totalPrice;
	private Long totalCount;
	private String arrive;
	private String recipient;
	private String recipientPhone;
}
