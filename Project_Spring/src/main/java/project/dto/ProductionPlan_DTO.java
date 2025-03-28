package project.dto;

import java.sql.Date;

//?ƒ?‚°ê³„íš ?…Œ?´ë¸?
public class ProductionPlan_DTO {

	int planId; // ?”Œ?œ ID
	String userId; // ?‘?„±? ID
	int productId; // ?ƒ?’ˆë²ˆí˜¸
	int totalqty; // ?ƒ?‚°?ˆ˜?Ÿ‰
	Date startDate; // ?‹œ?‘?¼
	Date endDate; // ì¢…ë£Œ?¼
	Date createDate; // ?ƒ?„±?¼
	Date deliveryDate; // ?‚©?’ˆê¸°ê°„
	String deliveryDest; // ?‚©?’ˆ?—…ì²?
	String planStatus; // ì§„í–‰?ƒ?™©
	String planCause; // ì§„í–‰?‚¬?œ 
	String planNotes; // ë¹„ê³ 

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

//	productsê°?? ¸?˜´.

	private Products_DTO product;

	public Products_DTO getProduct() {
		return product;
	}

	public void setProduct(Products_DTO product) {
		this.product = product;
	}

}
