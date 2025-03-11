package dto;

import java.sql.Date;

//작업지시서 테이블
public class WorkOrder_DTO {
	
	int PlanId;			// 생산계획 시퀀스번호.
	String UserId;		// 유저 id
	String ProductName;	// 완제품명
	int TotalQTY;		// 총 제작수량
	Date StartDate;		// 생산시작일
	Date EndDate;		// 생산종료일
	Date CreateDate;	// 작성일자
	Date DeliveryDate;	// 납품기간
	String DELIVERYDEST;// 납품처
	String PLANSTATUS;	// 생산계획현황
	String PLANCAUSE;	// 생산사유
	String PLANNOTES;	// 비고
	
	
	public int getPlanId() {
		return PlanId;
	}
	public void setPlanId(int planId) {
		PlanId = planId;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getTotalQTY() {
		return TotalQTY;
	}
	public void setTotalQTY(int totalQTY) {
		TotalQTY = totalQTY;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Date getEndDate() {
		return EndDate;
	}
	public void setEndDate(Date endDate) {
		EndDate = endDate;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public Date getDeliveryDate() {
		return DeliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		DeliveryDate = deliveryDate;
	}
	public String getDELIVERYDEST() {
		return DELIVERYDEST;
	}
	public void setDELIVERYDEST(String dELIVERYDEST) {
		DELIVERYDEST = dELIVERYDEST;
	}
	public String getPLANSTATUS() {
		return PLANSTATUS;
	}
	public void setPLANSTATUS(String pLANSTATUS) {
		PLANSTATUS = pLANSTATUS;
	}
	public String getPLANCAUSE() {
		return PLANCAUSE;
	}
	public void setPLANCAUSE(String pLANCAUSE) {
		PLANCAUSE = pLANCAUSE;
	}
	public String getPLANNOTES() {
		return PLANNOTES;
	}
	public void setPLANNOTES(String pLANNOTES) {
		PLANNOTES = pLANNOTES;
	}
	
	
	
	
	
}
