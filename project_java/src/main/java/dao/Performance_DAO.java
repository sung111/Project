package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
					+ " values ('', '김치찌개', '1', 'admin1', ? , ? , ?) ";
			
			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString( 몇번째 ? , value );
//			ps.setString(1, performDTO.getProductName());
//			Timestamp 어떻게 뽑아낼지 공부하기.
//			ps.setTimestamp(2, performDTO.getReportTime());
//			ps.setString(3, performDTO.getPerformanceComment());
//			ps.setInt(4, performDTO.getProductionCount());
			ps.setTimestamp(1, performDTO.getReportTime());
			ps.setString(2, performDTO.getPerformanceComment());
			ps.setInt(3, performDTO.getProductionCount());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}
	
	public List<Performance_DTO> selectPerform() {
		
		System.out.println("List 타입 selectWorkOrder 실행");
		
		List<Performance_DTO> list = new ArrayList<Performance_DTO>();
		
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			Connection con = ds.getConnection();
			
			String query = " select * from performances ORDER BY performanceid DESC ";
			PreparedStatement ps = con.prepareStatement(query);
			
//			excuteQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조호 ㅣ결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Performance_DTO dto = new Performance_DTO();
				dto.setPerformanceId(rs.getInt("PerformanceId"));
				dto.setProductName(rs.getString("ProductName"));
				dto.setPlanId(rs.getInt("PlanId"));
				dto.setUserId(rs.getString("UserId"));
				dto.setReportTime(rs.getTimestamp("ReportTime"));
				dto.setPerformanceComment(rs.getString("PerformanceComment"));
				dto.setProductionCount(rs.getInt("ProductionCount"));
				
				list.add(dto);
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	
}
