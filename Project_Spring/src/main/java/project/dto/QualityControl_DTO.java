package project.dto;

import java.sql.Date;
import java.sql.Timestamp;

//?μ§κ?λ¦? ??΄λΈ?
public class QualityControl_DTO {
	
	int qualityControlId;	// ?μ§κ?λ¦? ????€λ²νΈ
	int performanceId;		// ?€?  ????€λ²νΈ
	String userId;			// ? ?? id
	String userName;

	int productId;		// ?? ? ????€
	String productNameST;		// ?? ?λͺ?
	String result;			// ?©/λΆ?
	String failreason;		// λΆν©κ²©μ¬? 
	String comments;		// μ½λ©?Έ
	Timestamp reportTime;		// ?€? ?±λ‘? ?κ°?
	Timestamp reportTime2;		// μ‘°ν? ?¬?©
	Date dateReportTime;	// date??? μ‘°ν λ°μ€? ?¬?©

	int passpack;			//?©κ²©κ°―?
	int failPack;			// λΆν©κ°??
	
	
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
