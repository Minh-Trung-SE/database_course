import java.net.ConnectException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Scanner;

public class book_post {
    String user_id;
    int book_id;
    Timestamp date;

    public void postBook(String user_phone, Connection connection) throws SQLException {
        String book_title, link_book, description, author, query;
        int category_id, quantity, year_release;
        long price;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter book title: ");
        book_title = scanner.nextLine();
        System.out.println("Enter link book: ");
        link_book = scanner.nextLine();
        System.out.println("Enter description: ");
        description = scanner.nextLine();
        System.out.println("Enter name author: ");
        author = scanner.nextLine();
        System.out.println("Enter price: ");
        price = scanner.nextLong();
        System.out.println("Enter quantity: ");
        quantity = scanner.nextInt();
        System.out.println("Enter year release: ");
        year_release = scanner.nextInt();
        System.out.println("Enter category: ");

        category_id = scanner.nextInt();

        query = "";
        Statement statement = connection.createStatement();
        statement.executeUpdate(query);
    }

    public void showPostBook(String user_phone, Connection connection) throws SQLException {
        String query;
        Statement statement = connection.createStatement();


    }

    public void editPostBook(String user_phone, Connection connection) throws SQLException {
        String query = "";
        Statement statement = connection.createStatement();
        statement.executeUpdate(query);
    }

}
