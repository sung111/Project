package project.dto;

import java.sql.Date;

public class Inventorycheck_DTO {
	
	// ?��?�� ?���? ?��?�� 조회
	int inventoryId;	// ?��고시???��번호
	Date receiptDate;	// ?��고일
	Date maExpDate;		// ?��?��기간
	int materialId;		// ?��?�� ?��???���?
	int maQuantity;		// ?��고수?��
	String maLotNo;		// lot No
	String maPartNum;	// ?���?
	String maUnit;		// ?��?��
	String materialname; // ?���?
	String maSpec;		// 규격
	
	

	// ?��?��?�� ?���? ?��?�� 조회
	int productinvenId;	// ?��?��?�� ?���? ?��???��
	int productId;		// ?��?��?�� ?��???���?
	Date makeDate;		// ?��?��?��
	Date prExpDate;		// ?��?��기간
	int prQuantity;		// ?��고수?��
	String prLotNo;		// lot No
	String prPartNum;	// ?���?
	String prUnit;		// ?��?��
	String productname; // ?���?
	String prSpec; 		// 규격
	
	
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
