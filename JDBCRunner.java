import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class JDBCRunner {
	
	public static Scanner input = new Scanner(System.in);
	
	public static void main(String[] args) throws SQLException {
		
		boolean continueLoop = false;
		
		do
		{
			try
			{
				System.out.println("Good day. What would you like to do? \n"
						+ "1. Run SQL Queries \n"
						+ "2. Modify Table Data \n"
						+ "3. Run atomic queries \n"
						+ "4. Business Processes \n"
						+ "5. Exit the Program \n");
				int menuOption = input.nextInt();
				
				if (menuOption == 1)
					runQueries();
				else if (menuOption == 2)
					editTables();
				else if (menuOption == 3)
					atomicQueries();
				else if (menuOption == 4)
					businessProcesses();
				else if (menuOption == 5)
					continueLoop = true;
			}
			catch (InputMismatchException e)
			{
				System.out.printf("%nException: %s%n", e);
				input.nextLine();
				System.out.printf("Please enter a valid input\n");
			}
			//finally //THIS WE NEED TO CHECK TO SEE IF IN RIGHT PLACE. Think it's OK
			//ACTUALLY MAY BE BETTER TO PUT IN OTHER METHODS
			//{
			//	if (JDBCconnect.conn.isClosed() == false)
			//		JDBCconnect.conn.close();
			//}
		} while (continueLoop == false);		

	}
	
	public static void runQueries() throws SQLException {
		boolean continueLoop = false;
		PreparedStatements ps = new PreparedStatements();
		input.nextLine();
		
		do
		{
			try
			{
				System.out.println("\nWhich query would you like to execute?\n"
						+ "Press 0 to exit");
				int queryOption = input.nextInt();
				
				if (queryOption == 1)
					ps.one();
				else if (queryOption == 2)
					ps.two();
				else if (queryOption == 3)
					ps.three();
				else if (queryOption == 4)
					ps.four();
				else if (queryOption == 5)
					ps.five();
				else if (queryOption == 6)
					ps.six();
				else if (queryOption == 7)
					ps.seven();
				else if (queryOption == 8)
					ps.eight();
				else if (queryOption == 9)
					ps.nine();
				else if (queryOption == 10)
					ps.ten();
				else if (queryOption == 11)
					ps.eleven();
				else if (queryOption == 12)
					ps.twelve();
				else if (queryOption == 13)
					ps.thirteen();
				else if (queryOption == 14)
					ps.fourteen();
				else if (queryOption == 15)
					ps.fifteen();
				else if (queryOption == 16)
					ps.sixteen();
				else if (queryOption == 17)
					ps.seventeen();
				else if (queryOption == 18)
					ps.eighteen();
				else if (queryOption == 19)
					ps.nineteen();
				else if (queryOption == 20)
					ps.twenty();
				else if (queryOption == 21)
					ps.twentyone();
				else if (queryOption == 22)
					ps.twentytwo();
				else if (queryOption == 23)
					ps.twentythree();
				else if (queryOption == 24)
					ps.twentyfour();
				else if (queryOption == 25)
					ps.twentyfive();
				else if (queryOption == 26)
					ps.twentysix();
				else if (queryOption == 27)
					ps.twentyseven();
				else if (queryOption == 28)
					ps.twentyeight();
				else if (queryOption == 0) {
					continueLoop = true;
					ps.connClose();
				}
			}
			catch (InputMismatchException e)
			{
				System.out.printf("%nException: %s%n", e);
				input.nextLine();
				System.out.printf("Please enter a valid input\n");
			}
			catch (SQLException e) {
				System.out.println(e.getSQLState());
				System.out.println(e.getErrorCode());
				System.out.println(e.getMessage());
				if (ps.rset != null) {ps.rset.close();}
				if (ps.stmt != null) {ps.stmt.close();}
				JDBCconnect.conn.close();
				continueLoop = true;
			}
		} while (continueLoop == false);
	}
	
	public static void editTables() throws SQLException {
		TableEdit tableEdit = new TableEdit();
		tableEdit.selectTable();
	}
	
	public static void atomicQueries() throws SQLException {
		AtomicQueriesSelect selectQueries = new AtomicQueriesSelect();
		selectQueries.selectQueries();
	}
	
	public static void businessProcesses() throws SQLException {
		BusinessProcessSelect businessProcessSelect = new BusinessProcessSelect();
		businessProcessSelect.selectProcess();
	}
		
}
