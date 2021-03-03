package com.remote.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.remote.dao.StatusDAO;
import com.remote.model.UserModel;

/**
 * Servlet implementation class Break
 */
@WebServlet("/Break")
public class Break extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Break() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		String action = request.getParameter("action");
		System.out.println("action " +action);
		HttpSession session=request.getSession();
		UserModel user =  (UserModel) session.getAttribute("user");
		System.out.print(user);
	
		try{
			if(action !=null && action.equalsIgnoreCase("breaktea")){
				StatusDAO.makestatusOffline(user.getEmail());
				session.setAttribute("studentOfflineStatus", true);
				response.sendRedirect("remote_home.jsp");
			}
			
			if(action !=null && action.equalsIgnoreCase("endtea")){
				StatusDAO.makestatusOnline(user.getEmail());
				session.setAttribute("studentOfflineStatus", false);
				response.sendRedirect("remote_home.jsp");
			}
			
			
			if(action !=null && action.equalsIgnoreCase("breaklunch")){
				StatusDAO.makestatusOffline(user.getEmail());
				session.setAttribute("lunchbreak", true);
				response.sendRedirect("remote_home.jsp");
			}
		
			if(action !=null && action.equalsIgnoreCase("endlunch")){
				StatusDAO.makestatusOnline(user.getEmail());
				session.setAttribute("lunchbreak", false);
				response.sendRedirect("remote_home.jsp");
			}
		} catch (Exception e) {
            e.printStackTrace();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserModel user=  (UserModel) session.getAttribute("user");
		System.out.print(user);
		doGet(request,response);
	}
}
