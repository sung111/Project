package dto;

import java.sql.Date;
import java.sql.Timestamp;

//실적테이블
public class Performance_DTO {

	int PerformanceId;
	String ProductName;
	int PlanId;
	int UserId;
	Timestamp ReportTime1;
	Date ReportTime;
	
	String PerformanceComment;
	int ProductionCount;

	public int getPerformanceId() {
		return PerformanceId;
	}

	public void setPerformanceId(int performanceId) {
		PerformanceId = performanceId;
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

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		this.UserId = userId;
	}

	public Timestamp getReportTime() {
		return ReportTime;
	}

	public void setReportTime(Timestamp reportTime) {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getReportTime() {
		return ReportTime;
	}

	public void setReportTime(Date reportTime) {
		ReportTime = reportTime;
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
