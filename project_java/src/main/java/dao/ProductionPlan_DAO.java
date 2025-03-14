package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.ProductionPlan_DTO;

public class ProductionPlan_DAO {

    private DataSource dataSource;

    public ProductionPlan_DAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/oracle");  // 데이터베이스 설정에 맞게 수정
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ProductionPlan_DTO> getAllProductionPlans() {
        List<ProductionPlan_DTO> planList = new ArrayList<>();
        String sql = "SELECT * FROM productionplans"; // 실제 테이블명 적용

        try (Connection conn = dataSource.getConnection();
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
