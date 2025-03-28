package project.dto;

import java.sql.Date;

//?‘?—…ì§??‹œ?„œ ?…Œ?´ë¸?
public class WorkOrder_DTO {

	int OrderId; // ?‘?—…ì§??‹œ?„œ ë²ˆí˜¸
	Date OrderDate; // ?‘?—…ì§??‹œ?„œ ?ƒ?„±?¼
	int ProductId; // ?‘?—…ì§??‹œ?š© ?ƒ?’ˆë²ˆí˜¸
	
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

//	?ƒ?’ˆëª©ë¡?„ ê°?? ¸?˜´.
	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}
	
//	? œì¡°ê³¼? •?„ ê°?? ¸?˜´.
	private MFGprocess_DTO MFGprocess;

	public MFGprocess_DTO getMFGprocess() {
		return MFGprocess;
	}

	public void setMFGprocess(MFGprocess_DTO MFGprocess) {
		this.MFGprocess = MFGprocess;
	}
	
}
