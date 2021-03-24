import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
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
        Connection connection = null; //Why
        try {
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/book?characterEncoding=utf8", "root", "Minhtrung1772k1");
            System.out.println("Connection Successful!");
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console"  + e);
        }
        users users = new users();
        assert connection != null;
//        users.changePassword("0123454321", connection);
//        users.login(connection, "0335840115","minhtrung");
////        users.registerUser(connection);
//        book book = new book();
//        book.showTitleBookByCategory("0335840115", connection);
        book_post book_post = new book_post();
//        book_post.postBook("0335840115", connection);
        book_post.showPostBook("0123454321", connection);
    }

}
