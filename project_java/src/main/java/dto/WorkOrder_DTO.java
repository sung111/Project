package dto;

import java.sql.Date;

//작업지시서 테이블
public class WorkOrder_DTO {

	int OrderId; // 작업지시서 번호
	Date OrderDate; // 작업지시서 생성일
	int ProductId; // 작업지시용 상품번호
	
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public Date getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(Date orderDate) {
		OrderDate = orderDate;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}

//	상품목록을 가져옴.
	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}
	
//	제조과정을 가져옴.
	private MFGprocess_DTO MFGprocess;

	public MFGprocess_DTO getMFGprocess() {
		return MFGprocess;
	}

	public void setMFGprocess(MFGprocess_DTO MFGprocess) {
		this.MFGprocess = MFGprocess;
	}
	
}
