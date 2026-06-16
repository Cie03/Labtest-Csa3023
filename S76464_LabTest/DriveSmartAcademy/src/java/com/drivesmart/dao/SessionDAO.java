package com.drivesmart.dao;

import com.drivesmart.bean.SessionBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionDAO {
   
    private static final String URL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = ""; 

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL Driver not found");
        }
    }

    public boolean bookSession(SessionBean session) {
        String query = "INSERT INTO Training_Sessions (student_name, branch_location, lesson_type, status) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, session.getStudentName());
            pstmt.setString(2, session.getBranchLocation());
            pstmt.setString(3, session.getLessonType());
            pstmt.setString(4, session.getStatus());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<SessionBean> getAllSessions() {
        List<SessionBean> sessions = new ArrayList<>();
        String query = "SELECT * FROM Training_Sessions ORDER BY branch_location ASC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                SessionBean session = new SessionBean();
                session.setSessionId(rs.getInt("session_id"));
                session.setStudentName(rs.getString("student_name"));
                session.setBranchLocation(rs.getString("branch_location"));
                session.setLessonType(rs.getString("lesson_type"));
                session.setStatus(rs.getString("status"));
                sessions.add(session);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return sessions;
    }
}