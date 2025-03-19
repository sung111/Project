package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Inventorycheck_DTO;

public class Inventorycheck_DAO {

//	public List optionDB() {
//
//		List list = new ArrayList();
//
//		try {
//			Context ctx = new InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
//
//			Connection con = ds.getConnection();
//
//			String query = " select inv.*, ma.* "
//					+ " from inventorystatus inv "
//					+ " join materials ma "
//					+ " order by materialname ";
//			PreparedStatement ps = con.prepareStatement(query);
//
////			excuteQuery : SQL 중 select 실행
////			executeUpdate : select 외 모든것
////			ResultSet : select 조호 ㅣ결과 전체 : 엑셀 테이블 느낌
//			ResultSet rs = ps.executeQuery();
//
//			while (rs.next()) {
//				Inventorycheck_DTO dto = new Inventorycheck_DTO();
////				컬럼명입력해서 가져오기
//				dto.setInventoryId(rs.getInt("inventoryid"));
//				dto.setReceiptDate(rs.getDate("receiptdate"));
//				dto.setMaExpDate(rs.getDate("expdate"));
//				dto.setMaterialId(rs.getInt("materialid"));
//				dto.setMaQuantity(rs.getInt("quantity"));
//				dto.setMaLotNo(rs.getString("lotnumber"));
//				dto.setMaPartNum(rs.getString("partnumber"));
//				dto.setMaUnit(rs.getString("unit"));
//				dto.setMaterialname(rs.getString("materialname"));
//				dto.setMaSpec(rs.getString("spec"));
//
//				list.add(dto);
//			}
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	// 원자재 보여주기
	public List selectcheck() {

		List list = new ArrayList();

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select inv.*, ma.* "
					+ " from inventorystatus inv "
					+ " join materials ma on inv.MATERIALID = ma.MATERIALID "
					+ " order by expdate ";
			PreparedStatement ps = con.prepareStatement(query);

//			excuteQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조호 ㅣ결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Inventorycheck_DTO dto = new Inventorycheck_DTO();
//				컬럼명입력해서 가져오기
				dto.setInventoryId(rs.getInt("inventoryid"));
				dto.setReceiptDate(rs.getDate("receiptdate"));
				dto.setMaExpDate(rs.getDate("expdate"));
				dto.setMaterialId(rs.getInt("materialid"));
				dto.setMaQuantity(rs.getInt("quantity"));
				dto.setMaLotNo(rs.getString("lotnumber"));
				dto.setMaPartNum(rs.getString("partnumber"));
				dto.setMaUnit(rs.getString("unit"));
				dto.setMaterialname(rs.getString("materialname"));
				dto.setMaSpec(rs.getString("spec"));

				list.add(dto);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 완제품 보여주기
	public List selectcheck2() {

		List list = new ArrayList();

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select pr.*, prod.* "
					+ " from productinven pr "
					+ " join products prod on pr.productid = prod.productid "
					+ " order by expdate ";
			PreparedStatement ps = con.prepareStatement(query);

//			excuteQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조호 ㅣ결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Inventorycheck_DTO dto = new Inventorycheck_DTO();
//				컬럼명입력해서 가져오기
				dto.setProductinvenId(rs.getInt("productinvenid"));  // 재고시퀀스
				dto.setProductId(rs.getInt("productid"));			//제품 번호
				dto.setProductname(rs.getString("productname")); 	//제품명
				dto.setMakeDate(rs.getDate("makedate"));			//만든날
				dto.setPrExpDate(rs.getDate("expdate"));			//유효기간
				dto.setPrPartNum(rs.getString("partnumber"));		//품번
				dto.setPrLotNo(rs.getString("lotnumber"));			// lot no
				dto.setPrQuantity(rs.getInt("quantity"));
				dto.setPrUnit(rs.getString("unit"));
				dto.setPrSpec(rs.getString("spec"));

				list.add(dto);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int updateInventory1(Inventorycheck_DTO inventoryDTO) {
		int result = -1;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " update inventorystatus "
					+ " set receiptdate = ?, expdate= ? + 30, quantity = ? "
					+ " where inventoryid = ? ";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setDate(1, inventoryDTO.getReceiptDate());
			ps.setDate(2, inventoryDTO.getReceiptDate());
			ps.setInt(3, inventoryDTO.getMaQuantity());
			ps.setInt(4, inventoryDTO.getInventoryId());
			
			result = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return result;
	}
	public int updateInventory2(Inventorycheck_DTO inventoryDTO) {
		int result = -1;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			Connection con = ds.getConnection();
			
			String query = " update productinven "
					+ " set makedate = ?, expdate = ? + 30, quantity = ? "
					+ " where productinvenid = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setDate(1, inventoryDTO.getMakeDate());
			ps.setDate(2, inventoryDTO.getMakeDate());
			ps.setInt(3, inventoryDTO.getPrQuantity());
			ps.setInt(4, inventoryDTO.getProductinvenId());
			
			result = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
//	자제 삭제메소드
	public int deleteInventory1(Inventorycheck_DTO inventoryDTO) {

		int result = -1;

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " delete from INVENTORYSTATUS where inventoryId = ? ";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt( 1, inventoryDTO.getInventoryId() );

			result = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
//	완제품 삭제메소드
	public int deleteInventory2(Inventorycheck_DTO inventoryDTO) {
		
		int result = -1;
		
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			Connection con = ds.getConnection();
			
			String query = " delete from productinven where productinvenid = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt( 1, inventoryDTO.getProductinvenId() );
			
			result = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 자재 재고 등록
	public int insertInventory1(Inventorycheck_DTO inventoryDTO) {
		int result = -1;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();
			
			String query = " insert into INVENTORYSTATUS "
						+ "values ( '', ?, ?+30, ? ,? ) ";

			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setDate(1, inventoryDTO.getReceiptDate());
			ps.setDate(2, inventoryDTO.getReceiptDate());
			ps.setInt(3, inventoryDTO.getMaterialId());
			ps.setInt(4, inventoryDTO.getMaQuantity());
			
			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 완제품 재고 등록
	public int insertInventory2(Inventorycheck_DTO inventoryDTO) {
		int result = -1;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			Connection con = ds.getConnection();
			
			String query = " insert into PRODUCTINVEN "
						+ " values ( '' ,? ,? ,?+30 ,? ) ";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, inventoryDTO.getProductinvenId() );
			ps.setDate(2, inventoryDTO.getMakeDate() );
			ps.setDate(3, inventoryDTO.getMakeDate() );
			ps.setInt(4, inventoryDTO.getPrQuantity() );
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
