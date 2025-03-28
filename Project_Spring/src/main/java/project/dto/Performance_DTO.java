package project.dto;

import java.sql.Timestamp;

//?ã§?†Å?Öå?ù¥Î∏?
public class Performance_DTO {

	int PerformanceId;			// ?ã§?†Å ?ãú???ä§ Î≤àÌò∏
	int ProductId;				// ?ôÑ?†ú?íà ?ãú???ä§
	String ProductName;			// ?ôÑ?†ú?íàÎ™?
	int PlanId;					// ?Éù?Ç∞Í≥ÑÌöç ?ãú???ä§Î≤àÌò∏
	String UserId;				// ?ú†?? id
	String userName;
	Timestamp ReportTime;		// ?ã§?†Å?ì±Î°? ?ãúÍ∞?
	Timestamp ReportTime2;		// Ï°∞Ìöå?ïå ?Ç¨?ö©
	String PerformanceComment;	// ÏΩîÎ©ò?ä∏
	int ProductionCount;		// ?Éù?Ç∞?àò?üâ
	
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
