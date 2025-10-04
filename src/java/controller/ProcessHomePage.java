/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProcessHomePage", urlPatterns = {"/home"})
public class ProcessHomePage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("user");
//	if(user != null){
	    String brandId = request.getParameter("brand");
	    String sortFeild = request.getParameter("sortFeild");
	    String sortOrder = request.getParameter("sortOrder");
	    String pageStr = request.getParameter("page");
	    int page;
	    if(pageStr == null){
		page = 1;
	    }
	    else {
		page = Integer.parseInt(pageStr);
	    }
	    int pageSize = 8;
	    ArrayList<Product> listProduct = ProductDAO.getProductList(brandId, sortFeild, sortOrder, page, pageSize);
	    
	    int totalItems = ProductDAO.getTotalProducts(brandId);
	    int totalPages = (int)Math.ceil(1.0 * totalItems / pageSize);
	    
	    request.setAttribute("user", user);
	    request.setAttribute("listProduct", listProduct);
	    request.setAttribute("page", page);
	    request.setAttribute("totalPages", totalPages);

	    RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
	    dis.forward(request, response);
//	}
//	else{
//	    response.sendRedirect("./login");
//	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
