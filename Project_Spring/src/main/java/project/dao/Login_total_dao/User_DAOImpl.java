package project.dao.Login_total_dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.User_DTO;

@Repository
public class User_DAOImpl implements Users_DAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String NAMESPACE = "mapper.emp";

	@Override
	public User_DTO selectUserId(String userId) {
		return sqlSession.selectOne(NAMESPACE + ".selectUserId", userId);
	}

}
