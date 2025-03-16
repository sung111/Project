package dto;

import java.sql.Timestamp;

//실적테이블
public class Performance_DTO {

	int PerformanceId;			// 실적 시퀀스 번호
	int ProductName;			// 완제품명
	String ProductNameST;			// 완제품명
	int PlanId;					// 생산계획 시퀀스번호
	String UserId;				// 유저 id
	Timestamp ReportTime;		// 실적등록 시간
	Timestamp ReportTime2;		// 조회때 사용
	String PerformanceComment;	// 코멘트
	int ProductionCount;		// 생산수량
	
	public int getPerformanceId() {
		return PerformanceId;
	}
	public void setPerformanceId(int performanceId) {
		PerformanceId = performanceId;
	}
	public int getProductName() {
		return ProductName;
	}
	public void setProductName(int productName) {
		ProductName = productName;
	}
	public String getProductNameST() {
		return ProductNameST;
	}
	public void setProductNameST(String productNameST) {
		ProductNameST = productNameST;
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
