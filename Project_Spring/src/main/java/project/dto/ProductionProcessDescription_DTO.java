package project.dto;
import lombok.Data;



//생산공정설명 테이블
@Data
public class ProductionProcessDescription_DTO {
	private int processid  ;
	private int productid = 1;
	private String processstage ;
	private String description ;
	private String equipment ;
	private String hygiene;
	private String processdescriptionsdel;
	
	
	
	
}
