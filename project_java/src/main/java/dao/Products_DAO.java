package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Materials_DTO;
import dto.*;

//완제품 테이블
public class Products_DAO {

	public int insertProducts(Products_DTO products_DTO) {
		System.out.println("Products_DAO insertProducts 실행");
		
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
			String 	query =  " insert into products ";
//					방법 1: sql string을 그냥 만들기
//					query += " values (seq_todo.nextval, '"+ todoDTO.getTodo() +"', sysdate, null,'N')";
//					방법 2: ? 활용하기
					query += " values (?,?,null,?,null,null,null,?,?,?,?)";
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, products_DTO.getProductname());
			ps.setString(2, products_DTO.getPartnumber());
			ps.setString(3, products_DTO.getWarehouse());
			ps.setInt(4, products_DTO.getPrice());
			ps.setString(5, products_DTO.getSpec());
			ps.setString(6, products_DTO.getUnit());
			ps.setString(7, products_DTO.getLotnumber());
		
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
	
	
	
	
	public List selectProducts(){
		System.out.println("selectProducts 실행");
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
			String 	query =  " select * from products";
			PreparedStatement ps = con.prepareStatement(query);
					

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Products_DTO products_DTO = new Products_DTO();
//				System.out.println(rs.next());
				
				products_DTO.setProductname(rs.getString("productname"));
				products_DTO.setPartnumber(rs.getString("partnumber"));
				products_DTO.setWarehouse(rs.getString("warehouse"));
				products_DTO.setPrice(rs.getInt("price"));
				products_DTO.setSpec(rs.getString("spec"));
				products_DTO.setUnit(rs.getString("unit"));
				products_DTO.setLotnumber(rs.getString("lotnumber"));
			
				
			
				list.add(products_DTO);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
//	public int updateProducts(Products_DTO products_DTO) {
//		System.out.println("Materials_DTO updateMaterials 실행");
//		
//		int result = -1;
//		try {
//			// [db 접속 시작]
//			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
//			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
//			// 커넥션 풀에서 접속 정보를 가져오기
//			// 접속이 안되면 null
//			Connection con = ds.getConnection(); // DB 연결
//			// DB 접속 완
//
//			// [SQL 준비]
//			String 	query =  " update MATERIALS ";
//					query += " set price  = ?,";
//					query += " spec  = ?,";
//					query += " unit  = ?,";
//					query += " supplier  = ?,";
//					query += " partNumber  = ?,";
//					query += " lotnumber  = ?,";
//					query += " warehouse  = ?";
//					query += " where MATERIALNAME = ?";
//					
//			
//					
//			PreparedStatement ps = con.prepareStatement(query);
//			
//			ps.setInt(1, materials_DTO.getPrice());
//			ps.setString(2, materials_DTO.getSpec());
//			ps.setString(3, materials_DTO.getUnit());
//			ps.setString(4, materials_DTO.getSupplier());
//			ps.setString(5, materials_DTO.getPartNumber());
//			ps.setString(6, materials_DTO.getLotnumber());
//			ps.setString(7, materials_DTO.getWarehouse());
//			ps.setString(8, materials_DTO.getMaterialname());
//			
//			System.out.println("----------여기는 DAO입니다");
//			System.out.println(materials_DTO.getPrice());
//			System.out.println(materials_DTO.getSpec());
//			System.out.println(materials_DTO.getUnit());
//			System.out.println(materials_DTO.getSupplier());
//			System.out.println(materials_DTO.getPartNumber());
//			System.out.println(materials_DTO.getLotnumber());
//			System.out.println(materials_DTO.getWarehouse());
//			System.out.println(materials_DTO.getMaterialname());
//			
//			
//			// 왼쪽 : prepareStatement = SQL실행을 위한 객체
//			// 오른쪽 :con.prepareStatement(query) = 미리컴파일하고 문제가있으면 에러를 나타냄
////		--	PreparedStatement// 메소드가 아님 물어보기---
//
//			// [SQL 실행] 및 [결과 확보]
//			// ResultSet executeQuery : SQL중 select 실행
//			// int executeUpdate() : select 외 모든것
//			// 
//			result = ps.executeUpdate();
//
//		
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	public int deleteProducts(Materials_DTO materials_DTO) {
//		System.out.println("Materials_DTO deleteMaterials 실행");
//		
//		int result = -1;
//		try {
//			// [db 접속 시작]
//			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
//			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
//			// 커넥션 풀에서 접속 정보를 가져오기
//			// 접속이 안되면 null
//			Connection con = ds.getConnection(); // DB 연결
//			// DB 접속 완
//
//			// [SQL 준비]
//			String 	query =  " DELETE FROM MATERIALS ";
//					query += " WHERE MATERIALNAME  = ?";
//					
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString(1, materials_DTO.getMaterialname());
//			System.out.println("materials_DTO.getMaterialname() :"+materials_DTO.getMaterialname());
//			result = ps.executeUpdate();
//
//		
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	
	
	
}
