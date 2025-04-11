package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class InvenCheck_DTO {
	
	private int inventoryId;
	private int materialId;
	private Date receiptDate;
	private Date expDate;
	private int quantity;

	private int productinvenid;
	private int productid;
	private Date makeDate;
	private Date expDate1;
	private int quantity1;
	
	private int Page = 1; //첫페이지
	private int viewCount = 10; //10개씩보여줌
	private int indexStart;
	private int indexEnd;
	
	

}
