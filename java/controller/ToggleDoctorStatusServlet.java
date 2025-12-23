package controller;

import dao.DoctorDAO;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class ToggleDoctorStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Admin admin = (Admin) session.getAttribute("currentAdmin");
        if (admin == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int doctorId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        DoctorDAO dao = new DoctorDAO();

        if ("activate".equalsIgnoreCase(action)) {
            dao.setDoctorActiveStatus(doctorId, true);
        } else if ("deactivate".equalsIgnoreCase(action)) {
            dao.setDoctorActiveStatus(doctorId, false);
        }

        response.sendRedirect("ManageDoctorsServlet");
    }
}
