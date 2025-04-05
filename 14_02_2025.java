import java.sql.*;

public class UniversityDBConnector {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver registered successfully");
            
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/university_db", "admin", "admin@123");
            System.out.println("Database connection established");
            
            Statement statement = conn.createStatement();
            System.out.println("Statement created");
            
            ResultSet resultSet = statement.executeQuery("SELECT * FROM learners");
            
            // Process results
            while(resultSet.next()) {
                System.out.println(resultSet.getInt(1) + "\t" + 
                                 resultSet.getString(2) + "\t" + 
                                 resultSet.getString(3));
            }
            
            conn.close();
            System.out.println("Connection closed");
        }
        catch(Exception e) {
            System.out.println("Database operation error: " + e.getMessage());
        }
    }
}
