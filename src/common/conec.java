package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conec {
public static void main(String args[]) {

		Connection conec;

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conec = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "계정", "비밀번호");
			System.out.println("Success!");
		} catch (SQLException ex) {
			System.out.println("SQLException:" + ex);
		} catch (Exception e) {
			System.out.println("Exception:" + e);
		}
	}
}

