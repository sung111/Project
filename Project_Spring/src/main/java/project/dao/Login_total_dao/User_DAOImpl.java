package project.dao.Login_total_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.dto.User_DTO;

@Repository
public class User_DAOImpl implements Users_DAO {

    @Autowired
    private SqlSession sqlSession;

    // 수정된 NAMESPACE
    private static final String NAMESPACE = "project.dao.Login_total_dao.Users_DAO";

    @Override
    public User_DTO selectUserId(String userId) {
        return sqlSession.selectOne(NAMESPACE + ".selectUserId", userId);
    }
}

