import java.sql.Connection;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class AtomicQueriesSelect {
	
	public Connection conn;
	private AtomicQueries atomicQueries;
	private Scanner input = new Scanner(System.in);
	
	
	public AtomicQueriesSelect() throws SQLException {
		this.conn = JDBCconnect.jdbcconnect();
		atomicQueries = new AtomicQueries();
	}
	
	public void selectQueries() throws SQLException{
		
		boolean continueLoop = false;
		
		do
		{
			try
			{
				System.out.println("Which atomic query would you like to run:");
				System.out.println("1. Insertion pass\n"
						+ "2. Modification pass\n"
						+ "3. Insertion fail\n"
						+ "4. Modification fail\n"
						+ "Press 0 to exit");
				int selectOption = input.nextInt();
				
				if (selectOption == 1) {
					atomicQueries.queryOne();
				} else if (selectOption == 2) {
					atomicQueries.queryTwo();
				} else if (selectOption == 3) {
					atomicQueries.queryThree();
				} else if (selectOption == 4) {
					atomicQueries.queryFour();
				} else if (selectOption == 0) {
					continueLoop = true;
					JDBCconnect.conn.close();
				}
			}
			catch (InputMismatchException e)
			{
				System.out.printf("%nException: %s%n", e);
				input.nextLine();
				System.out.printf("Please enter a valid input\n");
			}
		} while (continueLoop == false);
		
	}

}
