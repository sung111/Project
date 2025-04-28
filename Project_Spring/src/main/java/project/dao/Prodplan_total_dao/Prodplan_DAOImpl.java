package project.dao.Prodplan_total_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.ProductionPlan_DTO;

@Repository
public class Prodplan_DAOImpl implements Prodplan_DAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "project.dao.mapper.ProdplanMapper";

    @Override
    public List<ProductionPlan_DTO> getAllPlans() {
        return sqlSession.selectList(NAMESPACE + ".selectAllPlans");
    }

    // 수정
    @Override
    public void updatePlan(ProductionPlan_DTO dto) {
        sqlSession.update(NAMESPACE + ".updatePlan", dto);
    }

    @Override
    public void insertPlan(ProductionPlan_DTO plan) {
        sqlSession.insert(NAMESPACE + ".insertPlan", plan);
    }

    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return sqlSession.selectList(NAMESPACE + ".getProducts", searchTerm);
    }

    // 삭제
    @Override
    public void deletePlan(int planId) {
        sqlSession.delete(NAMESPACE + ".deletePlan", planId);
    }

    // 생산 계획 세부 정보 조회
    @Override
    public ProductionPlan_DTO getPlanDetails(int planId) {
        return sqlSession.selectOne(NAMESPACE + ".getPlanDetails", planId);  // Mapper에서 쿼리 실행
    }
    
    @Override
    public int getTotalCount() {
        return sqlSession.selectOne("ProdPlanMapper.getTotalCount");
    }

    @Override
    public List<ProductionPlan_DTO> getProdPlanList(int pageNo, int viewCount) {
        Map<String, Object> params = new HashMap<String, Object>(); 
        params.put("pageNo", pageNo);
        params.put("viewCount", viewCount);
        return sqlSession.selectList("ProdPlanMapper.getProdPlanList", params);
    }

    
}
