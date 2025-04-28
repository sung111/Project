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

    // 작업지시서와 해당 제품 정보를 함께 가져오는 메서드
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

    // 상품 목록을 조회하는 메서드
    public List<Products_DTO> getProducts() {
        // 상품 목록 조회
        return sqlSession.selectList("WorkorderMapper.selectAllProducts");
    }
}
