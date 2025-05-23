package project.dao.Standard_total_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;

@Repository
public class Materials_DAOimpl implements Materials_DAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Materials_DTO> SelectList() {
		

		
		return null;
	}

//	@Override
//	public List<Materials_DTO> selectMaterials() {
//		List<Materials_DTO> result = sqlSession.selectList("mapper.emp.selectMaterials");
//		System.out.println("SelectList 의 값 ="+result);
//		return result;
//	}
	@Override
	public List<Materials_DTO> selectMaterials(Materials_DTO dto) {
		List<Materials_DTO> list = null;
		try {
			
			int page = dto.getPage();
			int viewCount = dto.getViewCount();
			
			int indexStart = (viewCount * (page-1)) +1; //이전페이지 마지막에서 +1
			int indexEnd = page * viewCount; // 비번페이지 마지막 
			
			dto.setIndexStart(indexStart);
			dto.setIndexEnd(indexEnd);
			
			list = sqlSession.selectList("mapper.bom.selectPageMaterials",dto);
			System.out.println("selectMaterials 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
		
	}
	@Override
	public int countmaterials() {
		int result = 0;
		try {
			result = sqlSession.selectOne("mapper.bom.totalMaterials");
			System.out.println("countEmp실행");
			System.out.println("result 값="+result);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return result;
		
	}

	//원재려생성
	@Override
	public int insertMaterials(Materials_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.insert("mapper.bom.insertMaterials",dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//원재려수정
	@Override
	public int updateMaterials(Materials_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.update("mapper.bom.updateMaterials",dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//원재료 삭제
	@Override
	public int deleteMaterials(Materials_DTO dto) {
		int result = 0;
		try {
		result = sqlSession.update("mapper.bom.deleteMaterials",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	
	
	
	@Override
	public List<Materials_DTO> selectFM() {
		// TODO Auto-generated method stub
		return null;
	}


	





}
