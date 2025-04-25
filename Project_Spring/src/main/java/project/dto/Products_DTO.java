package project.dto;

import java.util.List;

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
	
	String serch;
	private List empnos;
	private int page = 1; // 현재 페이지
	private int viewCount =10; // 페이지당 보여줄 수 countPerPage / rowPerPage 1개식 
	private int FinishViewCount =2; // 2개식 보여줄떄 사용 
	private int fourViewCount =4; // 2개식 보여줄떄 사용 
	private int indexStart;
	private int indexEnd;
	
    public int getProductId() {
        return productid;
    }
    public void setProductId(int productId) {
        this.productid = productId;
    }
    public int getProductid() {
        return productid;
    }
    public void setProductid(int productId) {
        this.productid = productId;
    }
}
