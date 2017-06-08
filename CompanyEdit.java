import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class CompanyEdit {
	
	public Connection conn;
    public PreparedStatement stmt;
    private Scanner input = new Scanner(System.in);

    public CompanyEdit() throws SQLException {
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
		
		this.stmt = conn.prepareStatement("insert into company(comp_id, comp_name, street_number, street_name, city, state, zip_code, primary_sector, website) values (?,?,?,?,?,?,?,?,?)");
		
		System.out.println("Enter company ID (int)");
	    stmt.setInt(1, input.nextInt());
	    
	    System.out.println("Enter company name (string)");
	    stmt.setString(2, input.nextLine());
	    
	    System.out.println("Enter company street number (int)");
	    stmt.setInt(3, input.nextInt());
	    
	    System.out.println("Enter company street name (string)");
	    stmt.setString(4, input.nextLine());
	    
	    System.out.println("Enter company city (string)");
	    stmt.setString(5, input.nextLine());
	    
	    System.out.println("Enter company state (string)");
	    stmt.setString(6, input.nextLine());
	    
	    System.out.println("Enter company ZIP (int)");
	    stmt.setInt(7, input.nextInt());
	    
	    System.out.println("Enter company primary sector (string)");
	    stmt.setString(8, input.nextLine());
	    
	    System.out.println("Enter company website (string)");
	    stmt.setString(9, input.nextLine());
	    
	    stmt.executeUpdate();
	    stmt.close();
	}
	
	public void dropValue() throws SQLException{
		
		this.stmt = conn.prepareStatement("delete from company where comp_id = ?");
		
		System.out.println("Which company would you like to delete?\n"
				+ "Enter company ID");
		stmt.setInt(1, input.nextInt());
		
		stmt.executeUpdate();
	    stmt.close();
	}

}
