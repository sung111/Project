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
					query += " values ('',?,?,null,?,null,null,null,?,?,?,'n',?)";
					
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
			String 	query = " select * from products  WHERE productdel = 'n'";
			PreparedStatement ps = con.prepareStatement(query);
					

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Products_DTO products_DTO = new Products_DTO();
//				System.out.println(rs.next());
				
				products_DTO.setProductname(rs.getString("PRODUCTNAME"));
				products_DTO.setPartnumber(rs.getString("PARTNUMBER"));
				products_DTO.setWarehouse(rs.getString("WAREHOUSE"));
				products_DTO.setPrice(rs.getInt("PRICE"));
				products_DTO.setSpec(rs.getString("SPEC"));
				products_DTO.setUnit(rs.getString("UNIT"));
				products_DTO.setLotnumber(rs.getString("LotNumber"));
				products_DTO.setProductid(rs.getString("productID"));
			
			
				System.out.println("1"+products_DTO.getProductname());
				System.out.println("2"+products_DTO.getPartnumber());
				System.out.println("3"+products_DTO.getWarehouse());
				System.out.println("4"+products_DTO.getPrice());
				System.out.println("5"+products_DTO.getSpec());
				System.out.println("6"+products_DTO.getUnit());
				System.out.println("7"+products_DTO.getLotnumber());
			
				
			
				list.add(products_DTO);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	public int updateProducts(Products_DTO products_DTO) {
		System.out.println("Products_DTO updateProducts 실행");
		
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
			String 	query =  " update products ";
					query += " set productname  = ?,";
					query += " partnumber  = ?,";
					query += " warehouse  = ?,";
					query += " price  = ?,"; 
					query += " spec  = ?,";
					query += " unit  = ?,";
					query += " lotnumber  = ?";
					query += " where productname = ?";
					
					
					
			
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, products_DTO.getProductname());
			ps.setString(2, products_DTO.getPartnumber());
			ps.setString(3, products_DTO.getWarehouse());
			ps.setInt(4, products_DTO.getPrice());
			ps.setString(5, products_DTO.getSpec());
			ps.setString(6, products_DTO.getUnit());
			ps.setString(7, products_DTO.getLotnumber());
			ps.setString(8, products_DTO.getOriginname());
			
			System.out.println("1"+products_DTO.getProductname());
			System.out.println("2"+products_DTO.getPartnumber());
			System.out.println("3"+products_DTO.getWarehouse());
			System.out.println("4"+products_DTO.getPrice());
			System.out.println("5"+products_DTO.getSpec());
			System.out.println("6"+products_DTO.getUnit());
			System.out.println("7"+products_DTO.getLotnumber());
			System.out.println("8"+products_DTO.getOriginname());
		
		
			System.out.println("updateProducts"+ps.executeUpdate());
			
			
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
	
	public int deleteProducts(Products_DTO products_DTO) {
		System.out.println("Products_DTO deleteProducts 실행");
		
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

					String 	query =  " update products ";
					query += " set productdel  = 'y'";
					query += " where productID = ?";
					
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, products_DTO.getProductid());
			System.out.println("products_DTO.getProductname() :"+products_DTO.getProductname());
			result = ps.executeUpdate();

		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
}
