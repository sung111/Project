package project.dto;
//?? ? ??΄λΈ?
public class Products_DTO {
	int productid;
	String productname;
	String partnumber;
	String expdatedesc; //? ?΅κΈ°ν
	String warehouse;
	String productimage; //?΄λ―Έμ?λ§ν¬
	String normalcriteria; // ? ?? ?κΈ°μ?
	String abnormalcriteria; //λΉμ ?? ?κΈ°μ?
	int price;
	String spec;
	String unit;
	String productdel; //?­? ? λ¬?
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
