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
					query += " values ('',?,?,?,?,?,?,?,?,'n')";
					
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
			System.out.println("result :"+result);
		
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
			String 	query =  " select * from MATERIALS  WHERE materialdel = 'n'";
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
				materials_DTO.setMateriaid(rs.getInt("materialid"));
				
//				System.out.println(rs.getString("materialname")+","+rs.getString("materialdel"));
				System.out.println(rs.getString("materialid"));
				list.add(materials_DTO);
			}

		
			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List selectFM(Materials_DTO materials_DTO){
		System.out.println("selectFM 실행");
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
//			String 	query =  " SELECT * ";
//					query += " FROM  materials m ";
//					query += " JOIN boms b ON m.MATERIALID = b.MATERIALID ";
//					query += " where product_material_id = ? and materialdel = 'n'";
			
				String query = " SELECT ";
	            query += " m.MATERIALID, ";
	            query += " m.MATERIALNAME, ";
	            query += " m.PRICE, ";
	            query += " m.SPEC, ";
	            query += " m.UNIT, ";
	            query += " m.SUPPLIER, ";
	            query += " m.PARTNUMBER, ";
	            query += " m.LOTNUMBER, ";
	            query += " m.WAREHOUSE, ";
	            query += " m.MATERIALDEL, ";
	            query += " b.MATERIALID  as bom_ma_id, ";
	            query += " b.BOMID  , ";
	            query += " b.PRODUCTID as bom_pr_id, ";
	            query += " b.QUANTITY as bom_quan, ";
	            query += " b.bomdel , ";
	            query += " i.MATERIALID as inven_ma_id, ";
	            query += " i.QUANTITY as inven_quan ";
	            query += " FROM  materials m ";
	            query += " left JOIN boms b ON m.MATERIALID = b.MATERIALID  ";
	            query += " left join inventorystatus i on m.MATERIALID = i.MATERIALID ";
	            query += " where  m.materialdel = 'n' ";
	            query += " and b.productid = ? ";
	            query += " and b.bomdel = 'n' ";
	            query += " order by m.MATERIALID ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, materials_DTO.getBom_pr_id());
//			System.out.println("getProduct_material_id() ="+ getProduct_material_id());
					

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Materials_DTO DTO = new Materials_DTO();
				
				DTO.setMateriaid(rs.getInt("materialid")); //자제 시퀸스값
				DTO.setMaterialname(rs.getString("materialname")); //이름
				DTO.setPrice(rs.getInt("price")); //가격
				DTO.setUnit(rs.getString("unit")); //단위
				DTO.setStockquantity(rs.getInt("inven_quan")); //재고수량
				DTO.setSpec(rs.getString("spec")); //규격
				DTO.setSupplier(rs.getString("supplier")); //공급업체
				DTO.setLotnumber(rs.getString("lotnumber")); //랏넘버
				DTO.setWarehouse(rs.getString("warehouse")); //창고위치
				DTO.setPartNumber(rs.getString("partNumber")); //품번
				DTO.setBomdel(rs.getString("bomdel")); //품번
				DTO.setBom_quan(rs.getDouble("bom_quan")); // 사용수량
				DTO.setBomid(rs.getInt("bomid"));
				
				
				
				System.out.println("rs.getInt(\"materialid\")"+ rs.getInt("materialid"));
				System.out.println(rs.getString("materialname")+","+rs.getString("supplier"));
				System.out.println("값을 못가져옴");
				list.add(DTO);
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
					query += " set MATERIALNAME  = ?,";
					query += " price  = ?,";
					query += " spec  = ?,";
					query += " unit  = ?,";
					query += " supplier  = ?,";
					query += " partNumber  = ?,";
					query += " lotnumber  = ?,";
					query += " warehouse  = ?";
					query += " where MATERIALid = ?";
					
			
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, materials_DTO.getMaterialname());
			ps.setInt(2, materials_DTO.getPrice());
			ps.setString(3, materials_DTO.getSpec());
			ps.setString(4, materials_DTO.getUnit());
			ps.setString(5, materials_DTO.getSupplier());
			ps.setString(6, materials_DTO.getPartNumber());
			ps.setString(7, materials_DTO.getLotnumber());
			ps.setString(8, materials_DTO.getWarehouse());
			ps.setInt(9, materials_DTO.getMateriaid());
			
			System.out.println("----------여기는 DAO입니다");
			System.out.println(materials_DTO.getPrice());
			System.out.println(materials_DTO.getSpec());
			System.out.println(materials_DTO.getUnit());
			System.out.println(materials_DTO.getSupplier());
			System.out.println(materials_DTO.getPartNumber());
			System.out.println(materials_DTO.getLotnumber());
			System.out.println(materials_DTO.getWarehouse());
			System.out.println(materials_DTO.getMaterialname());
			System.out.println(materials_DTO.getMateriaid());
			
			
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
	
	public int deleteMaterials(Materials_DTO materials_DTO) {
		System.out.println("Materials_DTO deleteMaterials 실행");
		
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
					query += " set materialdel  = 'y'";
					query += " where MATERIALID = ?";
					
				
					
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, materials_DTO.getMateriaid());
		
			System.out.println("메테리얼아이디"+materials_DTO.getMateriaid());
			result = ps.executeUpdate();
			
		
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
