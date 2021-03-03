package com.remote.control;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.remote.dao.RequestDAO;
import com.remote.util.*;;

/**
 * Servlet implementation class Respond
 */
@WebServlet("/Respond")
public class Respond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Respond() {
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
		String regno = request.getParameter("regno");
		if (request.getParameter("btn_accept") != null) {
			SendMail.successMail(regno);
		    RequestDAO.makestatusDone(regno);
		} else if (request.getParameter("btn_deny") != null) {
			SendMail.denyMail(regno);
		    RequestDAO.makestatusDone(regno);
		}
		request.getRequestDispatcher("/admin_request.jsp").forward(request, response);
	}

}
