package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBAccess;
import model.DBConnection;
import model.SessionObject;

public class otherController {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		DBConnection dbcon = new DBConnection();
		DBAccess dba = new DBAccess();
		Connection conn = dbcon.getConnection();
		String courseID = "";
		ArrayList<SessionObject> sesObjs = dba.getSession(conn, courseID);
		request.setAttribute("Array List", sesObjs);
	}
}
