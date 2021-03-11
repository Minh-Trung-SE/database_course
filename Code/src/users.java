import java.sql.Connection;

public class users {
    long user_phone;
    String user_name;
    String user_password;
    String user_email;
    public void getInformationUsers(Connection connection){
        String query;
        query = "SELECT * FROM book.users";
    }
}
