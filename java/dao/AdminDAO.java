package dao;

import model.Admin;
import java.sql.*;

public class AdminDAO {
    private Connection conn;

    public AdminDAO() {
        conn = DBConnection.getConnection(); // Make sure DBConnection works
    }

    public Admin login(String email, String password) {
        String sql = "SELECT * FROM admins WHERE email=? AND password=SHA2(?, 256)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin a = new Admin();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
