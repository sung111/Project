package project.dao.Workorder_total_dao;

import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;
import java.util.List;

public interface Workorder_DAO {

    // orderId로 작업지시서와 해당 제품 정보를 함께 가져오는 메서드
    WorkOrder_DTO getWorkOrderWithProductById(int orderId);

    // 상품 목록을 가져오는 메서드
    List<Products_DTO> getProducts();
}
