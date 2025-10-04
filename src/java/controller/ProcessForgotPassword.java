/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProcessForgotPassword", urlPatterns = {"/forgot-password"})
public class ProcessForgotPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
	
	RequestDispatcher dis = request.getRequestDispatcher("forgot-password.jsp");
	dis.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
	
	String action = request.getParameter("action");
	if(action.equals("request-reset")){
	    String username = request.getParameter("username");
	    User user = UserDAO.findUserByUsername(username);
	    if(user != null){
		request.setAttribute("userId", user.getId());
		RequestDispatcher dis = request.getRequestDispatcher("reset-password.jsp");
		dis.forward(request, response);
	    }
	    else{
		String message = "Username does not exist.";
		request.setAttribute("message", message);
		RequestDispatcher dis = request.getRequestDispatcher("forgot-password.jsp");
		dis.forward(request, response);
	    }
	}
	else if(action.equals("reset-password")){
	    String userId = request.getParameter("userId") + "";
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirm-password");
	    if(!password.equals(confirmPassword)){
		String message = "Password confirmation does not match.";
		request.setAttribute("message", message);
		RequestDispatcher dis = request.getRequestDispatcher("reset-password.jsp");
		dis.forward(request, response);
	    }
	    else{
		System.out.println(userId + " " + password);
		boolean checkReset = UserDAO.resetPassword(userId, password);
		if(checkReset == true){
		    RequestDispatcher dis = request.getRequestDispatcher("changed-password.jsp");
		    dis.forward(request, response);
		}
		else{
		    System.out.println("reset fail");
		}
	    }
	}
    }

    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
