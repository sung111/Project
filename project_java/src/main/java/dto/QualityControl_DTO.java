package dto;
//품질관리 테이블
public class QualityControl_DTO {
	
	int qualityControlId;	// 품질관리 시퀀스번호
	int performanceId;		// 실적 시퀀스번호
	String userId;			// 유저 id
	String productName;		// 완제품명
	String result;			// 합/불
	String failreason;		// 불합격사유
	String comments;		// 코멘트
	
	
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	
	
	

}
