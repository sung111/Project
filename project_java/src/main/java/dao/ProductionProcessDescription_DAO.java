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
import dto.*;
//생산공정설명 테이블
public class ProductionProcessDescription_DAO {
	
	public int insertPPD(ProductionProcessDescription_DTO PPD) {
		System.out.println("ProductionProcessDescription_DAO insertPPD 실행");
		
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
			String 	query =  " insert into PROCESSDESCRIPTIONS ";
//					방법 1: sql string을 그냥 만들기
//					query += " values (seq_todo.nextval, '"+ todoDTO.getTodo() +"', sysdate, null,'N')";
//					방법 2: ? 활용하기
					query += " values ('',?,?,?,?,?)";
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, PPD.getProductid());
			ps.setString(2, PPD.getProcessstage());
			ps.setString(3, PPD.getDescription());
			ps.setString(4, PPD.getEquipment());
			ps.setString(5, PPD.getHygiene());
			
		
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

	public List selectPPD(ProductionProcessDescription_DTO PPD){
		System.out.println("selectPPD 실행");
		List list = new ArrayList();
		
		try {
	
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기

			Connection con = ds.getConnection(); // DB 연결

			String 	query = " select * from PROCESSDESCRIPTIONS" ;
					query +=" WHERE productid = ?";
					
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, PPD.getProductid());
			System.out.println("PPD.getProductid() ="+PPD.getProductid());
	
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			ProductionProcessDescription_DTO ppd = new ProductionProcessDescription_DTO();

					ppd.setProcessid(rs.getInt("processid"));
					ppd.setProductid(rs.getInt("productid"));
					ppd.setProcessstage(rs.getString("processstage"));
					ppd.setDescription(rs.getString("description"));
					ppd.setEquipment(rs.getString("equipment"));
					ppd.setHygiene(rs.getString("hygiene"));					
	

				list.add(ppd);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int updatePPD(ProductionProcessDescription_DTO PPD) {
		System.out.println("ProductionProcessDescription_DTO updatePPD 실행");
		
		int result = -1;
		try {
		
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
		
			Connection con = ds.getConnection(); // DB 연결
		

		
			String 	query =  " update PROCESSDESCRIPTIONS ";
					query += " set processstage  = ?,";
					query += " description  = ?,";
					query += " equipment  = ?,";
					query += " hygiene  = ?"; 
					query += " where processid = ?";
					
					
					
			
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, PPD.getProcessstage());
			ps.setString(2, PPD.getDescription());
			ps.setString(3, PPD.getEquipment());
			ps.setString(4, PPD.getHygiene());
			ps.setInt(5, PPD.getProcessid());
			


		
			System.out.println("updateProducts"+ps.executeUpdate());
			
			

			result = ps.executeUpdate();

		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePPD(ProductionProcessDescription_DTO PPD) {
		System.out.println("ProductionProcessDescription_DTO deletePPD 실행");
		
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

					String 	query =  " DELETE FROM PROCESSDESCRIPTIONS ";
					query += " where processid = ?";
					
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, PPD.getProcessid());
			System.out.println(" PPD.getProcessid() :"+ PPD.getProcessid());
			result = ps.executeUpdate();

		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
