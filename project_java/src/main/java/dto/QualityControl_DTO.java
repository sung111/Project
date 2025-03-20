package dto;

import java.sql.Date;
import java.sql.Timestamp;

//품질관리 테이블
public class QualityControl_DTO {
	
	int qualityControlId;	// 품질관리 시퀀스번호
	int performanceId;		// 실적 시퀀스번호
	String userId;			// 유저 id
	String userName;

	int productId;		// 완제품 시퀀스
	String productNameST;		// 완제품명
	String result;			// 합/불
	String failreason;		// 불합격사유
	String comments;		// 코멘트
	Timestamp reportTime;		// 실적등록 시간
	Timestamp reportTime2;		// 조회때 사용
	Date dateReportTime;	// date타입 조회 박스때 사용

	int passpack;			//합격갯수
	int failPack;			// 불합갯수
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getQualityControlId() {
		return qualityControlId;
	}
	public void setQualityControlId(int qualityControlId) {
		this.qualityControlId = qualityControlId;
	}
	public int getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(int performanceId) {
		this.performanceId = performanceId;
	}
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
	public String getProductNameST() {
		return productNameST;
	}
	public void setProductNameST(String productNameST) {
		this.productNameST = productNameST;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getFailreason() {
		return failreason;
	}
	public void setFailreason(String failreason) {
		this.failreason = failreason;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Timestamp getReportTime() {
		return reportTime;
	}
	public void setReportTime(Timestamp reportTime) {
		this.reportTime = reportTime;
	}
	public Timestamp getReportTime2() {
		return reportTime2;
	}
	public void setReportTime2(Timestamp reportTime2) {
		this.reportTime2 = reportTime2;
	}
	public Date getDateReportTime() {
		return dateReportTime;
	}
	public void setDateReportTime(Date dateReportTime) {
		this.dateReportTime = dateReportTime;
	}
	public int getPasspack() {
		return passpack;
	}
	public void setPasspack(int passpack) {
		this.passpack = passpack;
	}
	public int getFailPack() {
		return failPack;
	}
	public void setFailPack(int failPack) {
		this.failPack = failPack;
	}
	
	
	
	
	
	

}
