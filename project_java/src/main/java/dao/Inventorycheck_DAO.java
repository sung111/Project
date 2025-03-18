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

	// db 보여주기
	public List selectcheck() {

		List list = new ArrayList();

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select inv.*, ma.materialname, ma.materialid kkk, ma.lotnumber, ma.partnumber, ma.unit "
					+ " from inventorystatus inv "
					+ " join materials ma on inv.MATERIALID = ma.MATERIALID ";
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

				list.add(dto);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	

}
