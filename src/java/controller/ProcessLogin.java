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
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProcessLogin", urlPatterns = {"/login"})
public class ProcessLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	
	RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
	    dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User user = UserDAO.checkLogin(username, password);
	if(user != null){
	    HttpSession session = request.getSession();
	    session.setAttribute("user", user);
	    response.sendRedirect("./home?page=1");
	}
	else{
	    String message = "Incorrect username or password. <br>Please try again.";
	    request.setAttribute("message", message);
	    request.setAttribute("username", username);
	    request.setAttribute("password", password);
	    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
	    dis.forward(request, response);
	}
    }

    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
