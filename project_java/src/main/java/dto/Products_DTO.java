package dto;
//완제품 테이블
public class Products_DTO {
	String productname;
	String partnumber;
	String warehouse;
	int price;
	String spec;
	String unit;
	String lotnumber;
	String originname;
	
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
