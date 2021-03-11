import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        System.out.println("-------- Start Connection ------------");
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found !!");
            return;
        }
        System.out.println("MySQL JDBC Driver Registered!");
        Connection connection = null;
        try {
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/book?characterEncoding=utf8", "root", "Minhtrung1772k1");
            System.out.println("Login Successful!");
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console"  + e);
        }
    }
}
