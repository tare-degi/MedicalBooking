package controller;

import dao.AppointmentDAO;
import model.Appointment;
import model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DoctorDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("currentDoctor") == null) {
            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        Doctor doctor = (Doctor) session.getAttribute("currentDoctor");

        AppointmentDAO dao = new AppointmentDAO();
        List<Appointment> appointments =
                dao.getAppointmentsByDoctor(doctor.getId());

        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("doctorDashboard.jsp")
               .forward(request, response);
    }
}
