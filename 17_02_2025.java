// Placeholder for 17-02-2025.java
package university.management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    public static void main(String[] args) {
        DatabaseConnector connector = new DatabaseConnector();
        System.out.println("Connection status: " + (connector.getConnection() != null ? "Success" : "Failed"));
    }

    public Connection getConnection() {
        final String DB_URL = "jdbc:mysql://localhost:3306/university_db";
        final String USER = "admin";
        final String PASS = "securepassword123";
        
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Connection failed: " + e.getMessage());
        }
        return connection;
    }
}
