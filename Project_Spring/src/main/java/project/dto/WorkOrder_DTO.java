package project.dto;

import java.sql.Date;

//??μ§??? ??΄λΈ?
public class WorkOrder_DTO {

	int OrderId; // ??μ§??? λ²νΈ
	Date OrderDate; // ??μ§??? ??±?Ό
	int ProductId; // ??μ§???© ??λ²νΈ
	
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

//	??λͺ©λ‘? κ°?? Έ?΄.
	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}
	
//	? μ‘°κ³Ό? ? κ°?? Έ?΄.
	private MFGprocess_DTO MFGprocess;

	public MFGprocess_DTO getMFGprocess() {
		return MFGprocess;
	}

	public void setMFGprocess(MFGprocess_DTO MFGprocess) {
		this.MFGprocess = MFGprocess;
	}
	
}
