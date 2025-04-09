package project.dto;

import lombok.Data;

//완제품 테이블
@Data
public class Products_DTO {
	private int productid;
	private String productname;
	private String partnumber;
	private String expdatedesc; //?��?��기한
	private String warehouse;
	private String productimage; //?��미�?링크
	private String normalcriteria; // ?��?��?��?��기�?
	private String abnormalcriteria; //비정?��?��?��기�?
	private int price;
	private String spec;
	private String unit;
	private String productdel; //?��?��?���?
	private String lotnumber;
	
	
	
}
