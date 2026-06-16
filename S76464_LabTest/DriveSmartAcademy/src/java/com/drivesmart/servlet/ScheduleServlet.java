package com.drivesmart.servlet;

import com.drivesmart.bean.SessionBean;
import com.drivesmart.dao.SessionDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        SessionDAO dao = new SessionDAO();
        List<SessionBean> sessions = dao.getAllSessions();
        
        request.setAttribute("sessionList", sessions);
        request.getRequestDispatcher("schedule.jsp").forward(request, response);
    }
}