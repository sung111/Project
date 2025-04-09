package project.dto;

import lombok.Data;

// 생산 공정 설명 테이블
@Data
public class ProductionProcessDescription_DTO {
    int processid;
    int productid;
    String processstage;
    String description;
    String equipment;
    String hygiene;

   
}
