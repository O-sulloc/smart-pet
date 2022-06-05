package com.pj.pet.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pj.pet.carts.CartVO;
import com.pj.pet.pay.PayVO;
import com.pj.pet.products.ProductMapper;
import com.pj.pet.products.ProductVO;

@Service
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProductMapper productMapper;

	public int setAdd(OrderVO orderVO) throws Exception {
		return orderMapper.setAdd(orderVO);
	}

	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		return orderMapper.orderList(orderVO);
	}

	public int getOrderName(OrderVO orderVO) throws Exception {
		return orderMapper.getOrderName(orderVO);
	}

	public List<CartVO> orderDetailList(PayVO payVO) throws Exception {
		return orderMapper.orderDetailList(payVO);
	}

	public List<OrderVO> sellerOrder() throws Exception {
		return orderMapper.sellerOrder();
	}

	public int shipUpdate(OrderVO orderVO) throws Exception {
		int result = orderMapper.shipUpdate(orderVO);
		// 배송 후 상품재고 감소
		List<ProductVO> pr = orderMapper.getOrderCart(orderVO);
		for (ProductVO productVO : pr) {
			Long cartNum = productVO.getCartVO().getCartNum();
			result = productMapper.countMinus(cartNum);
		}
		return result;
	}

	public int refund(OrderVO orderVO) throws Exception {
		int result = orderMapper.refund(orderVO);
		// 환불 후 상품재고 증가
		List<ProductVO> pr = orderMapper.getOrderCart(orderVO);
		for (ProductVO productVO : pr) {
			Long cartNum = productVO.getCartVO().getCartNum();
			result = productMapper.countPlus(cartNum);
			//환불 후 상품 판매량 감소
			result = productMapper.saleMinus(cartNum);
		}

		return result;
	}

}