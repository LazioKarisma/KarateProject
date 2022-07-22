package karate.Demo.features;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {
    public static void main(String[] args) {
		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@10.244.33.58:1521:Cassitj4", "cas",
				"cassitj4")) {

			if (conn != null) {
				System.out.println("Connected to the database!");
			} else {
				System.out.println("Failed to make connection!");
			}

		} catch (SQLException e) {
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}