package com.remote.control;

import java.io.IOException;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.StatusDAO;
import com.remote.dao.UserDAO;
import com.remote.model.UserModel;
import com.remote.util.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String conpass = request.getParameter("conpass");
		
		if(password.equals(conpass))
		{
			try {
// 			check email already exists in database
//			if(UserDAO.getStudentByEmail(email)==0){
				HashPassword hashPassword = new HashPassword();
				String hashedPassword = hashPassword.signup(password);
				UserModel user = new UserModel();
				
				user.setName(name);
				user.setEmail(email);
				user.setPassword(hashedPassword);
				
				int status = UserDAO.save(user);
				if(status>0){
					StatusDAO.createTable(email, name);
					System.out.println("updated");
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					StatusDAO.makestatusOnline(email);
					response.sendRedirect("remote_home.jsp");
				}
				else{
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}	
//			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			System.out.println("password doesnt match");
		}
	}

}
