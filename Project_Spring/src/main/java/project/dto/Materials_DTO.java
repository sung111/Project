package project.dto;

import lombok.Data;

//자재 테이블
@Data
public class Materials_DTO {
	
	private String materialname;
	private String productname;
	private int price;
	private String spec;
	private String unit;
	private String supplier;
	private String partNumber;
	private String lotnumber;
	private String warehouse;
	private String origin;
	private String bomdel;
	private int bomid;

	private int materiaid;
	private String materiadel;
	private String type; //?��?��?��, ?��?��?�� ???�� 구분 p?��?��?��, m?��?��?��
	private int stockquantity;
	private int product_material_id;
	private double bom_quan; //bom ?��?��계수
	private int bom_ma_id; //bom 메터리얼?��?��?��
	private int bom_pr_id; //bom ?��로덕?�� ?��?��?��
	private int inven_ma_id; // ?��벤토�? 메터리얼?��?��?��
	private int inven_quan;  // ?��?? ?��?��?�� ?��?��
	
	
	

	
}
