package project.service.Workorder_total_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Workorder_total_dao.Workorder_DAO;
import project.dto.WorkOrder_DTO;

@Service
public class Workorder_serviceImpl implements Workorder_service {

    @Autowired
    private Workorder_DAO workorderDAO;

    @Override
    public WorkOrder_DTO getWorkOrderById(int orderId) {
        return workorderDAO.getWorkOrderById(orderId);
    }
    
    
}
