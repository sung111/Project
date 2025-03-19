package dao;

import dto.WorkOrder_DTO;
import dto.Products_DTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WorkOrder_DAO {

    // 제품 정보 조회
    public WorkOrder_DTO getWorkOrderDetails(int orderId) {
        WorkOrder_DTO workOrder = new WorkOrder_DTO();
        Products_DTO product = new Products_DTO();
        
        // DB 연결 및 쿼리 실행
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdb", "username", "password")) {
            String sql = "SELECT p.productname, p.spec, p.unit " +
                    "FROM workorder wo " +
                    "JOIN product p ON wo.ProductId = p.ProductId " +
                    "WHERE wo.OrderId = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, orderId);
                ResultSet rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    // 제품 정보 설정
                    product.setProductname(rs.getString("productname"));
                    product.setSpec(rs.getString("spec"));
                    product.setUnit(rs.getString("unit"));
                    
                    // WorkOrder_DTO에 설정
                    workOrder.setProduct(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return workOrder;
    }
}
