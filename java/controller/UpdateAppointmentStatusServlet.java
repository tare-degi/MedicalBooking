package controller;

import dao.AppointmentDAO;
import model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateAppointmentStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Doctor doctor = (Doctor) session.getAttribute("currentDoctor");

        if (doctor == null) {
            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        int appointmentId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status"); // CONFIRMED or REJECTED

        AppointmentDAO dao = new AppointmentDAO();
        dao.updateAppointmentStatus(appointmentId, status);

        response.sendRedirect("DoctorDashboardServlet");
    }
}
