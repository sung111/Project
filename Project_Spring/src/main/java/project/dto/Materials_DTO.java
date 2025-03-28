package project.dto;



//??¬ ?…Œ?´ë¸?
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
	String bomdel;
	int bomid;

	int materiaid;
	String materiadel;
	String type; //?›??¬, ?™„? œ?’ˆ ???… êµ¬ë¶„ p?›?? œ, m?™„? œ?’ˆ
	int stockquantity;
	int product_material_id;
	double bom_quan; //bom ?ˆ¬?…ê³„ìˆ˜
	int bom_ma_id; //bom ë©”í„°ë¦¬ì–¼?•„?´?””
	int bom_pr_id; //bom ?”„ë¡œë•?Š¸ ?•„?´?””
	int inven_ma_id; // ?¸ë²¤í† ë¦? ë©”í„°ë¦¬ì–¼?•„?´?””
	int inven_quan;  // ?‚¨?? ?›??¬ ?ˆ˜?Ÿ‰
	
	
	public int getBomid() {
		return bomid;
	}
	public void setBomid(int bomid) {
		this.bomid = bomid;
	}
	public String getBomdel() {
		return bomdel;
	}
	public void setBomdel(String bomdel) {
		this.bomdel = bomdel;
	}
	public double getBom_quan() {
		return bom_quan;
	}
	public void setBom_quan(double bom_quan) {
		this.bom_quan = bom_quan;
	}
	public int getBom_ma_id() {
		return bom_ma_id;
	}
	public void setBom_ma_id(int bom_ma_id) {
		this.bom_ma_id = bom_ma_id;
	}
	public int getBom_pr_id() {
		return bom_pr_id;
	}
	public void setBom_pr_id(int bom_pr_id) {
		this.bom_pr_id = bom_pr_id;
	}
	public int getInven_ma_id() {
		return inven_ma_id;
	}
	public void setInven_ma_id(int inven_ma_id) {
		this.inven_ma_id = inven_ma_id;
	}
	
	public int getInven_quan() {
		return inven_quan;
	}
	public void setInven_quan(int inven_quan) {
		this.inven_quan = inven_quan;
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
