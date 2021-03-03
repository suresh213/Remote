package com.remote.control;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;

import com.mysql.jdbc.Connection;
import com.remote.model.*;
import com.remote.util.*;
/**
 * Servlet implementation class Attendence
 */
@WebServlet("/Attendence")
public class Attendence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Attendence() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------Attendence");
		HttpSession session=request.getSession();
		UserModel user=  (UserModel) session.getAttribute("user");
		String action = request.getParameter("action");
		int status=0;
		try {
			Connection conn = (Connection) DBConnection.getConnection();
//			PreparedStatement ps = conn.prepareStatement("select * from attendence where email=?");
//			ps.setString(1, user.getEmail());
//			ResultSet rs = ps.executeQuery();

//			if(rs.next()==false){
//				ps = conn.prepareStatement("insert into attendence(email,attendence_count,remaining_count) values(?,?,?)");
//				ps.setString(1, user.getEmail());
//				ps.setInt(2, 1);
//				ps.setInt(3, 5);
//				status = ps.executeUpdate();
//				System.out.print("Inserted ----"+status);
//			}
			if(action.equalsIgnoreCase("present")){
				PreparedStatement ps = conn.prepareStatement("update attendance set attendence_count=attendence_count+1 ,remaining_count=remaining_count-1  where email=?");
				ps.setString(1, user.getEmail());
				status = ps.executeUpdate();
				System.out.print("Updated ----"+status);
			}
			else if(action.equalsIgnoreCase("absent")){
				PreparedStatement ps = conn.prepareStatement("update attendance set remaining_count=remaining_count-1  where email=?");
				ps.setString(1, user.getEmail());
				status = ps.executeUpdate();
				System.out.print("Updated ----"+status);
			}
			else if(action.equalsIgnoreCase("get")){
				PreparedStatement ps = conn.prepareStatement("select * from attendance where email=?");
				ps.setString(1, user.getEmail());
				ResultSet rs = ps.executeQuery();
				int result=0;
				while(rs.next()){
					result = rs.getInt("remaining_count");
				}
				session.setAttribute("remainingAttendenceCount", result);
				System.out.print("got it ----"+status);
			}
			else if(action.equalsIgnoreCase("getattendence")){
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from attendance");
                 
                 List<AttendanceModel> students = new ArrayList<AttendanceModel>();
		           while(rs.next()){
		        	   AttendanceModel a = new AttendanceModel();
		        	   a.setName(rs.getString("name"));
			           	a.setEmail(rs.getString("email"));
			           	a.setAttendenceCount(rs.getInt("attendance_count"));
			           	students.add(a);
		           }
	          			
		           request.setAttribute("attendence", students);
				   request.getRequestDispatcher("admingetattendance.jsp").forward(request, response);

				System.out.print("recieved");
			}
			
			
//			response.sendRedirect("profile.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
