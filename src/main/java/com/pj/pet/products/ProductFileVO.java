package com.pj.pet.products;


import com.pj.pet.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProductFileVO extends FileVO {
	
	private Long productNum;

}