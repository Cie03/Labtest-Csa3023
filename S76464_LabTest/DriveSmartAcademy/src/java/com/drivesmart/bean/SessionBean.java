
package com.drivesmart.bean;

public class SessionBean {
    private int sessionId;
    private String studentName;
    private String branchLocation;
    private String lessonType;
    private String status;

    // Empty constructor
    public SessionBean() {}

    // Parameterized constructor
    public SessionBean(int sessionId, String studentName, String branchLocation, 
                       String lessonType, String status) {
        this.sessionId = sessionId;
        this.studentName = studentName;
        this.branchLocation = branchLocation;
        this.lessonType = lessonType;
        this.status = status;
    }

    // Getters
    public int getSessionId() {
        return sessionId;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getBranchLocation() {
        return branchLocation;
    }

    public String getLessonType() {
        return lessonType;
    }

    public String getStatus() {
        return status;
    }

    // Setters
    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setBranchLocation(String branchLocation) {
        this.branchLocation = branchLocation;
    }

    public void setLessonType(String lessonType) {
        this.lessonType = lessonType;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}