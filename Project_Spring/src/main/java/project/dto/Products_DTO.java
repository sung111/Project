package project.dto;

import lombok.Data;

// 검사기준,부품코드
//완제품 테이블
@Data
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
	
	

	
}
