package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBAccess {
	
	//DESCRIPTION: This method gets the session information from the database and puts it into an array list of SessionObject 
	//PRE: This method takes the Connection conn
	//POST: This method returns an array list of SessionObject's with the information from the database
	public ArrayList<SessionObject> getSession(Connection conn, String courseID) throws SQLException{
		//Create variables
		Statement st = null;
		String query = "SELECT * FROM SESSION_TABLE WHERE CourseID = '" + courseID + "'";
		SessionObject ses = new SessionObject();
		ArrayList<SessionObject> sessionArray = new ArrayList<SessionObject>();
		try{
			//Connect to the database
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			//Parse through every row and get its information
			while(rs.next()){				
				//Put the information in the ses object
				ses.setSessionID(rs.getString("ID"));
				ses.setCourseID(rs.getString("CourseID"));
				ses.setInstructorID(rs.getString("InstructorID"));
				ses.setTutorUsername(rs.getString("TutorUsername"));
				ses.setDescription(rs.getString("Description"));
				
				//Store the object in the array
				sessionArray.add(ses);
			}
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
				if (st != null)
					st.close();
		}
		
		return sessionArray;
	}
	//DESCRIPTION: This method gets the session instance information from the database and puts it into an array list of SessionInstanceObject
	//PRE: This method takes the Connection conn
	//POST: This method returns an array list of SessionInstanceObjects with information from the database
	public ArrayList<SessionInstanceObject> getSessionInstance(Connection conn, String sessionDate) throws SQLException{
		//Create variables
				Statement st = null;
				String query = "SELECT * FROM SessionInstance WHERE SessionDate = '" + sessionDate + "'";
				SessionInstanceObject sesInstance = new SessionInstanceObject();
				ArrayList<SessionInstanceObject> instanceArray = new ArrayList<SessionInstanceObject>();
				try{
					//Connect to the database
					st = conn.createStatement();
					ResultSet rs = st.executeQuery(query);
					
					//Parse through every row and get its information
					while(rs.next()){
						sesInstance.setInstanceID(rs.getString("InstanceID"));
						sesInstance.setNumberOfNew(rs.getString("NumberOfNew"));
						sesInstance.setNumberOfReturning(rs.getString("NumberOfReturning"));
						sesInstance.setSessionDate(rs.getString("SessionDate"));
						sesInstance.setSessionID(rs.getString("SessionID"));
						sesInstance.setSessionTime(rs.getString("SessionTime"));
						sesInstance.setTuteeIDs(rs.getString("TuteeID"));
						
						//Store the object in the array
						instanceArray.add(sesInstance);
					}
				}
				catch (SQLException e){
					System.out.println(e.getMessage());
				}
				finally{
						if (st != null)
							st.close();
				}
				
				return instanceArray;
	}
	//DESCRIPTION: This method gets the tutee information from the database and puts it into an array list of TuteeObject
	//PRE: This method takes a Connection conn and a username.  The username is used to find the tutee
	//POST: This method returns an array list of TuteeObjects with information from the database
	public ArrayList<TuteeObject> getTutee(Connection conn, String username) throws SQLException{
		//Create variables
		Statement st = null;
		String query = "SELECT * FROM Tutee WHERE TuteeUsername = '" + username + "'";
		TuteeObject tutee = new TuteeObject();
		ArrayList<TuteeObject> tuteeArray = new ArrayList<TuteeObject>();
		try{
			//Connect to the database
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			//Parse through every row and get its information
			while(rs.next()){
				tutee.setTuteeUsername(rs.getString("TuteeUername"));
				tutee.setFirstName(rs.getString("FirstName"));
				tutee.setLastName(rs.getString("LastName"));
				tutee.setClassYear(rs.getString("ClassYear"));
				tutee.setEmail(rs.getString("EmailID"));
				tutee.setSutdentID(rs.getString("StudentID"));
				tutee.setMajor(rs.getString("MajorID"));
				tutee.setSecondMajor(rs.getString("2ndMajorID"));
				
				tuteeArray.add(tutee);
			}
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
				if (st != null)
					st.close();
		}
		
		return tuteeArray;
	}
	//DESCRIPTION: This method gets the tutor informtion from the database and puts it into an array list of TutorObject
	//PRE: This method takes a Connection conn and a username.  The username is used to find the tutor
	//POST: This method returns an array list of TutorObjects with information from the database
	public ArrayList<TutorObject> getTutor(Connection conn, String username) throws SQLException{
		//Create variables
		Statement st = null;
		String query = "SELECT * FROM Tutor WHERE username = '" + username + "'";
		TutorObject tutor = new TutorObject();
		ArrayList<TutorObject> tutorArray = new ArrayList<TutorObject>();
		try{
			//Connect to the database
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			//Parse through every row and get its information
			while(rs.next()){
				tutor.setTutorUsername(rs.getString("TutorUsername"));
				tutor.setFirstName(rs.getString("TutorFirstName"));
				tutor.setLastName(rs.getString("TutorLastName"));
				tutor.setEmail(rs.getString("TutorEmailID"));
				tutor.setSutdentID(rs.getString("StudentID"));
				
				tutorArray.add(tutor);
			}
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
				if (st != null)
					st.close();
		}
		
		return tutorArray;
	}
	//DECRIPTION: This method connects to the database and stores the information from the front end
	//PRE: This method takes a Connection conn and a SessionObject.  The object contains the information the user wants to store
	//POST: This method does not return anything
	public void saveSession(Connection conn, SessionObject session) throws SQLException{
		String query = "INSERT INTO Session (CourseID, InstructorID, TutorUsername, Description)"
				+ "VALUES ('" + session.getCourseID() + "','" + session.getInstructorID() + "','" + session.getTutorUsername() + "','" + session.getDescription() + "')";
		
		
		try (Statement st = conn.createStatement();){
			st.executeQuery(query);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//DECRIPTION: This method connects to the database and stores the information from the front end
	//PRE: This method takes a Connection conn and a SessionInstanceObject.  The object contains the information the user wants to store
	//POST: This method does not return anything
	public void saveSessionInstance(Connection conn, SessionInstanceObject sessionInstance) throws SQLException{
		String query = "INSERT INTO Session (NumberOfNew, NumberOfReturning, SessionDate, SessionID, SessionTime, TuteeID)"
				+ "VALUES ('" + sessionInstance.getNumberOfNew() + "','" + sessionInstance.getNumberOfReturning() + "','" + sessionInstance.getSessionDate() 
				+ "','" + sessionInstance.getSessionID() + "','" + sessionInstance.getSessionTime() + "','" + sessionInstance.getTuteeIDs() + "')";
		
		
		try (Statement st = conn.createStatement();){
			st.executeQuery(query);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//DECRIPTION: This method connects to the database and stores the information from the front end
	//PRE: This method takes a Connection conn and a TuteeObject.  The object contains the information the user wants to store
	//POST: This method does not return anything
	public void saveTutee(Connection conn, TuteeObject tutee) throws SQLException{
		String query = "INSERT INTO Session (TuteeUsername, FirstName, LastName, EmailID, ClassYear, MajorID, 2ndMajorID, StudentID)"
				+ "VALUES ('" + tutee.getTuteeUsername() + "','" + tutee.getFirstName() + "','" + tutee.getLastName() + "','" + tutee.getEmail() 
				+ "'," + tutee.getClassYear() + "','" + tutee.getMajor() + "','" + tutee.getSecondMajor() + "','" + tutee.getSutdentID() + "','" 
				+ "')";
		
		
		try (Statement st = conn.createStatement();){
			st.executeQuery(query);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//DECRIPTION: This method connects to the database and stores the information from the front end
	//PRE: This method takes a Connection conn and a TutorObject.  The object contains the information the user wants to store
	//POST: This method does not return anything
	public void saveSession(Connection conn, TutorObject tutor) throws SQLException{
		String query = "INSERT INTO Session (TutorUsername, TutorFirstName, TutorLastName, TutorEmail, SudentID)"
				+ "VALUES ('" + tutor.getTutorUsername() + "','" + tutor.getFirstName() + "','" + tutor.getLastName() + "','" + tutor.getEmail()
				+ "','" + tutor.getSutdentID()+ "')";
		
		
		try (Statement st = conn.createStatement();){
			st.executeQuery(query);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}
