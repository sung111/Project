package dto;

import java.sql.Date;

//생산계획 테이블
public class ProductionPlan_DTO {

	int planId; // 플랜 ID
	String userId; // 작성자 ID
	int productId; // 상품번호
	int totalqty; // 생산수량
	Date startDate; // 시작일
	Date endDate; // 종료일
	Date createDate; // 생성일
	Date deliveryDate; // 납품기간
	String deliveryDest; // 납품업체
	String planStatus; // 진행상황
	String planCause; // 진행사유
	String planNotes; // 비고

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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

//	products가져옴.
	/*
	 * private Products_DTO product;
	 * 
	 * public Products_DTO getProduct() { return product; }
	 * 
	 * public void setProduct(Products_DTO product) { this.product = product; }
	 */

}
