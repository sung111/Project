package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Performance_DTO;

//실적테이블
public class Performance_DAO {
	
	public int insertPerform(Performance_DTO performDTO) {
		System.out.println("insertPerform 실행");
		
		int result = -1;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			Connection con = ds.getConnection();
//			테이블 시퀀스값, 제품명, 계획시퀀스값, userId , 작성일자, 코멘트 , 생산갯수 
			String query = " insert into performances "
					+ " values ('', ?, '1', 'admin1', ? , ? , ?) ";
			
			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString( 몇번째 ? , value );
			ps.setString(1, performDTO.getProductName());
//			Timestamp 어떻게 뽑아낼지 공부하기.
			ps.setTimestamp(1, performDTO.getReportTime());
			ps.setString(1, performDTO.getPerformanceComment());
			ps.setInt(1, performDTO.getProductionCount());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}
	
	
	
	
}
