package com.drivesmart.servlet;

import com.drivesmart.bean.SessionBean;
import com.drivesmart.dao.SessionDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookSessionServlet")
public class BookSessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String studentName = request.getParameter("student_name");
        String branchLocation = request.getParameter("branch_location");
        String lessonType = request.getParameter("lesson_type");
        
        SessionBean session = new SessionBean();
        session.setStudentName(studentName);
        session.setBranchLocation(branchLocation);
        session.setLessonType(lessonType);
        session.setStatus("Booked");
        
        SessionDAO dao = new SessionDAO();
        boolean success = dao.bookSession(session);
        
        response.sendRedirect("ScheduleServlet");
    }
}