import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class EmployeeEdit {
	
	public Connection conn;
    public PreparedStatement stmt;
    private Scanner input = new Scanner(System.in);
	
	public EmployeeEdit() throws SQLException {
		this.conn = JDBCconnect.conn;
    }
	
	public void selectOption() throws SQLException{
		boolean continueLoop = false;
		
		do
		{
			try
			{
				System.out.println("Would you like to:");
				System.out.println("1. Add a value\n"
						+ "2. Remove a value\n"
						+ "Press 0 to exit");
				int selectOption = input.nextInt();
				
				if (selectOption == 1) {
					addValue();
				} else if (selectOption == 2) {
					dropValue();
				} else if (selectOption == 0) {
					continueLoop = true;
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
	
	public void addValue() throws SQLException{
		this.stmt = conn.prepareStatement("insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (?,?,?,?,?,?,?,?,?,?)");
		
		System.out.println("Enter person ID (int)");
	    stmt.setInt(1, input.nextInt());
	    
	    System.out.println("Enter person name (string)");
	    stmt.setString(2, input.nextLine());
	    
	    System.out.println("Enter person apt number (int)");
	    stmt.setInt(3, input.nextInt());
	    
	    System.out.println("Enter person street number (int)");
	    stmt.setInt(4, input.nextInt());
	    
	    System.out.println("Enter person street name (string)");
	    stmt.setString(5, input.nextLine());
	    
	    System.out.println("Enter person city (string)");
	    stmt.setString(6, input.nextLine());
	    
	    System.out.println("Enter person state (string)");
	    stmt.setString(7, input.nextLine());
	    
	    System.out.println("Enter person ZIP (int)");
	    stmt.setInt(8, input.nextInt());
	    
	    System.out.println("Enter person email (string)");
	    stmt.setString(9, input.nextLine());
	    
	    System.out.println("Enter person gender (string)");
	    stmt.setString(10, input.nextLine());
	    
	    stmt.executeUpdate();
	    stmt.close();
	}
	
	public void dropValue() throws SQLException{
		this.stmt = conn.prepareStatement("delete from person where per_id = ?");
		
		System.out.println("Which person would you like to delete?\n"
				+ "Enter person ID");
		stmt.setInt(1, input.nextInt());
		
		stmt.executeUpdate();
	    stmt.close();
	}

}
