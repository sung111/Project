package project.dto;

import java.sql.Date;
import lombok.Data;

//작업지시서 테이블
@Data
public class WorkOrder_DTO {

    private int orderId; 
    private Date orderDate; 
    private int productId; 
    
    private Products_DTO product; 
    private MFGprocess_DTO mfgProcess; 
}
