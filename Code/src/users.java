import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class users {
    long user_phone;
    String user_name;
    String user_password;
    String user_email;

    public boolean login(Connection connection, long user_phone, String user_password) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        String query = "SELECT user_id FROM `book`.`users` WHERE `user_phone` = " + user_phone + ";";
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery(query);
        if(user_phone == result.getLong("user_phone") && user_password.equals(result.getString("user_password"))){
            return true;
        }
        return false;
    }
//    public users getInformationUsers(Connection connection){
//        String query;
//        query = "SELECT * FROM book.users";
//    }

    public void registerUser(Connection connection) throws SQLException {
        long user_phone;
        long phone = 0;
        String user_name;
        String user_password;
        String user_email;
        String query;
        Scanner scanner = new Scanner(System.in);
        System.out.println("\n====Register account====");
        System.out.println("Enter user phone: ");
        user_phone = scanner.nextLong();
        scanner.nextLine();
        System.out.println("Enter user name ");
        user_name = scanner.nextLine();
        System.out.println("Enter password: ");
        user_password = scanner.nextLine();
        System.out.println("Enter email: ");
        user_email = scanner.nextLine();
        Statement statement = connection.createStatement();
        query = "SELECT `user_phone` FROM book.users where user_phone = '0"+user_phone+"';";
        ResultSet result = statement.executeQuery(query);
        if(result.next()){
            phone = result.getLong("user_phone");
        }

        if(user_phone != phone){
            query = "INSERT INTO `book`.`users` (`user_phone`, `user_name`, `user_password`, `user_email`) VALUES ('0"+user_phone+"', '"+user_name+"', '"+user_password+"', '"+user_email+"');";
            System.out.println(query);
            statement.executeUpdate(query);
            System.out.println("Register success!");
        }
    }

    public long getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(long user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
}
