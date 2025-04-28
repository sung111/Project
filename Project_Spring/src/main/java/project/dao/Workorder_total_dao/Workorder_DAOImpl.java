package project.dao.Workorder_total_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.WorkOrder_DTO;

@Repository
public class Workorder_DAOImpl implements Workorder_DAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public WorkOrder_DTO getWorkOrderById(int orderId) {
        return sqlSession.selectOne("WorkorderMapper.selectWorkOrderById", orderId);
    }
}
