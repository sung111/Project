package project.dto;

import java.util.List;

import lombok.Data;

//자재 테이블 원자제bom
@Data
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
	String type; //원자재, 완제품 타입 구분 p원자제, m완제품
	int stockquantity;
	int product_material_id;
	double bom_quan; //bom 투입계수
	int bom_ma_id; //bom 메터리얼아이디
	int bom_pr_id; //bom 프로덕트 아이디
	int inven_ma_id; // 인벤토리 메터리얼아이디
	int inven_quan;  // 남은 원자재 수량
	
	private List empnos;
	private int page = 1; // 현재 페이지
	private int viewCount =10; // 페이지당 보여줄 수 countPerPage / rowPerPage
	private int indexStart;
	private int indexEnd;
	

	

	
}
