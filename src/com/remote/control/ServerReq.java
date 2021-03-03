package com.remote.control;


import com.remote.util.*;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ServerReq
 */
@WebServlet("/ServerReq")
public class ServerReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerReq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		try { 
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement st = con.prepareStatement("insert into requesttable(`name`, `email`, `department`, `purpose`, `fromDate`, `toDate`, `reason`) values(?, ?, ?, ?, ?, ?, ?)"); 
	  
	            st.setString(1, request.getParameter("name")); 
	            st.setString(2, request.getParameter("email")); 
	            st.setString(3, request.getParameter("department")); 
	            st.setString(4, request.getParameter("purpose")); 
	            st.setString(5, request.getParameter("fromDate")); 
	            st.setString(6, request.getParameter("toDate")); 
	            st.setString(7, request.getParameter("discription")); 
	            st.executeUpdate(); 
	            st.close(); 
	            con.close(); 
	            response.sendRedirect("remote_request.jsp");
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        } 
	  
		
	}

}
