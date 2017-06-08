import java.sql.*;

public class JDBCconnect {
	
	public static Connection conn;
	
	public static Connection jdbcconnect() throws SQLException {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl",
				"username","password");
		return conn;
	}
	
}
