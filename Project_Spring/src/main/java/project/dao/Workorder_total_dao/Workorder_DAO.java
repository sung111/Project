package project.dao.Workorder_total_dao;

import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;
import java.util.List;

public interface Workorder_DAO {

    // orderId�� �۾����ü��� �ش� ��ǰ ������ �Բ� �������� �޼���
    WorkOrder_DTO getWorkOrderWithProductById(int orderId);

    // ��ǰ ����� �������� �޼���
    List<Products_DTO> getProducts();
}
