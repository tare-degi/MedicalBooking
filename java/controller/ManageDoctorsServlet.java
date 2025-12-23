package controller;

import dao.DoctorDAO;
import model.Admin;
import model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ManageDoctorsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Admin admin = (Admin) session.getAttribute("currentAdmin");

        if (admin == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        DoctorDAO dao = new DoctorDAO();
        List<Doctor> doctors = dao.getAllDoctors();

        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("manageDoctors.jsp").forward(request, response);
    }
}
