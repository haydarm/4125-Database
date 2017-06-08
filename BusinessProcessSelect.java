import java.sql.Connection;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class BusinessProcessSelect {
	
	public Connection conn;
	private BusinessProcess businessProcess;
	private Scanner input = new Scanner(System.in);
	
	
	public BusinessProcessSelect() throws SQLException {
		this.conn = JDBCconnect.jdbcconnect();
		businessProcess = new BusinessProcess();
	}
	
	public void selectProcess() throws SQLException{
		
		boolean continueLoop = false;
		
		do
		{
			try
			{
				System.out.println("\nWhich service would you like to run:");
				System.out.println("1. Add user to database\n"
						+ "2. Add user skills to database\n"
						+ "3. Add user certificates to database\n"
						+ "4. Add courses user has taken to database\n"
						+ "5. Find jobs for which user is qualified\n"
						+ "6. Find courses to cover skill gap for a user and a particular job\n"
						+ "Press 0 to exit");
				int selectOption = input.nextInt();
				
				if (selectOption == 1) {
					businessProcess.addUser();
				} else if (selectOption == 2) {
					businessProcess.addUserSkills();
				} else if (selectOption == 3) {
					businessProcess.addUserCertificates();
				} else if (selectOption == 4) {
					businessProcess.addUserCourses();;
				} else if (selectOption == 5) {
					businessProcess.findJobs();
				} else if (selectOption == 6) {
					businessProcess.addUserQualifsFindGap();
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
