package model;

public class SessionInstanceObject {
	String instanceID;
	String sessionID;
	String sessionTime;
	String sessionDate;
	String numberOfReturning;
	String numberOfNew;
	String tuteeIDs;
	public String getInstanceID() {
		return instanceID;
	}
	public void setInstanceID(String instanceID) {
		this.instanceID = instanceID;
	}
	public String getSessionID() {
		return sessionID;
	}
	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}
	public String getSessionTime() {
		return sessionTime;
	}
	public void setSessionTime(String sessionTime) {
		this.sessionTime = sessionTime;
	}
	public String getSessionDate() {
		return sessionDate;
	}
	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
	}
	public String getNumberOfReturning() {
		return numberOfReturning;
	}
	public void setNumberOfReturning(String numberOfReturning) {
		this.numberOfReturning = numberOfReturning;
	}
	public String getNumberOfNew() {
		return numberOfNew;
	}
	public void setNumberOfNew(String numberOfNew) {
		this.numberOfNew = numberOfNew;
	}
	public String getTuteeIDs() {
		return tuteeIDs;
	}
	public void setTuteeIDs(String tuteeIDs) {
		this.tuteeIDs = tuteeIDs;
	}
}
