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

    // ���� ��ȹ ��ü ��ȸ
    @Override
    public List<ProductionPlan_DTO> getAllPlans() {
        return planDAO.getAllPlans();
    }

    // ���� ��ȹ �߰�
    @Override
    public void insertPlan(ProductionPlan_DTO plan) {
        if (plan == null) {
            throw new IllegalArgumentException("���� ��ȹ ������ ��� �ֽ��ϴ�.");
        }
        planDAO.insertPlan(plan); 
    }

    // ���� ��ȹ ����
    @Override
    public void updatePlan(ProductionPlan_DTO plan) {
        if (plan == null || plan.getProductId() <= 0) {
            throw new IllegalArgumentException("������ ��ȹ ���� �Ǵ� ��ǰ ID�� ��� �ְų� �߸��Ǿ����ϴ�.");
        }
        planDAO.updatePlan(plan);
    }
    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return planDAO.getProducts(searchTerm);
    }

}
