package controller;

import dao.AdminDAO;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        Admin admin = dao.login(email, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentAdmin", admin);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("adminLogin.jsp?error=1");
        }
    }
}
