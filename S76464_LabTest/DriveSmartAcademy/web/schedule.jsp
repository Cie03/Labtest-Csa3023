<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.drivesmart.bean.SessionBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Dashboard - DriveSmart</title>
    <style>
        .schedule-container {
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }
        .schedule-container h2 {
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 1.8em;
        }
        .schedule-container .subtitle {
            color: #7f8c8d;
            margin-bottom: 25px;
            font-size: 0.95em;
        }
        .stats {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }
        .stats .stat-item {
            background: #f8f9fa;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 0.95em;
            border-left: 4px solid #3498db;
        }
        .stats .stat-item.completed {
            border-left-color: #2ecc71;
        }
        .stats .stat-item.total {
            border-left-color: #9b59b6;
        }
        .stats .stat-item strong {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th {
            background: #2c3e50;
            color: white;
            padding: 14px 18px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95em;
        }
        td {
            padding: 12px 18px;
            border-bottom: 1px solid #eee;
        }
        tr:hover {
            background: #f8f9fa;
        }
        .status-badge {
            padding: 5px 16px;
            border-radius: 20px;
            font-size: 0.82em;
            font-weight: 600;
            display: inline-block;
        }
        .status-booked {
            background: #dbeafe;
            color: #1a56db;
        }
        .status-completed {
            background: #d1fae5;
            color: #065f46;
        }
        .no-data {
            text-align: center;
            color: #999;
            padding: 50px 20px;
            font-size: 1.1em;
        }
        .no-data .icon {
            font-size: 3em;
            display: block;
            margin-bottom: 15px;
        }
        .btn-back {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 25px;
            background: #95a5a6;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s ease;
            font-weight: 500;
        }
        .btn-back:hover {
            background: #7f8c8d;
        }
        .table-wrapper {
            overflow-x: auto;
        }
        .session-id {
            color: #95a5a6;
            font-size: 0.9em;
        }
        .refresh-note {
            text-align: right;
            font-size: 0.85em;
            color: #95a5a6;
            margin-top: 10px;
        }
        @media (max-width: 600px) {
            .schedule-container {
                padding: 20px 15px;
            }
            th, td {
                padding: 10px 12px;
                font-size: 0.9em;
            }
            .stats {
                gap: 10px;
            }
            .stats .stat-item {
                padding: 8px 15px;
                font-size: 0.85em;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.html" %>

<div class="container">
    <div class="schedule-container">
        <h2>📊 Centralized Training Schedule</h2>
        <p class="subtitle">Real-time view of all training sessions across all branches</p>
        
        <%
            List<SessionBean> sessions = (List<SessionBean>) request.getAttribute("sessionList");
            if (sessions == null || sessions.isEmpty()) {
        %>
            <div class="no-data">
                <span class="icon">📋</span>
                No training sessions found.<br>
                <span style="font-size: 0.9em; color: #bbb;">Book a session to get started!</span>
            </div>
        <%
            } else {
                int bookedCount = 0;
                int completedCount = 0;
                for (SessionBean s : sessions) {
                    if ("Booked".equalsIgnoreCase(s.getStatus())) {
                        bookedCount++;
                    } else if ("Completed".equalsIgnoreCase(s.getStatus())) {
                        completedCount++;
                    }
                }
        %>
            <div class="stats">
                <span class="stat-item total">
                    📌 <strong>Total:</strong> <%= sessions.size() %> sessions
                </span>
                <span class="stat-item">
                    🔵 <strong>Booked:</strong> <%= bookedCount %>
                </span>
                <span class="stat-item completed">
                    ✅ <strong>Completed:</strong> <%= completedCount %>
                </span>
            </div>
            
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Branch Location</th>
                            <th>Lesson Type</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int counter = 1;
                            for (SessionBean sessionItem : sessions) {
                        %>
                            <tr>
                                <td><span class="session-id"><%= counter++ %></span></td>
                                <td><strong><%= sessionItem.getStudentName() %></strong></td>
                                <td>📍 <%= sessionItem.getBranchLocation() %></td>
                                <td><%= sessionItem.getLessonType() %></td>
                                <td>
                                    <span class="status-badge <%= "Booked".equalsIgnoreCase(sessionItem.getStatus()) ? "status-booked" : "status-completed" %>">
                                        <%= sessionItem.getStatus() %>
                                    </span>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="refresh-note">🔄 Auto-refreshes on each visit</div>
        <%
            }
        %>
        
        <a href="index.jsp" class="btn-back">← Back to Home</a>
    </div>
</div>

<%@ include file="footer.jsp" %>