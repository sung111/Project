package project.dao.Workorder_total_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;

import java.util.List;

@Repository
public class Workorder_DAOImpl implements Workorder_DAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public WorkOrder_DTO getWorkOrderWithProductById(int orderId) {
        // �۾����ü� ���� ��ȸ
        WorkOrder_DTO workOrder = sqlSession.selectOne("WorkorderMapper.selectWorkOrderById", orderId);

        // �ش� �۾����ü��� �ش��ϴ� ��ǰ ���� ��ȸ
        if (workOrder != null) {
            Products_DTO product = sqlSession.selectOne("WorkorderMapper.selectProductById", workOrder.getProductId());
            workOrder.setProduct(product);  // ��ȸ�� ��ǰ ������ WorkOrder_DTO�� ����
        }

        return workOrder;
    }

    // ��ǰ ����� ��ȸ
    @Override
    public List<Products_DTO> getProducts() {
        return sqlSession.selectList("WorkorderMapper.selectAllProducts");
    }

    // ��ǰ������ ��ǰ ������ ��ȸ
    @Override
    public Products_DTO getProductByName(String productName) {
        return sqlSession.selectOne("WorkorderMapper.selectProductByName", productName);
    }
}
