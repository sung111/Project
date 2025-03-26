package project.dto;
import dao.*;
//?Éù?Ç∞Í≥µÏ†ï?Ñ§Î™? ?Öå?ù¥Î∏?
public class ProductionProcessDescription_DTO {
	int processid ;
	int productid ;
	String processstage ;
	String description ;
	String equipment ;
	String hygiene;
	
	@Override
	public String toString() {
		return "ProductionProcessDescription_DTO [processid=" + processid + ", productid=" + productid
				+ ", processstage=" + processstage + ", description=" + description + ", equipment=" + equipment
				+ ", hygiene=" + hygiene + "]";
	}
	public int getProcessid() {
		return processid;
	}
	public void setProcessid(int processid) {
		this.processid = processid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProcessstage() {
		return processstage;
	}
	public void setProcessstage(String processstage) {
		this.processstage = processstage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getHygiene() {
		return hygiene;
	}
	public void setHygiene(String hygiene) {
		this.hygiene = hygiene;
	}
	
	
	
}
