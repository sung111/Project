package project.dto;

public class MRPcalculation_DTO {
	int productId; // ?? ? ????€ κ°?
	String safeTyunit; //?? ?¬κ³? ?¨?
	String minInrementUnit; // μ΅μμ¦κ??¨?
	String leadTime; //μ‘°λ¬κΈ°κ°
	int inComingInv; //? ??¬κ³?
	
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
