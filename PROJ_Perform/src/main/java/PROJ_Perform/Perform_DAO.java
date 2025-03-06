package PROJ_Perform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Perform_DAO {

	
	public int insertTodo(Perform_DTO todoDTO) {
		System.out.println("TodoDAO insertTodo 실행");
		int result = -1;
		
		try {
			// [DB 접속] 시작
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = ds.getConnection();

			// [SQL 준비]
			String 	query =  " insert into perform ";
					// 방법 1 : sql string을 그냥 만들기
//					query += " values ( seq_todo.nextval, '"+ todoDTO.getTodo() +"', sysdate, null, 'N' )";
					// 방법 2 : ? 활용하기
					query += " values ( seq_todo.nextval, null, sysdate )";
			PreparedStatement ps = con.prepareStatement(query);
			// 첫번째 물음표에 값을 넣어달라
//			ps.setString(1, todoDTO.getTodo());

			// [SQL 실행] 및 [결과 확보]
			// int executeUpdate() : select 외 모든 것
			// int에는 영향받은 줄의 수
			// DB에 삽입함
			result = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
		// 리스트 메소드 (담기)
		List selectPerform () {
		// 리스트 생성
		List list = new ArrayList();
		
		// 접속
		try {
		Context ctx = new InitialContext();
		DataSource ds =  (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
		
		// 커넥션 풀
		Connection con = ds.getConnection();
		
		
		// 준비하기     // 조회함
		String query = " select * from perform ";
		                       // 커넥션풀에서 조회된 query문을 준비
		PreparedStatement ps = con.prepareStatement(query);
		
		// 실행하기
		// 결과값 저장    // 준비한것에서 query문을 실행한다
 		ResultSet rs = ps.executeQuery();
 		
 		// rs.next()는 다음 커서로 옮기고 없다면 false
 		// 일때까지 계속 실행
		while(rs.next()) {
			
			Perform_DTO dto = new Perform_DTO();
			dto.setProduct_name(rs.getString("Product_name"));
			dto.setReport_time(rs.getDate("report_time"));
			dto.setProduction_count(rs.getInt("production_count"));
			
			
		}
        
		con.close();	
		
		
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		// 리스트 돌려주기
		return list;
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
