package project.dao.Maintitle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;
import project.dto.maintitle_DTO;

@Repository
public class Maintitle_DAOImpl implements Maintitle_DAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<maintitle_DTO> titleAnnouncement() {
		List<maintitle_DTO> list = null;
		try {
			list = sqlSession.selectList("mapper.emp.titleAnnouncement");
			System.out.println("selectMaterials 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleGeneralBulletinBoard() {
		List<maintitle_DTO> list = null;
		try {
			list = sqlSession.selectList("mapper.emp.titleGeneralBulletinBoard");
			System.out.println("titleGeneralBulletinBoard 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleFinishedProduct() {
		List<maintitle_DTO> list = null;
		try {
			list = sqlSession.selectList("mapper.emp.titleFinishedProduct");
			System.out.println("titleFinishedProduct 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<maintitle_DTO> titleQualityControl() {
		List<maintitle_DTO> list = null;
		try {
			list = sqlSession.selectList("mapper.emp.titleQualityControl");
			System.out.println("titleQualityControl 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	






	

	
}
