package project.dto;

import java.sql.Date;

//??°κ³ν ??΄λΈ?
public class ProductionPlan_DTO {

	int planId; // ?? ID
	String userId; // ??±? ID
	int productId; // ??λ²νΈ
	int totalqty; // ??°??
	Date startDate; // ???Ό
	Date endDate; // μ’λ£?Ό
	Date createDate; // ??±?Ό
	Date deliveryDate; // ?©?κΈ°κ°
	String deliveryDest; // ?©??μ²?
	String planStatus; // μ§ν??©
	String planCause; // μ§ν?¬? 
	String planNotes; // λΉκ³ 

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getTotalqty() {
		return totalqty;
	}

	public void setTotalqty(int totalqty) {
		this.totalqty = totalqty;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getDeliveryDest() {
		return deliveryDest;
	}

	public void setDeliveryDest(String deliveryDest) {
		this.deliveryDest = deliveryDest;
	}

	public String getPlanStatus() {
		return planStatus;
	}

	public void setPlanStatus(String planStatus) {
		this.planStatus = planStatus;
	}

	public String getPlanCause() {
		return planCause;
	}

	public void setPlanCause(String planCause) {
		this.planCause = planCause;
	}

	public String getPlanNotes() {
		return planNotes;
	}

	public void setPlanNotes(String planNotes) {
		this.planNotes = planNotes;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

//	productsκ°?? Έ?΄.

	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}

}
