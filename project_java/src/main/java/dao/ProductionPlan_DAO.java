package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.ProductionPlan_DTO;

public class ProductionPlan_DAO {
    private final String DB_URL = "jdbc:oracle:thin:@125.181.132.133:51521:xe";


    // DB 연결 메서드
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL);
    }

    // 전체 생산 계획 목록을 가져오는 메서드
    public List<ProductionPlan_DTO> getAllProductionPlans() {
        List<ProductionPlan_DTO> planList = new ArrayList<>();
        String sql = "SELECT * FROM productionplans"; // 실제 테이블명 적용

        try (Connection conn = getConnection()) {
            System.out.println(" DB 연결 성공");
        } catch (SQLException e) {
            System.out.println(" DB 연결 실패");
            e.printStackTrace();
        }
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            System.out.println(" SQL 실행됨: " + sql);

            while (rs.next()) {
                System.out.println(" 데이터 가져옴 - Plan ID: " + rs.getInt("planId"));

                ProductionPlan_DTO plan = new ProductionPlan_DTO();
                plan.setPlanId(rs.getInt("planId"));
                plan.setUserId(rs.getString("userId"));
                plan.setProductId(rs.getInt("productId"));
                plan.setTotalqty(rs.getInt("totalqty"));
                plan.setStartDate(rs.getDate("startDate"));
                plan.setEndDate(rs.getDate("endDate"));
                plan.setDeliveryDest(rs.getString("deliveryDest"));
                plan.setPlanStatus(rs.getString("planStatus"));
                plan.setPlanCause(rs.getString("planCause"));
                plan.setPlanNotes(rs.getString("planNotes"));

                planList.add(plan);
            }

            System.out.println(" 총 " + planList.size() + "개의 데이터가 조회됨.");

        } catch (SQLException e) {
            System.out.println(" SQL 실행 오류 발생!");
            e.printStackTrace();
        }
        return planList;
    }

}
