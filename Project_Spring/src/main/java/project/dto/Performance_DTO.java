package project.dto;

import java.sql.Timestamp;

//?€? ??΄λΈ?
public class Performance_DTO {

	int PerformanceId;			// ?€?  ????€ λ²νΈ
	int ProductId;				// ?? ? ????€
	String ProductName;			// ?? ?λͺ?
	int PlanId;					// ??°κ³ν ????€λ²νΈ
	String UserId;				// ? ?? id
	String userName;
	Timestamp ReportTime;		// ?€? ?±λ‘? ?κ°?
	Timestamp ReportTime2;		// μ‘°ν? ?¬?©
	String PerformanceComment;	// μ½λ©?Έ
	int ProductionCount;		// ??°??
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPerformanceId() {
		return PerformanceId;
	}
	public void setPerformanceId(int performanceId) {
		PerformanceId = performanceId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
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
	public Timestamp getReportTime() {
		return ReportTime;
	}
	public void setReportTime(Timestamp reportTime) {
		ReportTime = reportTime;
	}
	public Timestamp getReportTime2() {
		return ReportTime2;
	}
	public void setReportTime2(Timestamp reportTime2) {
		ReportTime2 = reportTime2;
	}
	public String getPerformanceComment() {
		return PerformanceComment;
	}
	public void setPerformanceComment(String performanceComment) {
		PerformanceComment = performanceComment;
	}
	public int getProductionCount() {
		return ProductionCount;
	}
	public void setProductionCount(int productionCount) {
		ProductionCount = productionCount;
	}
	
	
	

	

}
