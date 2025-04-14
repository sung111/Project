package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class InvenCheck_DTO {
	
//	재고현황
	private int inventoryid;
	private int materialId;
	private Date receiptDate;
	private Date expDate;
	private int quantity;

//	완제품
	private int productinvenid;
	private int productid;
	private Date makeDate;

//	컬럼명 같은거 주석처리함
//	private Date expDate1;
//	private int quantity1;
	
//	페이지네이션
	private int Page = 1; //첫페이지
	private int viewCount = 10; //10개씩보여줌
	private int indexStart;
	private int indexEnd;
	private int totalCount;
	
//	db 조회하기 위한 필드
	private int rnum;
	private String lotnumber;
	private String productname;
	private String partnumber;
	private int spec;
	private String unit;
	
//  검색 필드
	private String searchName;
	private String searchType;
	private String searchWay;
	private String search;
	private Date dateStart;
	private Date dateEnd;
	
	
	
	
	
	

}
