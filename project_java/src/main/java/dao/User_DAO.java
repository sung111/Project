package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.User_DTO;

public class User_DAO {
    private DataSource dataSource;

    // DAO 생성자에서 DataSource 설정
    public User_DAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/oracle"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //  특정 유저 정보 가져오기 (SELECT)
    public User_DTO getUserById(String userId) {
        User_DTO user = null;
        String sql = "SELECT * FROM USERS WHERE userId = ?";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User_DTO();
                user.setUserId(rs.getString("userId"));
                user.setUserPw(rs.getString("userPw"));
                user.setUserName(rs.getString("userName"));
                user.setJob(rs.getString("job"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCreateDate(rs.getDate("createDat"));
                user.setField(rs.getString("field"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //  유저 추가
    public boolean insertUser(User_DTO user) {
        String sql = "INSERT INTO USERS (userId, userPw, userName, job, email, phone, createDate, field) VALUES (?, ?, ?, ?, ?, ?, SYSDATE, ?)";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPw());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getJob());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getPhone());
            pstmt.setString(7, user.getField());
            
            int result = pstmt.executeUpdate();
            return result > 0; // 성공하면 true 반환
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 유저 정보 수정
    public boolean updateUser(User_DTO user) {
        String sql = "UPDATE USERS SET userPw=?, userName=?, job=?, email=?, phone=?, field=? WHERE userId=?";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, user.getUserPw());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getJob());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getField());
            pstmt.setString(7, user.getUserId());
            
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 유저 삭제
    public boolean deleteUser(String userId) {
        String sql = "DELETE FROM USERS WHERE userId = ?";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, userId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

