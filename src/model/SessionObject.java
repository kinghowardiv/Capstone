package model;

public class SessionObject {
	String sessionID;
	String courseID;
	String instructorID;
	String tutorUsername;
	String description;
	

	public String getSessionID() {
		return sessionID;
	}
	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}
	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public String getInstructorID() {
		return instructorID;
	}
	public void setInstructorID(String instructorID) {
		this.instructorID = instructorID;
	}
	public String getTutorUsername() {
		return tutorUsername;
	}
	public void setTutorUsername(String tutorUsername) {
		this.tutorUsername = tutorUsername;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
