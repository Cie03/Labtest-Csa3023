<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Session - DriveSmart</title>
    <style>
        .form-container {
            background: white;
            max-width: 580px;
            margin: 0 auto;
            padding: 40px 45px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        .form-container h2 {
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 1.8em;
        }
        .form-container .subtitle {
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 0.95em;
        }
        .form-group {
            margin-bottom: 22px;
        }
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #2c3e50;
            font-size: 0.95em;
        }
        .form-group label .required {
            color: #e74c3c;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1em;
            transition: border-color 0.3s ease;
            background: #fafafa;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #3498db;
            outline: none;
            background: white;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }
        .btn-submit {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        }
        .btn-submit:active {
            transform: translateY(0);
        }
        .btn-back {
            display: inline-block;
            margin-top: 15px;
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
        .form-footer {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        @media (max-width: 600px) {
            .form-container {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.html" %>

<div class="container">
    <div class="form-container">
        <h2>📝 Book a Training Session</h2>
        <p class="subtitle">Fill in the details below to register for a driving lesson</p>
        
        <form method="POST" action="BookSessionServlet">
            <div class="form-group">
                <label for="student_name">Student Name <span class="required">*</span></label>
                <input type="text" id="student_name" name="student_name" required 
                       placeholder="Enter your full name">
            </div>
            
            <div class="form-group">
                <label for="branch_location">Branch Location <span class="required">*</span></label>
                <select id="branch_location" name="branch_location" required>
                    <option value="">-- Select a branch --</option>
                    <option value="Kuala Lumpur">📍 Kuala Lumpur</option>
                    <option value="Penang">📍 Penang</option>
                    <option value="Johor">📍 Johor</option>
                    <option value="Selangor">📍 Selangor</option>
                    <option value="Perak">📍 Perak</option>
                    <option value="Sabah">📍 Sabah</option>
                    <option value="Sarawak">📍 Sarawak</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="lesson_type">Lesson Type <span class="required">*</span></label>
                <select id="lesson_type" name="lesson_type" required>
                    <option value="">-- Select lesson type --</option>
                    <option value="Manual Car">🚗 Manual Car</option>
                    <option value="Automatic Car">🚙 Automatic Car</option>
                    <option value="Motorcycle">🏍️ Motorcycle</option>
                </select>
            </div>
            
            <button type="submit" class="btn-submit">✅ Book Session</button>
        </form>
        
        <div class="form-footer">
            <a href="index.jsp" class="btn-back">← Back to Home</a>
            <span style="font-size: 0.85em; color: #95a5a6;">All fields are required</span>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>