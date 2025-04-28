package project.dao.Workorder_total_dao;

import project.dto.WorkOrder_DTO;

public interface Workorder_DAO {


    WorkOrder_DTO getWorkOrderById(int orderId);
}
