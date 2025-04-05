import java.sql.Connection;
import java.sql.DriverManager;
public class CRUD_Test {
  public static void main(String[] args) {
    DB_Connection obj_DB_Connection = new DB_Connection();
    System.out.println(obj_DB_Connection.connection());
  }
  public Connection connection(){
    Connection connection = null;
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/saturday","root","root");
    } catch(Exception e){
      System.out.println(e);
    }
    return connection;
