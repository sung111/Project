package project.dao.Prodplan_total_dao;

import java.util.List;

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

    //수정
	/*
	 * @Override public void updatePlan(ProductionPlan_DTO dto) {
	 * sqlSession.update(NAMESPACE + ".updatePlan", dto); }
	 */



    @Override
    public void insertPlan(ProductionPlan_DTO plan) {
        sqlSession.insert(NAMESPACE + ".insertPlan", plan);
    }

    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return sqlSession.selectList(NAMESPACE + ".getProducts", searchTerm);
    }

    //삭제
    @Override
    public void deletePlan(int planId) {
        sqlSession.delete(NAMESPACE + ".deletePlan", planId);
    }

    
}
