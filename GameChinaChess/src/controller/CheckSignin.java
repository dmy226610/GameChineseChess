package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO.CheckLogin_BO;
import model.Bean.Account;

/**
 * Servlet implementation class CheckSignin
 */
@WebServlet("/CheckSignin")
public class CheckSignin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckSignin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String destination = null;
		String susername = request.getParameter("Susername");
		String spassword = request.getParameter("Spassword");
		String spasswordc = request.getParameter("Spasswordc");
		String gmail = request.getParameter("gmail");
		String mess = "Please enter all information!!";

		String regex = "^[a-zA-Z]+[a-zA-Z0-9]*@{1}[a-zA-Z]+mail.com$";
		CheckLogin_BO checkLogin_BO = new CheckLogin_BO();
		if (susername.equals("") || spassword.equals("") || spassword.equals("") || gmail.equals("")) {
			// thiếu dữ liệu
			mess = "Please enter all information";
			request.setAttribute("mess", mess);
			destination = "/Signin.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			if (!Pattern.matches(regex, gmail)) {
				mess = "Please enter correct mail";
				request.setAttribute("mess", mess);
				// gmail ko hợp lệ
				destination = "/Signin.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				if (!spassword.equals(spasswordc)) {
					mess = "Password does not match the re-enter password";
					request.setAttribute("mess", mess);
					destination = "/Signin.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);}else {
					// pass có đúng ko
					if (checkLogin_BO.isExistUser(susername)) {
						// đã tồn tại username
						mess = "Username already exists";
						request.setAttribute("mess", mess);
						destination = "/Signin.jsp";
						RequestDispatcher rr = getServletContext().getRequestDispatcher(destination);
						rr.forward(request, response);
					} else {
						checkLogin_BO.AddAccount(susername, spassword, gmail);
						destination = "/Login.jsp";
						RequestDispatcher rm = getServletContext().getRequestDispatcher(destination);
						rm.forward(request, response);
					}
				} 
			}
		}
	}

}
