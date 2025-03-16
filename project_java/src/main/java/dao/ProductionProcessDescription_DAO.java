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

//생산공정설명 테이블
public class ProductionProcessDescription_DAO {

	public List selectPPD(ProductionProcessDescription_DTO PPD){
		System.out.println("selectPPD 실행");
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
	
}
