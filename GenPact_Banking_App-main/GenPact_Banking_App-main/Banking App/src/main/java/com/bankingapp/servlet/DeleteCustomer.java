package com.bankingapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bankingapp.dao.AdminLoginDAO;


@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	
	private static final String DELETE_CUSTOMER_SQL = "DELETE FROM Customer where account_no = ?";
	    
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			int account_no = Integer.parseInt(request.getParameter("accountno"));
			
			AdminLoginDAO admin = new AdminLoginDAO();
			try(Connection connection = admin.getConnection();
					PreparedStatement CustomerDeleteStmt = connection.prepareStatement(DELETE_CUSTOMER_SQL)){
				
				CustomerDeleteStmt.setInt(1, account_no);
				
				int deleted =  CustomerDeleteStmt.executeUpdate();
				
				if(deleted > 0) {
					response.getWriter().println("Customer Deleted Successfully");
				}
				else {
					response.getWriter().println("Customer Deletion Failed");
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
}
