package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class InventorycheckDTO {
	
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

}
