package project.dto;

import java.sql.Date;

public class Inventorycheck_DTO {
	
	// ??¬ ?¬κ³? ??© μ‘°ν
	int inventoryId;	// ?¬κ³ μ???€λ²νΈ
	Date receiptDate;	// ?κ³ μΌ
	Date maExpDate;		// ? ?¨κΈ°κ°
	int materialId;		// ??¬ ????€κ°?
	int maQuantity;		// ?¬κ³ μ?
	String maLotNo;		// lot No
	String maPartNum;	// ?λ²?
	String maUnit;		// ?¨?
	String materialname; // ?λͺ?
	String maSpec;		// κ·κ²©
	
	

	// ?? ? ?¬κ³? ??© μ‘°ν
	int productinvenId;	// ?? ? ?¬κ³? ????€
	int productId;		// ?? ? ????€κ°?
	Date makeDate;		// ??°?Ό
	Date prExpDate;		// ? ?¨κΈ°κ°
	int prQuantity;		// ?¬κ³ μ?
	String prLotNo;		// lot No
	String prPartNum;	// ?λ²?
	String prUnit;		// ?¨?
	String productname; // ?λͺ?
	String prSpec; 		// κ·κ²©
	
	
	public String getMaSpec() {
		return maSpec;
	}
	public void setMaSpec(String maSpec) {
		this.maSpec = maSpec;
	}
	public String getPrSpec() {
		return prSpec;
	}
	public void setPrSpec(String prSpec) {
		this.prSpec = prSpec;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}
	public Date getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}
	public Date getMaExpDate() {
		return maExpDate;
	}
	public void setMaExpDate(Date maExpDate) {
		this.maExpDate = maExpDate;
	}
	public int getMaterialId() {
		return materialId;
	}
	public void setMaterialId(int materialId) {
		this.materialId = materialId;
	}
	public int getMaQuantity() {
		return maQuantity;
	}
	public void setMaQuantity(int maQuantity) {
		this.maQuantity = maQuantity;
	}
	public String getMaLotNo() {
		return maLotNo;
	}
	public void setMaLotNo(String maLotNo) {
		this.maLotNo = maLotNo;
	}
	public String getMaPartNum() {
		return maPartNum;
	}
	public void setMaPartNum(String maPartNum) {
		this.maPartNum = maPartNum;
	}
	public String getMaUnit() {
		return maUnit;
	}
	public void setMaUnit(String maUnit) {
		this.maUnit = maUnit;
	}
	public String getMaterialname() {
		return materialname;
	}
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	
	
	
	
	public int getProductinvenId() {
		return productinvenId;
	}
	public void setProductinvenId(int productinvenId) {
		this.productinvenId = productinvenId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public Date getMakeDate() {
		return makeDate;
	}
	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}
	public Date getPrExpDate() {
		return prExpDate;
	}
	public void setPrExpDate(Date prExpDate) {
		this.prExpDate = prExpDate;
	}
	public int getPrQuantity() {
		return prQuantity;
	}
	public void setPrQuantity(int prQuantity) {
		this.prQuantity = prQuantity;
	}
	public String getPrLotNo() {
		return prLotNo;
	}
	public void setPrLotNo(String prLotNo) {
		this.prLotNo = prLotNo;
	}
	public String getPrPartNum() {
		return prPartNum;
	}
	public void setPrPartNum(String prPartNum) {
		this.prPartNum = prPartNum;
	}
	public String getPrUnit() {
		return prUnit;
	}
	public void setPrUnit(String prUnit) {
		this.prUnit = prUnit;
	}
	
	
	
	
	
	
}
