package project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductionPlan_DTO {

    private int planId;          // 플랜 ID
    private String userId;       // 작성자 ID
    private int productId;       // 상품번호
    private int totalqty;        // 생산수량
    private Date startDate;      // 시작일
    private Date endDate;        // 종료일
    private Date createDate;     // 생성일
    private Date deliveryDate;   // 납품기간
    private String deliveryDest; // 납품업체
    private String planStatus;   // 진행상황
    private String planCause;    // 진행사유
    private String planNotes;    // 비고

    // 조인된 상품 정보
    private Products_DTO product;
}
