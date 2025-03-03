package com.icbt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginController
 */

public class AdminLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcoded admin credentials (use a secure method in real-world apps)
        if ("admin".equals(username) && "admin123".equals(password)) {
            // Create session for the logged-in admin
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);  // Store admin username in session

            // Forward to Admin Dashboard (use forward instead of redirect)
            request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/adminhome.jsp").forward(request, response);

        } else {
            // Invalid login, send an error message
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // 401 Unauthorized
            response.getWriter().write("Invalid admin username or password");

            // Optionally, forward to the login page
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/LoginPage.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false); // Avoid creating a new session
            if (session != null) {
                session.invalidate();  // Destroy session
            }
            response.sendRedirect("WEB-INF/view/CustomerDashboard/LoginPage.jsp"); // Redirect to login page
        }
    }
}
