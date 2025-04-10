package project.dto;
//완제품 테이블
public class Products_DTO {
	int productid;
	String productname;
	String partnumber;
	String expdatedesc; //유통기한
	String warehouse;
	String productimage; //이미지링크
	String normalcriteria; // 정상제품기준
	String abnormalcriteria; //비정상제품기준
	int price;
	String spec;
	String unit;
	String productdel; //삭제유무
	String lotnumber;
	
	public String getExpdatedesc() {
		return expdatedesc;
	}
	public void setExpdatedesc(String expdatedesc) {
		this.expdatedesc = expdatedesc;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getNormalcriteria() {
		return normalcriteria;
	}
	public void setNormalcriteria(String normalcriteria) {
		this.normalcriteria = normalcriteria;
	}
	public String getAbnormalcriteria() {
		return abnormalcriteria;
	}
	public void setAbnormalcriteria(String abnormalcriteria) {
		this.abnormalcriteria = abnormalcriteria;
	}
	public String getProductdel() {
		return productdel;
	}
	public void setProductdel(String productdel) {
		this.productdel = productdel;
	}

	String originname;
	
	public	int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getOriginname() {
		return originname;
	}
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPartnumber() {
		return partnumber;
	}
	public void setPartnumber(String partnumber) {
		this.partnumber = partnumber;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
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
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
	}
	
	@Override
	public String toString() {
		return "Products_DTO [productname=" + productname + ", partnumber=" + partnumber + ", warehouse=" + warehouse
				+ ", price=" + price + ", spec=" + spec + ", unit=" + unit + ", lotnumber=" + lotnumber + "]";
	}

	
}
