package dto;



//자재 테이블
public class Materials_DTO {
	
	String materialname;
	int price;
	String spec;
	String unit;
	String supplier;
	String partNumber;
	String lotnumber;
	String warehouse;
	String origin;
	String materiaid;
	String materiadel;
	String type; //원자재, 완제품 타입 구분 p원자제, m완제품

	
	

	public String getMateriadel() {
		return materiadel;
	}
	public void setMateriadel(String materiadel) {
		this.materiadel = materiadel;
	}

	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMateriaid() {
		return materiaid;
	}
	public void setMateriaid(String materiaid) {
		this.materiaid = materiaid;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getMaterialname() {
		return materialname;
	}
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber;
	}
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	
	@Override
	public String toString() {
		return "Materials_DTO [materialname=" + materialname + ", price=" + price + ", spec=" + spec + ", unit=" + unit
				+ ", supplier=" + supplier + ", partNumber=" + partNumber + ", Lotnumber=" + lotnumber + ", warehouse="
				+ warehouse + "]";
	}
	

	
}
