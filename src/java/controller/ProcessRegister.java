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
import utils.UsernameUtil;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProcessRegister", urlPatterns = {"/register"})
public class ProcessRegister extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
	dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	String firstName = request.getParameter("first-name");
	String lastName = request.getParameter("last-name");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String confirmPassword = request.getParameter("confirm-password");
	String gender = request.getParameter("gender");
	String message = "";
	if(!password.equals(confirmPassword)){
	    message = "Password confirmation does not match.";
	}
	if(!UsernameUtil.checkUsername(username)){
	    message = "Username contains invalid characters.";
	}
	User user1 = UserDAO.findUserByEmail(email);   
	if(user1 != null){
	    message = "Email is already registered.";
	}
	User user2 = UserDAO.findUserByUsername(username);   
	if(user2 != null){
	    message = "Username is already taken.";
	}
	if(message.equals("")){
	    boolean checkAddUser = UserDAO.addUser(firstName, lastName, username, email, password, gender);
	    if(checkAddUser){
		RequestDispatcher dis = request.getRequestDispatcher("success-register.jsp");
		dis.forward(request, response);
	    }
	    else{
		System.out.println("fail");
	    }
	}
	else{
	    request.setAttribute("message", message);
	    RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
	    dis.forward(request, response);
	}
    }
    
    
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
