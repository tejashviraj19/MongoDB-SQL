import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CRUD_Test {
  public static void main(String[] args){
    CRUD_Test objTest = new CRUD_Test();

    objTest.create_data("1","Shubham","shubham@gmail.com");
    objTest.create_data("2","Shubham","shubhamraj@gmail.com");

  }

  public void create_data(String sl_no, String name, String email){
    DB_Connection obj_DB_Connection = new DB_Connection();
    Connection connection = obj_DB_Connection.connection();
    PreparedStatement ps = null;
    try{
      
      ps = connection.prepareStatement( "insert into user(sl_no, name, email) values (?,?,?)");
      ps.setString(1,sl_no);
      ps.setString(2,name);
      ps.setString(3,email);
      System.out.println(ps);
      ps.executeUpdate();
    } catch (Exception e){
      System.out.println(e);
    }
  }
}
