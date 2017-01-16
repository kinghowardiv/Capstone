package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBAccess;
import model.DBConnection;
import model.SessionObject;

public class controller extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = new PrintWriter(response.getWriter());
		try{
			DBConnection dbcon = new DBConnection();
			DBAccess dba = new DBAccess();
			Connection conn = dbcon.getConnection();
			String courseID = "";
			ArrayList<SessionObject> sesObjs = dba.getSession(conn, courseID);
			//conn.close
			Gson gson = new Gson();
			String jsonInfo = gson.toJson(sesObjs);
			out.println(jsonInfo);
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
}
