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
				dto.setProductId(rs.getInt("productid"));
				dto.setPerformanceId(rs.getInt("performanceid"));
				dto.setProductName(rs.getString("productname"));
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
			String query = " insert into " + "	qualitycontrols "
					+ "	values(null, ?, ?,'adminid1', ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, qualityDTO.getProductId());
			ps.setInt(2, qualityDTO.getPerformanceId());
//			ps.setString(result, query);
			ps.setString(3, qualityDTO.getResult());
			ps.setString(4, qualityDTO.getFailreason());
			ps.setString(5, qualityDTO.getComments());
			ps.setTimestamp(6, qualityDTO.getReportTime());
			ps.setInt(7, qualityDTO.getPasspack());
			ps.setInt(8, qualityDTO.getFailPack());

			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	public List selectQuality() {

		List<QualityControl_DTO> list = new ArrayList<QualityControl_DTO>();

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select qu.*, pr.productname " + " from qualitycontrols qu "
					+ " join products pr on qu.productid = pr.productid " + " order by qualitycontroltime desc";
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				QualityControl_DTO dto = new QualityControl_DTO();
//				컬럼명 입력
				dto.setQualityControlId(rs.getInt("qualitycontrolid"));
				dto.setProductId(rs.getInt("productid"));
				dto.setProductNameST(rs.getString("productname"));
				dto.setPerformanceId(rs.getInt("performanceid"));
				dto.setUserId(rs.getString("userid"));
				dto.setResult(rs.getString("result"));
				dto.setFailreason(rs.getString("failreason"));
				dto.setComments(rs.getString("comments"));
				dto.setReportTime(rs.getTimestamp("qualitycontroltime"));
				dto.setPasspack(rs.getInt("passpack"));
				dto.setFailPack(rs.getInt("failpack"));

				list.add(dto);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int updateQuality(QualityControl_DTO qualityDTO) {
		int result = -1;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();
			String query = " update qualitycontrols " + " set " + "    qualitycontroltime = ?, " + "    result = ?, "
					+ "    failreason =  ?, " + "    comments =  ? "
//					+ "    passpack = ? "
//					+ "    failpack = ? "
					+ " where " + "    qualitycontrolid = ? ";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setTimestamp(1, qualityDTO.getReportTime());
			ps.setString(2, qualityDTO.getResult());
			ps.setString(3, qualityDTO.getFailreason());
			ps.setString(4, qualityDTO.getComments());
			ps.setInt(5, qualityDTO.getQualityControlId());

//			ps.setInt( 5, qualityDTO.getPasspack() );
//			ps.setInt( 5, qualityDTO.getFailPack() );

			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List searchQuality(QualityControl_DTO qualityDTO) {

		List<QualityControl_DTO> list = new ArrayList<QualityControl_DTO>();

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " select qu.*, pr.productname " + " from qualitycontrols qu "
					+ " join products pr on qu.productid = pr.productid " + " where qualitycontroltime between ? and ? "
					+ " and ( ? is null or pr.productname like ? ) " + " and ( qu.result like ? or ? is null) "
					+ " and ( qu.Failreason like ? or ? is null) " + " order by qualitycontroltime desc ";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setTimestamp(1, qualityDTO.getReportTime());
			ps.setTimestamp(2, qualityDTO.getReportTime2());
//			ps.setString(3, qualityDTO.getProductNameST());
//			ps.setString(4, qualityDTO.getProductNameST());
			ps.setString(5, qualityDTO.getResult());
			ps.setString(6, qualityDTO.getResult());
			ps.setString(7, qualityDTO.getFailreason());
			ps.setString(8, qualityDTO.getFailreason());

			String productName = qualityDTO.getProductNameST();
			if (productName == null || productName.trim().isEmpty()) {
				ps.setNull(3, java.sql.Types.VARCHAR);
				ps.setString(4, "%");
			} else {
				ps.setString(3, productName);
				ps.setString(4, "%" + productName + "%");
			}

//			executeQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조회 결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				QualityControl_DTO dto = new QualityControl_DTO();
//				컬럼명입력해서 가져오기
				dto.setQualityControlId(rs.getInt("qualitycontrolid"));
				dto.setProductId(rs.getInt("productid"));
				dto.setProductNameST(rs.getString("productname"));
				dto.setPerformanceId(rs.getInt("performanceid"));
				dto.setUserId(rs.getString("userid"));
				dto.setResult(rs.getString("result"));
				dto.setFailreason(rs.getString("failreason"));
				dto.setComments(rs.getString("comments"));
				dto.setReportTime(rs.getTimestamp("qualitycontroltime"));
				dto.setPasspack(rs.getInt("passpack"));
				dto.setFailPack(rs.getInt("failpack"));

				list.add(dto);
			}

			System.out.println("Start Date: " + qualityDTO.getReportTime());
			System.out.println("End Date: " + qualityDTO.getReportTime2());
			System.out.println("Product Name: " + qualityDTO.getProductNameST());
			System.out.println("Result: " + qualityDTO.getResult());
			System.out.println("Fail Reason: " + qualityDTO.getFailreason());

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

//	삭제메소드
	public int deletePerform(QualityControl_DTO qualityDTO) {

		int result = -1;

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " delete from qualitycontrols " + " where qualitycontrolid = ? ";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, qualityDTO.getQualityControlId());

			result = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

//	실적 일일 조회
	public List DailySearch( QualityControl_DTO qualityDTO ) {

		List list = new ArrayList();

		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			Connection con = ds.getConnection();

			String query = " SELECT perf.*, prod.productname "
					+ " FROM performances perf "
					+ " JOIN products prod ON perf.productid = prod.productid "
					+ " WHERE TRUNC(perf.REPORTTIME) = ? "
					+ " ORDER BY perf.REPORTTIME DESC ";
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println("query : " + query);
			ps.setDate(1, qualityDTO.getDateReportTime());

//			executeQuery : SQL 중 select 실행
//			executeUpdate : select 외 모든것
//			ResultSet : select 조회 결과 전체 : 엑셀 테이블 느낌
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Performance_DTO dto = new Performance_DTO();
//				컬럼명입력해서 가져오기
				dto.setProductId(rs.getInt("productid"));
				dto.setPerformanceId(rs.getInt("performanceid"));
				dto.setProductName(rs.getString("productname"));
				dto.setPlanId(rs.getInt("PlanId"));
				dto.setUserId(rs.getString("UserId"));
				dto.setReportTime(rs.getTimestamp("ReportTime"));
				dto.setPerformanceComment(rs.getString("PerformanceComment"));
				dto.setProductionCount(rs.getInt("ProductionCount"));

				list.add(dto);
			}

			con.close();
			
			System.out.println("검색 날짜: " + qualityDTO.getDateReportTime());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
