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


public class Bom_DAO {

	public int insertBom(Bom_DTO bom_DTO) {
		System.out.println("Bom_DAO insertMaterials 실행");
		
		int result = -1;
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
		
			Connection con = ds.getConnection(); // DB 연결
		

	
			String 	query =  " insert into boms ";		
					query += " values ('',?,?,?,'n')";
					
			PreparedStatement ps = con.prepareStatement(query);
			
	
			ps.setDouble(1, bom_DTO.getQuantity());
			ps.setInt(2, bom_DTO.getMaterialid());
			ps.setInt(3, bom_DTO.getProductid());
	
	
	
			result = ps.executeUpdate();
			System.out.println("result :"+result);
		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 인설트");
			e.printStackTrace();
		}
		return result;
	}	
	
	public List selectBOM(){
		System.out.println("selectBOM 실행");
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
			String 	query =  " select * from boms  WHERE bomdel = 'n'";
			PreparedStatement ps = con.prepareStatement(query);
					

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Bom_DTO bom_DTO = new Bom_DTO();
				
				bom_DTO.setBomid(rs.getInt("bomid"));
				bom_DTO.setQuantity(rs.getInt("quantity"));
				bom_DTO.setMaterialid(rs.getInt("materialid"));
			
				
				
//				System.out.println(rs.getString("materialname")+","+rs.getString("materialdel"));
				
				list.add(bom_DTO);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int deleteBom(Bom_DTO bom_DTO) {
		System.out.println("Bom_DTO deleteBom 실행");
		
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
			String 	query =  " update boms ";
					query += " set bomdel  = 'y'";
					query += " where bomid = ?";
					
				
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, bom_DTO.getBomid());
		
			System.out.println("비오엠아이디"+bom_DTO.getBomid());
			result = ps.executeUpdate();
			
		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	
	}
	public int updateBom(Bom_DTO bom_DTO) {
		System.out.println("Bom_DAO updateBom 실행");
		
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
			String 	query =  " update boms ";
					query += " set quantity  = ?";
					query += " where bomid = ?";
					
			
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setDouble(1, bom_DTO.getQuantity());
			ps.setInt(2, bom_DTO.getBomid());
			System.out.println(bom_DTO.getQuantity()+"  "+ bom_DTO.getBomid());
			
		
			result = ps.executeUpdate();
		
		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
