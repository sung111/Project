package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import dto.Materials_DTO;

public class MaterialsProducts_DAO {

	public List selectMaterialsProducts() {
		System.out.println("selectMaterialsProducts 실행");
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
//			String 	query =  " select * from MATERIALS  WHERE materialdel = 'n'";

			String query = " select materialname,PRICE,SPEC,UNIT,SUPPLIER,PARTNUMBER,LOTNUMBER,WAREHOUSE,'m' type,materialdel,materialid from MATERIALS";
			query += " WHERE materialdel = 'n'";
			query += " union all";
			query += " select productname materialname,PRICE,SPEC,UNIT,'',PARTNUMBER,LOTNUMBER,WAREHOUSE,'p' type,productdel materialdel,productid materialid from products";
			query += " WHERE productdel = 'n' ";
			query += " order by materialname ";

			PreparedStatement ps = con.prepareStatement(query);

			// [SQL 실행] 및 [결과 확보]
			// ResultSet executeQuery : SQL중 select 실행
			// int executeUpdate() : select 외 모든것
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Materials_DTO materials_DTO = new Materials_DTO();

				materials_DTO.setMaterialname(rs.getString("materialname"));
				materials_DTO.setPrice(rs.getInt("price"));
				materials_DTO.setSpec(rs.getString("spec"));
				materials_DTO.setUnit(rs.getString("unit"));
				materials_DTO.setSupplier(rs.getString("supplier"));
				materials_DTO.setPartNumber(rs.getString("partNumber"));
				materials_DTO.setLotnumber(rs.getString("lotnumber"));
				materials_DTO.setWarehouse(rs.getString("warehouse"));
				materials_DTO.setType(rs.getString("type"));
				materials_DTO.setMateriaid(rs.getString("materialid"));

				list.add(materials_DTO);
			}

			con.close();
		} catch (Exception e) {
			System.err.println("버그발생 셀렉트");
			e.printStackTrace();
		}

		return list;
	}

	public int deleteMaterialsProducts(Materials_DTO materials_DTO) {
		System.out.println("Materials_DTO deleteMaterialsProducts 실행");

		int result = -1;
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
			// 커넥션 풀에서 접속 정보를 가져오기
			// 접속이 안되면 null
			Connection con = ds.getConnection(); // DB 연결
			// DB 접속 완

			if (materials_DTO.getType().equals("m")) {
				// [SQL 준비]
				System.out.println("원재료,메테리얼수정");
				String query = " update MATERIALS ";
				query += " set materialdel  = 'y'";
				query += " where MATERIALID = ?";

				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, materials_DTO.getMateriaid());

				result = ps.executeUpdate();

				System.out.println("메테리얼아이디" + materials_DTO.getMateriaid());

			} else if (materials_DTO.getType().equals("p")) {
				System.out.println("완제품,프러턱트수정");
				String query = " update products ";
				query += " set productdel  = 'y'";
				query += " where PRODUCTID = ?";

				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, materials_DTO.getMateriaid());

				result = ps.executeUpdate();
				System.out.println("프러덕트" + materials_DTO.getMateriaid());
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateMaterialsProducts(Materials_DTO materials_DTO) {
		System.out.println("Materials_DTO updateMaterialsProducts 실행");

		int result = -1;
		try {
			// [db 접속 시작]
			Context ctx = new InitialContext(); // JNDI 컨텍스트 생성
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");// 오라클 이라는 이름에 DataSource 찾기
			// 커넥션 풀에서 접속 정보를 가져오기
			// 접속이 안되면 null
			Connection con = ds.getConnection(); // DB 연결
			// DB 접속 완

			if (materials_DTO.getType().equals("m")) {
				System.out.println("원재료 업데이트됬음");
				String query = " update MATERIALS ";
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
				ps.setString(9, materials_DTO.getMateriaid());
				result = ps.executeUpdate();

			} else if (materials_DTO.getType().equals("p")) {
				
				System.out.println("완제품업데이트됬음");
				String query = " update products ";
				query += " set productname  = ?,";
				query += " partnumber  = ?,";
				query += " warehouse  = ?,";
				query += " price  = ?,";
				query += " spec  = ?,";
				query += " unit  = ?,";
				query += " lotnumber  = ?";
				query += " where productid = ?";

				PreparedStatement ps = con.prepareStatement(query);

				ps.setString(1, materials_DTO.getMaterialname());
				ps.setString(2, materials_DTO.getPartNumber());
				ps.setString(3, materials_DTO.getWarehouse());
				ps.setInt(4, materials_DTO.getPrice());
				ps.setString(5, materials_DTO.getSpec());
				ps.setString(6, materials_DTO.getUnit());
				ps.setString(7, materials_DTO.getLotnumber());
				ps.setString(8, materials_DTO.getMateriaid());
				result = ps.executeUpdate();

	
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
