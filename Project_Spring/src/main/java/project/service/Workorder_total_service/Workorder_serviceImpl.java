package project.service.Workorder_total_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Workorder_total_dao.Workorder_DAO;
import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;

import java.util.List;

@Service
public class Workorder_serviceImpl implements Workorder_service {

    @Autowired
    private Workorder_DAO workorderDAO;

    @Override
    public WorkOrder_DTO getWorkOrderById(int orderId) {
        return workorderDAO.getWorkOrderWithProductById(orderId);
        // getWorkOrderById °Ê getWorkOrderWithProductById ∑Œ ∏¬√Á¡‹
    }

    @Override
    public List<Products_DTO> getProducts() {
        return workorderDAO.getProducts();
    }
}
