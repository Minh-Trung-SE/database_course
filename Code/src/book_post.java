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
    //Done post Book
    public void postBook(String user_phone, Connection connection) throws SQLException {
        String book_id = null, book_title, link_book, description, author, query;
        int category_id, quantity, year_release;
        long price;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter book id: ");
        book_title = scanner.nextLine();
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
        Statement statement = connection.createStatement();

        query = "INSERT INTO book.book_storage(book_id, book_title, category_id, link_photo, release_year, description, author, price, amount) " +
                "VALUES('" + book_id + "','" + book_title +"','" + category_id + "','" + link_book + "','" + year_release + "','" + description + "','" + author + "','" + price + "','" + quantity + "');";
        statement.executeUpdate(query);

        query = "INSERT INTO `book`.book_post(user_phone, book_id) VALUES ('" + user_phone + "', '" + book_id + "');";
        statement.executeUpdate(query);

        System.out.println("Success!");
    }


    public void showPostBook(String user_phone, Connection connection) throws SQLException {
        String query;
        Statement statement = connection.createStatement();
        query = "SELECT book_storage.link_book, book_storage.book_title, book_storage.year_release, book_storage.description, book_storage.author, book_storage.price, book_category.category_name, user.user_phone, user.user_email"
        +"FROM `book`.`book_storage`" +
                "JOIN `book`.`book_post` ON ((`book`.`book_storage`.`book_id` = `book`.`book_post`.`book_id`)))";

    }

    public void editPostBook(String user_phone, Connection connection) throws SQLException {
        String query = "";
        Statement statement = connection.createStatement();
        statement.executeUpdate(query);
    }

}
