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
        // 작업지시서 정보 조회
        WorkOrder_DTO workOrder = sqlSession.selectOne("WorkorderMapper.selectWorkOrderById", orderId);

        // 해당 작업지시서에 해당하는 제품 정보 조회
        if (workOrder != null) {
            Products_DTO product = sqlSession.selectOne("WorkorderMapper.selectProductById", workOrder.getProductId());
            workOrder.setProduct(product);  // 조회한 제품 정보를 WorkOrder_DTO에 세팅
        }

        return workOrder;
    }

    // 상품 목록을 조회
    @Override
    public List<Products_DTO> getProducts() {
        return sqlSession.selectList("WorkorderMapper.selectAllProducts");
    }

    // 제품명으로 제품 정보를 조회
    @Override
    public Products_DTO getProductByName(String productName) {
        return sqlSession.selectOne("WorkorderMapper.selectProductByName", productName);
    }
}
