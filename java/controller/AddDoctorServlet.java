package controller;

import dao.DoctorDAO;
import model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class AddDoctorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone");

        // Create Doctor object
        Doctor doctor = new Doctor();
        doctor.setFullName(fullName);
        doctor.setEmail(email);
        doctor.setSpecialization(specialization);
        doctor.setPhone(phone);

        // Add doctor to database
        DoctorDAO dao = new DoctorDAO();
        dao.addDoctor(doctor);

        // Set success message in session
        HttpSession session = request.getSession();
        session.setAttribute("msg", "Doctor added successfully!");

        // Redirect to ManageDoctorsServlet
        response.sendRedirect("ManageDoctorsServlet");
    }
}
