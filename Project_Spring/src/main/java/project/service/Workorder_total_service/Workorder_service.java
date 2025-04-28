package project.service.Workorder_total_service;

import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;
import java.util.List;

public interface Workorder_service {

    // orderId로 작업지시서+제품 정보 가져오기
    WorkOrder_DTO getWorkOrderById(int orderId);

    // 상품 목록 가져오기
    List<Products_DTO> getProducts();
}
