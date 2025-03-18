package dto;

import java.sql.Date;

public class Inventorycheck_DTO {
	
	// 자재 재고 현황 조회
	int inventoryId;	// 재고시퀀스번호
	Date receiptDate;	// 입고일
	Date maExpDate;		// 유효기간
	int materialId;		// 자재 시퀀스값
	int maQuantity;		// 재고수량
	String maLotNo;		// lot No
	String maPartNum;	// 품번
	String maUnit;		// 단위
	String materialname; // 품목
	
	
	// 완제품 재고 현황 조회
	int productinvenId;	// 완제품 재고 시퀀스
	int productId;		// 완제품 시퀀스값
	Date makeDate;		// 생산일
	Date prExpDate;		// 유효기간
	int prQuantity;		// 재고수량
	String prLotNo;		// lot No
	String prPartNum;	// 품번
	String prUnit;		// 단위
	
	
	
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
