package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.DBAccess;
import model.DBConnection;
import model.SessionObject;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet" )
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		DBConnection dbcon = new DBConnection();
//		DBAccess dba = new DBAccess();
//		Connection conn;
//					
//					String courseID = "";
//					try {
//						conn = dbcon.getConnection();
//						ArrayList<SessionObject> sesObj = dba.getSession(conn, courseID);
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//				}
					SessionObject sesObjs = new SessionObject();
//					object.setCourseID("courseID");
					sesObjs.setDescription("description");
					sesObjs.setCourseID("276");
					sesObjs.setInstructorID("David Voorhees");
					sesObjs.setTutorUsername("Howie");
					String description = sesObjs.getDescription();
					String courseID = sesObjs.getCourseID();
					String instructor = sesObjs.getInstructorID();
					String tutor = sesObjs.getTutorUsername();
							

					
				PrintWriter out = new PrintWriter(response.getWriter());
				Gson gson = new Gson();
				String jsonInfo = gson.toJson(sesObjs);
				
				out.println(jsonInfo);
	
	}
    


}
