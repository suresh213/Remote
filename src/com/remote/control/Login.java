package com.remote.control;
  
import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.model.*;
import com.remote.util.*;
import com.remote.dao.*;
import java.util.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String err = null;
		HttpSession session = request.getSession();
		try {
			// check email already exists in database
				UserModel user = UserDAO.getStudentByEmail(email);
//			System.out.print(user.isEmpty());
			
			
			if(user!=null) {
				
				String	name=user.getName();
				String	dbPassword = user.getPassword();
				
				
				HashPassword hashPassword = new HashPassword();
				boolean isAuthenticated = hashPassword.login(password,dbPassword);
				System.out.println("isAutenticated ---" + isAuthenticated);
				System.out.println(user.getIswhitelist());
				if(user.getIswhitelist()==1){
					response.sendRedirect("whitelistError.jsp");
				}
				else
				{
					if(isAuthenticated==true){
						response.setContentType("text/html"); 
						
						session.setAttribute("user", user);
						
						if(email.equals("admin@gmail.com")){
							StatusDAO.makestatusOnline(email);
							response.sendRedirect("admin_home.jsp");
						}else{
								StatusDAO.makestatusOnline(email);
								response.sendRedirect("remote_home.jsp");
							}
						}
					}
				}
				else{
					System.out.println("user not loggin in");
					err="Invalid Credentials";
					session.setAttribute("err",err);
					response.sendRedirect("index.jsp");
				}
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
