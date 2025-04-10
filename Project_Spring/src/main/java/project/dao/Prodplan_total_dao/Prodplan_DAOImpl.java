package project.dao.Prodplan_total_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.ProductionPlan_DTO;

import java.util.List;

@Repository
public class Prodplan_DAOImpl implements Prodplan_DAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "project.dao.mapper.ProdplanMapper";

    @Override
    public List<ProductionPlan_DTO> getAllPlans() {
        return sqlSession.selectList(NAMESPACE + ".selectAllPlans");
    }
}
