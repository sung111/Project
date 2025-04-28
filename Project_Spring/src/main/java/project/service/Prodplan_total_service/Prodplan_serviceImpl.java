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
            throw new IllegalArgumentException("���� ��ȹ ������ �����Ǿ����ϴ�.");
        }
        planDAO.insertPlan(plan); 
    }

    // ���� ��ȹ ����
    @Override
    public void updatePlan(ProductionPlan_DTO dto) {
        if (dto == null) {
            throw new IllegalArgumentException("������ ���� ��ȹ ������ �����ϴ�.");
        }
        planDAO.updatePlan(dto);
    }

    // ��ǰ �˻� �ڵ��ϼ���
    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return planDAO.getProducts(searchTerm);
    }
    
    // ���� ��ȹ ����
    @Override
    public void deletePlan(int planId) {
        if (planId <= 0) {
            throw new IllegalArgumentException("��ȿ���� ���� ���� ��ȹ ��ȣ�Դϴ�.");
        }
        planDAO.deletePlan(planId);
    }

    // ���� ��ȹ ���� ���� ��ȸ
    @Override
    public ProductionPlan_DTO getPlanDetails(int planId) {
        return planDAO.getPlanDetails(planId);  // DAO���� �����͸� �����ɴϴ�.
    }
    

    //���������̼�
    @Autowired
    private Prodplan_DAO prodplan_DAO;  
    @Override
    public int getTotalCount() {
        return prodplan_DAO.getTotalCount();  
    }

    @Override
    public List<ProductionPlan_DTO> getProdPlanList(int pageNo, int viewCount) {
        return prodplan_DAO.getProdPlanList(pageNo, viewCount);  // DAO�� �޼ҵ� ȣ��
    }

    
}
