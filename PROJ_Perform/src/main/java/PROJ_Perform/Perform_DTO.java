package PROJ_Perform;

import java.sql.Date;


public class Perform_DTO {

	
	String Product_name;
	Date report_time;
	int production_count;
	
	
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public int getProduction_count() {
		return production_count;
	}
	public void setProduction_count(int production_count) {
		this.production_count = production_count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
