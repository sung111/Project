package project.dto;

public class MRPcalculation_DTO {
	int productId; // ?™„? œ?’ˆ ?‹œ???Š¤ ê°?
	String safeTyunit; //?•ˆ? „?¬ê³? ?‹¨?œ„
	String minInrementUnit; // ìµœì†Œì¦ê??‹¨?œ„
	String leadTime; //ì¡°ë‹¬ê¸°ê°„
	int inComingInv; //? „?…?¬ê³?
	
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
