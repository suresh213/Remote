package com.remote.control;


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import com.remote.model.*;
import java.io.InputStream;
import java.sql.*;
import com.remote.util.*;
@MultipartConfig
/**
 * 
 * Servlet implementation class ProfilePictureUpload
 */
@WebServlet("/ProfilePictureUpload")
public class ProfilePictureUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilePictureUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action=request.getParameter("action");
		System.out.println(action);
		int result = 0;
		Connection conn = null;
		
//		System.out.println("img --- "+part);
	    conn=(Connection) DBConnection.getConnection();
	    HttpSession session=request.getSession();
		UserModel user = (UserModel)session.getAttribute("user");
		String email = user.getEmail();
		
		if(action.equalsIgnoreCase("image")){
			Part part = request.getPart("profile_img");
			if(part != null){
				try{
				    
				    PreparedStatement ps =conn.prepareStatement("update users set profile_picture=? where email=?");
				    InputStream is = part.getInputStream();
				    ps.setBlob(1, is);
				    ps.setString(2, email);
				    result = ps.executeUpdate();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			else{
				System.out.println("No image");
			}
			if(result>0)
			{
				System.out.println("insert successfully");
			}
			else
			{
				System.out.println("not successful");
			}
		}
		else if(action.equalsIgnoreCase("file")){
			
			Part part = request.getPart("fileupload");
			System.out.println("part---->"+part);
			if(part != null){
				try{
				    
				    PreparedStatement ps =conn.prepareStatement("insert into files(name,file) values(?,?)");
				    InputStream is = part.getInputStream();
				    ps.setString(1, request.getParameter("filename"));
				    ps.setBlob(2, is);
				    result = ps.executeUpdate();
				}
				catch(Exception e){
					e.printStackTrace();
				}
				if(result>0)
				{
					System.out.println("file insert successfully");
				}
				else
				{
					System.out.println("file not inserted");
				}
			}
			else{
				System.out.println("No file");
			}
			
		}
		response.sendRedirect("admin_files.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
