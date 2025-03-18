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
	int materiaid;
	String materiadel;
	String type; //원자재, 완제품 타입 구분 p원자제, m완제품
	int stockquantity;
	int product_material_id;
	double quantity;
	
	
	
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public int getStockquantity() {
		return stockquantity;
	}
	public void setStockquantity(int stockquantity) {
		this.stockquantity = stockquantity;
	}
	public int getProduct_material_id() {
		return product_material_id;
	}
	public void setProduct_material_id(int product_material_id) {
		this.product_material_id = product_material_id;
	}

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
	public int getMateriaid() {
		return materiaid;
	}
	public void setMateriaid(int materiaid) {
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
