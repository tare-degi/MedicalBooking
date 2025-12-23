package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Doctor;

public class DoctorDAO {
    private Connection conn;

    public DoctorDAO() {
        conn = DBConnection.getConnection();
    }

    
    public Doctor login(String email, String password) {
        try {
            String sql = "SELECT * FROM doctors WHERE email=? AND password=SHA2(?, 256) AND is_active=TRUE";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("full_name"));
                d.setEmail(rs.getString("email"));
                d.setSpecialization(rs.getString("specialization"));
                return d;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void addDoctor(Doctor doctor) {
    String sql = "INSERT INTO doctors (full_name, email, specialization, phone, is_active) VALUES (?, ?, ?, ?, ?)";
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, doctor.getFullName());
        ps.setString(2, doctor.getEmail());
        ps.setString(3, doctor.getSpecialization());
        ps.setString(4, doctor.getPhone());
        ps.setBoolean(5, true); // new doctor is active by default
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    
    
    // Get all active doctors
    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        try {
            String sql = "SELECT * FROM doctors WHERE is_active = TRUE";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("full_name"));
                d.setSpecialization(rs.getString("specialization"));
                d.setDepartmentId(rs.getInt("department_id"));
                d.setPhone(rs.getString("phone"));
                d.setConsultationFee(rs.getDouble("consultation_fee"));
                d.setAvailableDays(rs.getString("available_days"));
                d.setStartTime(rs.getTime("start_time"));
                d.setEndTime(rs.getTime("end_time"));
                doctors.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doctors;
    }
    
    
    public Doctor getDoctorById(int id) {
    Doctor d = null;
    String sql = "SELECT * FROM doctors WHERE id=?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            d = new Doctor();
            d.setId(rs.getInt("id"));
            d.setFullName(rs.getString("full_name"));
            d.setEmail(rs.getString("email"));
            d.setSpecialization(rs.getString("specialization"));
            d.setPhone(rs.getString("phone"));
            d.setActive(rs.getBoolean("is_active"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return d;
}

   public boolean setDoctorActiveStatus(int doctorId, boolean isActive) {
    String sql = "UPDATE doctors SET is_active=? WHERE id=?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setBoolean(1, isActive);
        ps.setInt(2, doctorId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


}
