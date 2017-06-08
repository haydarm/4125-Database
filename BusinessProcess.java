import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class BusinessProcess {
	
	public Connection conn;
    public PreparedStatement stmt;
    public ResultSet rset;
    private Scanner input = new Scanner(System.in);

    public BusinessProcess() throws SQLException {
    	this.conn = JDBCconnect.conn;
    }
    
    public void addUser() {
    	try{
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
    	
    	catch (SQLException e) {
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
            System.out.println(e.getMessage());
            try {
                if (rset != null) {rset.close();}
                if (stmt != null) {stmt.close();}
            } catch (SQLException f) {
                f.printStackTrace();
            }
        }
    }
    
    public void addUserSkills() {
    	try{
    	this.stmt = conn.prepareStatement("insert into has_skill (ks_code, per_id) values (?, ?)");
		
		System.out.println("Enter person skill (int)");
	    stmt.setInt(1, input.nextInt());
	    
	    System.out.println("Enter person ID (int)");
	    stmt.setInt(2, input.nextInt());
	    
	    stmt.executeUpdate();
	    stmt.close();
    	} 
    	
    	catch (SQLException e) {
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
            System.out.println(e.getMessage());
            try {
                if (rset != null) {rset.close();}
                if (stmt != null) {stmt.close();}
            } catch (SQLException f) {
                f.printStackTrace();
            }
        }
    }
    
    public void addUserCertificates() {
    	try{
    	this.stmt = conn.prepareStatement("insert into has_cert (cert_code, per_id) values (?, ?)");
		
		System.out.println("Enter person certificate (int)");
	    stmt.setInt(1, input.nextInt());
	    
	    System.out.println("Enter person ID (int)");
	    stmt.setInt(2, input.nextInt());
	    
	    stmt.executeUpdate();
	    stmt.close();
    	} 
    	
    	catch (SQLException e) {
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
            System.out.println(e.getMessage());
            try {
                if (rset != null) {rset.close();}
                if (stmt != null) {stmt.close();}
            } catch (SQLException f) {
                f.printStackTrace();
            }
        }
    }
    
    public void addUserCourses() {
    	try{
        	this.stmt = conn.prepareStatement("insert into takes (per_id, c_code, sec_no, year) values (?, ?, ?, ?)");
    		
    		System.out.println("Enter person ID (int)");
    	    stmt.setInt(1, input.nextInt());
    	    
    	    System.out.println("Enter course number (c_code) of course person has taken (int)");
    	    stmt.setInt(2, input.nextInt());
    	    
    	    System.out.println("Enter section number of course (string)");
    	    stmt.setString(3, input.nextLine());
    	    
    	    System.out.println("Enter year course was taken (int)");
    	    stmt.setInt(4, input.nextInt());
    	    
    	    stmt.executeUpdate();
    	    stmt.close();
        	} 
        	
        	catch (SQLException e) {
                System.out.println(e.getErrorCode());
                System.out.println(e.getSQLState());
                System.out.println(e.getMessage());
                try {
                    if (rset != null) {rset.close();}
                    if (stmt != null) {stmt.close();}
                } catch (SQLException f) {
                    f.printStackTrace();
                }
            }
    }
    
    public void addUserQualifsFindGap() {
		
		boolean continueLoop = false;
		int selectOption;
		
		do
		{
			try{
				System.out.println("Would you like to add a user skill?");
				System.out.println("1. Yes \n"
						+ "2. No");
				selectOption = input.nextInt();
			
				if (selectOption == 1) {
					addUserSkills();
				} else if (selectOption == 2){
					continueLoop = true;
				} else {
					
				}
			} catch (InputMismatchException e) {
				System.out.printf("%nException: %s%n", e);
				input.nextLine();
				System.out.printf("Please enter a valid input\n");
			}
		} while (continueLoop == false);
		
		continueLoop = false;
		
		do
		{
			try{
				System.out.println("Would you like to add a user course?");
				System.out.println("1. Yes \n"
						+ "2. No");
				selectOption = input.nextInt();
				
				if (selectOption == 1) {
					addUserCourses();
				} else if (selectOption == 2){
					continueLoop = true;
				} else {
					
				}
			} catch (InputMismatchException e) {
				System.out.printf("%nException: %s%n", e);
				input.nextLine();
				System.out.printf("Please enter a valid input\n");
			}
		} while (continueLoop == false);
		
		continueLoop = false;
		
		System.out.println("Here are the courses covering skill gap:");
		findCoursesCoverSkillGap();
		
	}
    
    public void findJobs() {
    	
    	try{
    	stmt = conn.prepareStatement("WITH qualified_job_skills AS " +
                "(SELECT job_code, title, (current_pay_rate * pay_type) AS pay_rate " +
                "FROM job J " +
                "WHERE NOT EXISTS " + 
                    "((SELECT ks_code " +
                    "FROM  required_skill R " +
                    "WHERE R.job_code = J.job_code) " +
                    "MINUS " +
                    "(SELECT ks_code " +
                    "FROM has_skill " +
                    "WHERE per_id = ?))" +
                    
                "AND NOT EXISTS " +
                	"((SELECT cert_code " +
                	"FROM required_cert C " +
                	"WHERE C.job_code = J.job_code) " +
                	"MINUS " +
                	"(SELECT cert_code " +
                	"FROM has_cert " +
                	"WHERE per_id = ?)))" +

                "SELECT job_code, title, pay_rate " +
                "FROM qualified_job_skills " +
                "WHERE pay_rate = (SELECT MAX (pay_rate) FROM qualified_job_skills)");
    	
    	System.out.println("Enter person ID (int)");
    	int perid = input.nextInt();
	    stmt.setInt(1, perid);
	    stmt.setInt(2, perid);
        
        rset = stmt.executeQuery();
        
        System.out.println("Here are the jobs for which person " + perid + " is qualified:");
        System.out.println("JOB_CODE" + "\t" + "TITLE" + "\t" + "PAY_RATE");
        while (rset.next()){
            int code = rset.getInt("JOB_CODE");
            String title = rset.getString("TITLE");
            double salary = rset.getDouble("PAY_RATE");
            System.out.println(code + "\t" + title + "\t" + salary);
        }
        
        rset.close();
        stmt.close();
    	} 
    	
    	catch (SQLException e) {
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
            System.out.println(e.getMessage());
            try {
                if (rset != null) {rset.close();}
                if (stmt != null) {stmt.close();}
            } catch (SQLException f) {
                f.printStackTrace();
            }
        }
    	
    }
    
    public void findCoursesCoverSkillGap() {
    			
    			try{
    			stmt = conn.prepareStatement("CREATE TABLE all_possible_course_sets " +
    	    	  "(set_id integer not null, " +
    	    	   "c_code1 integer, " +
    	    	   "c_code2 integer, " +
    	    	   "c_code3 integer, " +
    	    	   "total_price numeric(8,2), " +
    	    	   "primary key (set_id) " +
    	    	  ")");
    	    	stmt.executeUpdate();
    	    	
    	    	stmt = conn.prepareStatement("CREATE SEQUENCE set_seq " +
    	    	"START WITH 1 " +
    	    	"INCREMENT BY 1 " +
    	    	"MAXVALUE 999999 " +
    	    	"NOCYCLE");
    	    	stmt.executeUpdate();
    	    	
    	    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	    	  "SELECT set_seq.NEXTVAL, c_code, NULL, NULL, retail_price " +
    	    	  "FROM course");
    	    	stmt.executeUpdate();

    	    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	    	  "SELECT set_seq.NEXTVAL, C.c_code, D.c_code, NULL, (C.retail_price + D.retail_price) " +
    	    	  "FROM course C, course D " +
    	    	  "WHERE C.c_code < D.c_code");
    	    	stmt.executeUpdate();

    	    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	    	  "SELECT set_seq.NEXTVAL, C.c_code, D.c_code, E.c_code, (C.retail_price + D.retail_price + E.retail_price) " +
    	    	  "FROM course C,course D, course E " +
    	    	  "WHERE C.c_code < D.c_code AND D.c_code < E.c_code");
    	    	stmt.executeUpdate();
    	    	
    	    	  stmt = conn.prepareStatement("WITH missing_skills AS ( " +
    	    	  "SELECT ks_code " +
    	    	  "FROM required_skill " +
    	    	  "WHERE job_code = ? " +//???????
    	    	  "MINUS " +
    	    	  "SELECT ks_code " +
    	    	  "FROM has_skill " +
    	    	  "WHERE per_id = ?), " +//???????

    	    	
    	    	"courses_teach_skills AS ( " +
    	    	  "SELECT ks_code, c_code, retail_price " +
    	    	  "FROM missing_skills NATURAL JOIN teaches_skill NATURAL JOIN course), " +

    	    	
    	    	"course_sets_teach_skills AS ( " +
    	    	  "SELECT set_id, c_code1, c_code2, c_code3, ks_code " +
    	    	  "FROM ( " +
    	    	    "SELECT set_id, c_code1, c_code2, c_code3, ks_code " +
    	    	    "FROM all_possible_course_sets INNER JOIN courses_teach_skills " +
    	    	    "ON all_possible_course_sets.c_code1 = courses_teach_skills.c_code " +
    	    	    "UNION " +
    	    	    "SELECT set_id, c_code1, c_code2, c_code3, ks_code " +
    	    	    "FROM all_possible_course_sets INNER JOIN courses_teach_skills " +
    	    	    "ON all_possible_course_sets.c_code2 = courses_teach_skills.c_code " +
    	    	    "UNION " +
    	    	    "SELECT set_id, c_code1, c_code2, c_code3, ks_code " +
    	    	    "FROM all_possible_course_sets INNER JOIN courses_teach_skills " +
    	    		"ON all_possible_course_sets.c_code3 = courses_teach_skills.c_code)), " +

    	    	"cover_course_sets AS ( " +
    	    	  "SELECT set_id, total_price " +
    	    	  "FROM all_possible_course_sets CS " +
    	    	  "WHERE NOT EXISTS ( " +
    	    		"SELECT ks_code " +
    	    		"FROM missing_skills " +
    	    		"MINUS " +
    	    		"SELECT ks_code " +
    	    		"FROM course_sets_teach_skills CST " +
    	    		"WHERE CST.set_id = CS.set_id)) " +
    	    	    
    	    	"SELECT set_id, c_code1, c_code2, c_code3, total_price " +
    	    	"FROM cover_course_sets NATURAL JOIN all_possible_course_sets " +
    	    	"ORDER BY total_price ASC");
    	    	  
    	    	System.out.println("Enter job code (int)//22222xx");
    	  	    stmt.setInt(1, input.nextInt());
    	  	    
    	  	    System.out.println("Enter person ID (int)//11111xx");
    	  	    stmt.setInt(2, input.nextInt());
    	    	rset = stmt.executeQuery();
    	    	
    	    	System.out.println("SET_ID" + "\t" + "C_CODE1" + "\t" + "C_CODE2" + "\t" + "C_CODE3" +  "\t" + "TOTAL_PRICE");
    	        while (rset.next()){
    	            int setid = rset.getInt("SET_ID");
    	            int ccode1 = rset.getInt("C_CODE1");
    	            int ccode2 = rset.getInt("C_CODE2");
    	            int ccode3 = rset.getInt("C_CODE3");
    	            double price = rset.getDouble("TOTAL_PRICE");
    	            System.out.println(setid + "\t" + ccode1 + "\t" + ccode2 + "\t" + ccode3 + "\t" + price);
    	        }
    	    			
    	    	stmt = conn.prepareStatement("drop table all_possible_course_sets cascade constraints");
    	    	stmt.executeUpdate();
    	    	stmt.close();
    	    	
    	    	stmt = conn.prepareStatement("drop sequence set_seq");
    	    	stmt.executeUpdate();
    	    	
    	    	rset.close();
    	        stmt.close();
    			}
    			
    			catch (SQLException e) {
    	            System.out.println(e.getErrorCode());
    	            System.out.println(e.getSQLState());
    	            System.out.println(e.getMessage());
    	            try {
    	                if (rset != null) {rset.close();}
    	                if (stmt != null) {stmt.close();}
    	            } catch (SQLException f) {
    	                f.printStackTrace();
    	            }
    	        }
    }
}
