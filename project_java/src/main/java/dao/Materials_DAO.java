package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.*;

//자재 테이블
public class Materials_DAO {
	
	public int insertMaterials(Materials_DTO materials_DTO) {
		System.out.println("Materials_DAO insertMaterials 실행");
		
		int result = -1;
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
			// 커넥션 풀에서 접속 정보를 가져오기
			// 접속이 안되면 null
			Connection con = ds.getConnection(); // DB 연결
			// DB 접속 완

			// [SQL 준비]
			String 	query =  " insert into materials ";
//					방법 1: sql string을 그냥 만들기
//					query += " values (seq_todo.nextval, '"+ todoDTO.getTodo() +"', sysdate, null,'N')";
//					방법 2: ? 활용하기
					query += " values (?,?,?,?,?,?,?,?)";
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, materials_DTO.getMaterialname());
			ps.setInt(2, materials_DTO.getPrice());
			ps.setString(3, materials_DTO.getSpec());
			ps.setString(4, materials_DTO.getUnit());
			ps.setString(5, materials_DTO.getSupplier());
			ps.setString(6, materials_DTO.getPartNumber());
			ps.setString(7, materials_DTO.getLotnumber());
			ps.setString(8, materials_DTO.getWarehouse());
			// 왼쪽 : prepareStatement = SQL실행을 위한 객체
			// 오른쪽 :con.prepareStatement(query) = 미리컴파일하고 문제가있으면 에러를 나타냄
//		--	PreparedStatement// 메소드가 아님 물어보기---

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			// 
			result = ps.executeUpdate();

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 인설트");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	public List selectMaterials(){
		System.out.println("selectMaterials 실행");
		List list = new ArrayList();
		
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
			// 커넥션 풀에서 접속 정보를 가져오기
			// 접속이 안되면 null
			Connection con = ds.getConnection(); // DB 연결
			// DB 접속 완

			// [SQL 준비]
			String 	query =  " select * from MATERIALS";
			PreparedStatement ps = con.prepareStatement(query);
					

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Materials_DTO materials_DTO = new Materials_DTO();
				
				materials_DTO.setMaterialname(rs.getString("materialname"));
				materials_DTO.setPrice(rs.getInt("price"));
				materials_DTO.setSpec(rs.getString("spec"));
				materials_DTO.setUnit(rs.getString("unit"));
				materials_DTO.setSupplier(rs.getString("supplier"));
				materials_DTO.setPartNumber(rs.getString("partNumber"));
				materials_DTO.setLotnumber(rs.getString("lotnumber"));
				materials_DTO.setWarehouse(rs.getString("warehouse"));
				
			
				list.add(materials_DTO);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	public int updateMaterials(Materials_DTO materials_DTO) {
		System.out.println("Materials_DTO updateMaterials 실행");
		
		int result = -1;
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
			// 커넥션 풀에서 접속 정보를 가져오기
			// 접속이 안되면 null
			Connection con = ds.getConnection(); // DB 연결
			// DB 접속 완

			// [SQL 준비]
			String 	query =  " update MATERIALS ";
					query += " set MATERIALNAME  = ? ";
					query += " set price  = ? ";
					query += " set spec  = ? ";
					query += " set unit  = ? ";
					query += " set supplier  = ? ";
					query += " set partNumber  = ? ";
					query += " set lotnumber  = ? ";
					query += " set warehouse  = ? ";
					query += " where MATERIALNAME = ? ";
					
			
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, materials_DTO.getMaterialname());
			ps.setInt(2, materials_DTO.getPrice());
			ps.setString(3, materials_DTO.getSpec());
			ps.setString(4, materials_DTO.getUnit());
			ps.setString(5, materials_DTO.getSupplier());
			ps.setString(6, materials_DTO.getPartNumber());
			ps.setString(7, materials_DTO.getLotnumber());
			ps.setString(8, materials_DTO.getWarehouse());
			
			
			
			// 왼쪽 : prepareStatement = SQL실행을 위한 객체
			// 오른쪽 :con.prepareStatement(query) = 미리컴파일하고 문제가있으면 에러를 나타냄
//		--	PreparedStatement// 메소드가 아님 물어보기---

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			// 
			result = ps.executeUpdate();

		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
