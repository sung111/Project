package project.dao.Workorder_total_dao;

import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;
import java.util.List;

public interface Workorder_DAO {

    WorkOrder_DTO getWorkOrderWithProductById(int orderId);

    List<Products_DTO> getProducts();

    Products_DTO getProductByName(String productName);
}
