package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.ProductionPlan_DTO;
import dto.Products_DTO;

public class ProductionPlan_DAO {
    private DataSource dataSource;
 // DAO 객체 선언
    private ProductionPlan_DAO planDAO; 
    
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
        
        String sql = " SELECT p.*, pr.productname, pr.spec, pr.lotnumber, pr.partnumber, pr.unit, pr.warehouse "
                   + " FROM productionplans p "
                   + " LEFT JOIN products pr ON p.productId = pr.productid";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            System.out.println("SQL 실행됨: " + sql);

            while (rs.next()) {
                System.out.println("데이터 가져옴 - Plan ID: " + rs.getInt("planId"));

                ProductionPlan_DTO plan = new ProductionPlan_DTO();
                plan.setPlanId(rs.getInt("planId"));
                plan.setUserId(rs.getString("userId"));
                plan.setProductId(rs.getInt("productId"));
                plan.setTotalqty(rs.getInt("totalqty"));
                plan.setCreateDate(rs.getDate("createDate"));
                plan.setStartDate(rs.getDate("startDate"));
                plan.setEndDate(rs.getDate("endDate"));
                plan.setDeliveryDest(rs.getString("deliveryDest"));
                plan.setPlanStatus(rs.getString("planStatus"));
                plan.setPlanCause(rs.getString("planCause"));
                plan.setPlanNotes(rs.getString("planNotes"));

                // Products_DTO 객체 생성 및 상품 정보 저장
                Products_DTO product = new Products_DTO();
                product.setProductid(rs.getInt("productid"));
                product.setProductname(rs.getString("productname"));
                product.setSpec(rs.getString("spec"));
                product.setLotnumber(rs.getString("lotnumber"));
                product.setWarehouse(rs.getString("warehouse"));
                product.setPartnumber(rs.getString("partnumber"));
                product.setUnit(rs.getString("unit"));

                // 생산계획 DTO에 상품 정보 추가
                plan.setProduct(product);
                planList.add(plan);
            }

            System.out.println("총 " + planList.size() + "개의 데이터가 조회됨.");

        } catch (SQLException e) {
            System.out.println("SQL 실행 오류 발생!");
            e.printStackTrace();
        }
        return planList;
    }

    // 생산계획 수정
    public boolean updateProductionPlan(int planId, String planStatus, String planNotes) {
        String sql = "UPDATE productionplans SET planStatus = ?, planNotes = ? WHERE planId = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("[DAO] updateProductionPlan() 실행");
            System.out.println("SQL: " + sql);
            System.out.println("파라미터 - planStatus: " + planStatus + ", planNotes: " + planNotes + ", planId: " + planId);

            pstmt.setString(1, planStatus);
            pstmt.setString(2, planNotes);
            pstmt.setInt(3, planId);

            int rowsUpdated = pstmt.executeUpdate();
            System.out.println("업데이트된 행 개수: " + rowsUpdated);

            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("SQL 실행 오류 발생!");
            e.printStackTrace();
            return false;
        }
    }

//    생산계획 삭제
    public boolean deleteProductionPlan(int planId) {
//    	외래키가 연결이 되있다면 외래키 제약조건 위반으로 삭제가 안됨.
    	// 자식 테이블이 조회
        String checkSQL = "SELECT COUNT(*) FROM performances WHERE planId = ?"; 
     // 자식 테이블에서 삭제하도록 명령
        String deleteChildSQL = "DELETE FROM performances WHERE planId = ?"; 
     // 부모 테이블에서 삭제
        String deleteParentSQL = "DELETE FROM productionplans WHERE planId = ?"; 

        try (Connection conn = dataSource.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
             PreparedStatement deleteChildStmt = conn.prepareStatement(deleteChildSQL);
             PreparedStatement deleteParentStmt = conn.prepareStatement(deleteParentSQL)) {

            // 자식 데이터 확인
            checkStmt.setInt(1, planId);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                // 자식 데이터가 있다면 삭제
                System.out.println("[DAO] 자식 데이터 삭제 중...");
                deleteChildStmt.setInt(1, planId);
                int childRowsDeleted = deleteChildStmt.executeUpdate();
                System.out.println("삭제된 자식 행 개수: " + childRowsDeleted);
            }

            // 부모 데이터 삭제
            deleteParentStmt.setInt(1, planId);
            int parentRowsDeleted = deleteParentStmt.executeUpdate();
            System.out.println("[DAO] 부모 데이터 삭제 중...");
            System.out.println("삭제된 부모 행 개수: " + parentRowsDeleted);

            return parentRowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println("SQL 실행 오류 발생!");
            e.printStackTrace();
            return false;
        }
    }
    // 생산계획 추가
    public boolean addProductionPlan(String planName, String planStatus) {
        String sql = "INSERT INTO productionplans (planName, planStatus) VALUES (?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, planName);
            pstmt.setString(2, planStatus);

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 특정 생산계획 조회
    public ProductionPlan_DTO getProductionPlanById(int planId) {
        String sql = "SELECT * FROM productionplans WHERE planId = ?";
        ProductionPlan_DTO plan = null;

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, planId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    plan = new ProductionPlan_DTO();
                    plan.setPlanId(rs.getInt("planId"));
                    plan.setUserId(rs.getString("userId"));
                    plan.setProductId(rs.getInt("productId"));
                    plan.setTotalqty(rs.getInt("totalqty"));
                    plan.setCreateDate(rs.getDate("createDate"));
                    plan.setStartDate(rs.getDate("startDate"));
                    plan.setEndDate(rs.getDate("endDate"));
                    plan.setDeliveryDest(rs.getString("deliveryDest"));
                    plan.setPlanStatus(rs.getString("planStatus"));
                    plan.setPlanCause(rs.getString("planCause"));
                    plan.setPlanNotes(rs.getString("planNotes"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plan;
    }
}
