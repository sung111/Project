package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.queryDTO;




public class queryDAO {

	
	
	public List selectList(dto.queryDTO queryDTO) {
		System.out.println("쿼리표 조회");
		List list = new ArrayList();

		try {
			// [DB 접속] 시작
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = ds.getConnection();

			// [SQL 준비]
			// 조회했음
			String query = " SELECT a.productname, b.productid, b.t6_8, b.t8_10, b.t10_12, b.t12_14, b.t14_16, b.t16_18 "
		             + " FROM products a "
		             + " JOIN ( "
		             + "     SELECT productid, "
		             + "            NVL(SUM(t6_8), 0) AS t6_8, "
		             + "            NVL(SUM(t8_10), 0) AS t8_10, "
		             + "            NVL(SUM(t10_12), 0) AS t10_12, "
		             + "            NVL(SUM(t12_14), 0) AS t12_14, "
		             + "            NVL(SUM(t14_16), 0) AS t14_16, "
		             + "            NVL(SUM(t16_18), 0) AS t16_18 "
		             + "     FROM ( "
		             + "         SELECT productid, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t6_8, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t8_10, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t10_12, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t12_14, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t14_16, "
		             + "                CASE WHEN reporttime BETWEEN TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') "
		             + "                                     AND TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS') THEN productioncount "
		             + "                     END AS t16_18 "
		             + "         FROM performances "
		             + "     ) temp "
		             + "     GROUP BY productid "
		             + " ) b "
		             + " ON a.productid = b.productid ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, queryDTO.getDate() + " 06:00:00");
			ps.setString(2, queryDTO.getDate() + " 08:00:00");
			ps.setString(3, queryDTO.getDate() + " 08:00:00");
			ps.setString(4, queryDTO.getDate() + " 10:00:00");
			ps.setString(5, queryDTO.getDate() + " 10:00:00");
			ps.setString(6, queryDTO.getDate() + " 12:00:00");
			ps.setString(7, queryDTO.getDate() + " 12:00:00");
			ps.setString(8, queryDTO.getDate() + " 14:00:00");
			ps.setString(9, queryDTO.getDate() + " 14:00:00");
			ps.setString(10, queryDTO.getDate() + " 16:00:00");
			ps.setString(11, queryDTO.getDate() + " 16:00:00");
			ps.setString(12, queryDTO.getDate() + " 18:00:00");
             // 값을 넣을 곳이 없으니 받을것도 없다
			// [SQL 실행] 및 [결과 확보]
			ResultSet rs = ps.executeQuery();

			
			
			while (rs.next()) {

				dto.queryDTO dto = new dto.queryDTO();
				// 실행(조회)된 것에서 // INT를 가져옴(입력X)
				// ( int "" )
				// rs.number("nextval)

				// getstring 메소드에 title을 넣어서
				// 나온결과를 dto메소드에 전달인자로 넣어서 결과를만듬
				dto.setProductname(rs.getString("productname"));
				dto.setProductid(rs.getInt("productid"));
				dto.setT6_8(rs.getInt("t6_8"));
				dto.setT8_10(rs.getInt("t8_10"));
				dto.setT10_12(rs.getInt("t10_12"));
				dto.setT12_14(rs.getInt("t12_14"));
				dto.setT14_16(rs.getInt("t14_16"));
				dto.setT16_18(rs.getInt("t16_18"));
				// DB에서 VARCHAR(해당하는 값)을 가져옴

				list.add(dto);

				System.out.println("표 제품이름 출력 : "  + rs.getString("productname"));
				System.out.println("표 아이디출력 : "  + rs.getInt("productid"));
				System.out.println("표 시간1출력  : "  + rs.getInt("t6_8"));
				System.out.println("표 시간2출력 : "  + rs.getInt("t8_10"));
				System.out.println("표 시간3출력 : "  + rs.getInt("t10_12"));
				System.out.println("표 시간4출력 : "  + rs.getInt("t12_14"));
				System.out.println("표 시간5출력 : "  + rs.getInt("t14_16"));
				System.out.println("표 시간6출력  : "  + rs.getInt("t16_18"));
				
				
			} 
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
