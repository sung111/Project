package project.dao.mapper;

import java.util.List;

import project.dto.WorkOrder_DTO;

public interface Workorder_mapper {
    WorkOrder_DTO selectWorkOrderById(int orderId);
    List<WorkOrder_DTO> selectAllWorkOrders();
}
