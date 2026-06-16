<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive Smart - Home</title>
    <style>
        .welcome-section {
            text-align: center;
            padding: 40px 20px 20px;
        }
        .welcome-section h2 {
            font-size: 2.2em;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .welcome-section p {
            font-size: 1.1em;
            color: #7f8c8d;
        }
        .nav-container {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            margin: 40px 0 20px;
        }
        .nav-card {
            background: white;
            padding: 45px 35px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            text-align: center;
            width: 280px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-decoration: none;
            color: #2c3e50;
            border: 2px solid transparent;
        }
        .nav-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.15);
        }
        .nav-card .icon {
            font-size: 3.5em;
            margin-bottom: 15px;
            display: block;
        }
        .nav-card h3 {
            font-size: 1.6em;
            margin-bottom: 10px;
            font-weight: 600;
        }
        .nav-card p {
            font-size: 0.95em;
            color: #7f8c8d;
            line-height: 1.5;
        }
        .nav-card.booking {
            border-color: #3498db;
        }
        .nav-card.booking:hover {
            border-color: #2980b9;
        }
        .nav-card.schedule {
            border-color: #2ecc71;
        }
        .nav-card.schedule:hover {
            border-color: #27ae60;
        }
        .badge {
            display: inline-block;
            background: #ecf0f1;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8em;
            margin-top: 10px;
            color: #7f8c8d;
        }
        @media (max-width: 600px) {
            .nav-card {
                width: 100%;
                max-width: 320px;
                padding: 30px 20px;
            }
            .header h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.html" %>

<div class="container">
    <div class="welcome-section">
        <h2>Welcome to DriveSmart Academy</h2>
        <p>Your centralized platform for managing driving lessons across all branches</p>
    </div>
    
    <div class="nav-container">
        <a href="book_session.jsp" class="nav-card booking">
            <span class="icon">📝</span>
            <h3>Book Session</h3>
            <p>Register for a new driving lesson at any branch location nationwide</p>
            <span class="badge">New Booking</span>
        </a>
        
        <a href="ScheduleServlet" class="nav-card schedule">
            <span class="icon">📊</span>
            <h3>View Schedule</h3>
            <p>Access real-time centralized schedule of all training sessions</p>
            <span class="badge">Live Updates</span>
        </a>
    </div>
</div>

<%@ include file="footer.jsp" %>