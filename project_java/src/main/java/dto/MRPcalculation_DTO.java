package dto;

public class MRPcalculation_DTO {
	int productId; // 완제품 시퀀스 값
	String safeTyunit; //안전재고 단위
	String minInrementUnit; // 최소증가단위
	String leadTime; //조달기간
	int inComingInv; //전입재고
	
	public int getproductId() {
		return productId;
	}
	public void setproductId(int productId) {
		this.productId = productId;
	}
	
	public String getsafeTyunit() {
		return safeTyunit;
	}
	public void setsafeTyunit(String safeTyunit) {
		this.safeTyunit = safeTyunit;
	}
	
	public String getminInrementUnit() {
		return minInrementUnit;
	}
	public void setminInrementUnit(String minInrementUnit) {
		this.minInrementUnit = minInrementUnit;
	}
	
	public String getleadTime() {
		return leadTime;
	}
	public void setleadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	
	public int getinComingInv() {
		return inComingInv;
	}
	public void setinComingInv(int inComingInv) {
		this.inComingInv = inComingInv;
	}
}
