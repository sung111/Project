package dto;
//품질관리 테이블
public class QualityControl_DTO {
	
	int QualityControlId;
	int PerformanceId;
	String UserId;
	String ProductName;
	String Result;
	
	
	public int getQualityControlId() {
		return QualityControlId;
	}
	public void setQualityControlId(int qualityControlId) {
		QualityControlId = qualityControlId;
	}
	public int getPerformanceId() {
		return PerformanceId;
	}
	public void setPerformanceId(int performanceId) {
		PerformanceId = performanceId;
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
	public String getResult() {
		return Result;
	}
	public void setResult(String result) {
		Result = result;
	}
	public String getFailreason() {
		return Failreason;
	}
	public void setFailreason(String failreason) {
		Failreason = failreason;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	String Failreason;
	String Comments;
	

}
