package controller;

import java.awt.event.MouseListener;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.CheckLogin_BO;
import model.Bean.Account;


/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public CheckLogin() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		CheckLogin_BO checkLogin_BO = new CheckLogin_BO();
		String mess ="Please enter all information!!";
		if (username.equals("") ) {
			mess="Please enter username";
			request.setAttribute("mess", mess);
			destination = "/Login.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}else {
			if(password.equals("")) {
				mess="Please enter password";
			
			request.setAttribute("mess", mess);
			destination = "/Login.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			if (!checkLogin_BO.isExistUser(username)) {
				mess="This username does not exist!!!";
				request.setAttribute("mess", mess);
				destination = "/Login.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
				
			}else {
			
			if (checkLogin_BO.isValidUser(username, password)) {
				Account account = checkLogin_BO.getAccount(username);
				request.getSession().setAttribute("account", account);
				response.sendRedirect("main.jsp");
			} else {
				mess="Please enter correct password";
				request.setAttribute("mess", mess);
				destination = "/Login.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}}}
		}
	}
}
