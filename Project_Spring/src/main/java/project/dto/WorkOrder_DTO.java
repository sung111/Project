package project.dto;

import java.sql.Date;

//?��?���??��?�� ?��?���?
public class WorkOrder_DTO {

	int OrderId; // ?��?���??��?�� 번호
	Date OrderDate; // ?��?���??��?�� ?��?��?��
	int ProductId; // ?��?���??��?�� ?��?��번호
	
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

//	?��?��목록?�� �??��?��.
	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}
	
//	?��조과?��?�� �??��?��.
	private MFGprocess_DTO MFGprocess;

	public MFGprocess_DTO getMFGprocess() {
		return MFGprocess;
	}

	public void setMFGprocess(MFGprocess_DTO MFGprocess) {
		this.MFGprocess = MFGprocess;
	}
	
}
