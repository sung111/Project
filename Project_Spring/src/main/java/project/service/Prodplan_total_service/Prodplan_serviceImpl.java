package project.service.Prodplan_total_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Prodplan_total_dao.Prodplan_DAO;
import project.dto.ProductionPlan_DTO;

@Service
public class Prodplan_serviceImpl implements Prodplan_service {

    @Autowired
    private Prodplan_DAO planDAO;

    @Override
    public List<ProductionPlan_DTO> getAllPlans() {
        return planDAO.getAllPlans();
    }
	
}
