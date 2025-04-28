package project.service.Workorder_total_service;

import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;
import java.util.List;

public interface Workorder_service {

    // orderId�� �۾����ü�+��ǰ ���� ��������
    WorkOrder_DTO getWorkOrderById(int orderId);

    // ��ǰ ��� ��������
    List<Products_DTO> getProducts();
}
