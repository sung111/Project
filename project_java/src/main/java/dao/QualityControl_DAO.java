package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.eclipse.jdt.internal.compiler.lookup.IQualifiedTypeResolutionListener;

import dto.Performance_DTO;
import dto.QualityControl_DTO;

//품질관리 테이블
public class QualityControl_DAO {

	public List<Performance_DTO> selectPerform() {

		List<Performance_DTO> list = new ArrayList<Performance_DTO>();

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select perf.* , prod.productname " + " from performances perf "
					+ " join products prod on perf.productid = prod.productid " + " order by reporttime desc ";
			PreparedStatement ps = con.prepareStatement(query);

//			excuteQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조호 ㅣ결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Performance_DTO dto = new Performance_DTO();
//				컬럼명입력해서 가져오기
				dto.setPerformanceId(rs.getInt("performanceid"));
				dto.setProductNameST(rs.getString("productname"));
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

	

	public int insertQuality(QualityControl_DTO qualityDTO) {

		int result = -1;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();
//			테이블 시퀀스값, 제품명, 계획시퀀스값, userId , 작성일자, 코멘트 , 생산갯수 
			String query = " insert into "
					+ "	qualitycontrols "
					+ "	values(null, ?, ?,'adminid1', ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(query);
			
			
			
			
			ps.setInt( 1, qualityDTO.getProductName() );
			ps.setInt( 2, qualityDTO.getPerformanceId() );
//			ps.setString(result, query);
			ps.setString( 3, qualityDTO.getResult() );
			ps.setString(4, qualityDTO.getFailreason() );
			ps.setString(5, qualityDTO.getComments() );
			ps.setTimestamp(6, qualityDTO.getReportTime() );
			ps.setInt(7, qualityDTO.getPasspack() );
			ps.setInt(8, qualityDTO.getFailPack() );
			
			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
