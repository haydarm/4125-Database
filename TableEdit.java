import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class TableEdit {
	
	public Connection conn;
    public PreparedStatement stmt;
    public ResultSet rset;
    private Scanner input = new Scanner(System.in);

    public TableEdit() throws SQLException {
        this.conn = JDBCconnect.jdbcconnect();
    }
    
    public void selectTable() throws SQLException {
    	boolean continueLoop = false;
		
		do
		{
			try
			{
				System.out.println("Which table would you like to edit?");
				System.out.println("1. Company\n"
						+ "2. Person\n"
						+ "3. Other\n"
						+ "Press 0 to exit");
				int tableOption = input.nextInt();
				
				if (tableOption == 1) {
					CompanyEdit companyEdit = new CompanyEdit();
					companyEdit.selectOption();
				} else if (tableOption == 2) {
					EmployeeEdit employeeEdit = new EmployeeEdit();
					employeeEdit.selectOption();
				} else if (tableOption == 3) {
					
				} else if (tableOption == 0) {
					continueLoop = true;
					conn.close();
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
				JDBCconnect.conn.close();
				continueLoop = true;
			}
			//catch (Exception e) {
			//	e.printStackTrace();
			//}
		} while (continueLoop == false);
    }

}
