package project.service.Workorder_total_service;

import project.dto.WorkOrder_DTO;

public interface Workorder_service {

    WorkOrder_DTO getWorkOrderById(int orderId);
}
