import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AtomicQueries {
	
	public Connection conn;
    public PreparedStatement stmt;
    public ResultSet rset;

    public AtomicQueries() throws SQLException {
        this.conn = JDBCconnect.conn;
    }
    
    public void queryOne() { //Insertion Pass
    	try {
			conn.setAutoCommit(false);
			
			// Insert into Person table new person "Atomic Man" with per_id 1111152
			this.stmt = conn.prepareStatement("insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111152, 'Atomic Man', null, '1', 'Atomic Drive', 'Atomic City', 'AL', '30567', 'aman0@bbc.co.uk', 'M')");
			stmt.executeUpdate();
			
			// Insert into Person table new person "Molecule Man" with per_id 1111153
			this.stmt = conn.prepareStatement("insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values (1111153, 'Molecule Man', null, '1', 'Molecule Drive', 'Molecule City', 'AL', '30567', 'mman0@bbc.co.uk', 'M')");
			stmt.executeUpdate();
			stmt.close();
			
			conn.commit();
		} catch (SQLException e) {
			// If there is an error, print "Insertions Failed"
			// This should not occur
			try {
				System.out.println("Insertions failed");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				// Finally print out the per_id's and names of the new persons we just added
				// Expected result is
				// PER_ID	NAME
				// 1111152	Atomic Man
				// 1111153	Molecule Man
				conn.setAutoCommit(true);
				stmt = conn.prepareStatement("SELECT per_id, name " +
		                "FROM person " +
		                "WHERE per_id = 1111152 OR per_id = 1111153");
		        
		        rset = stmt.executeQuery();
		        
		        System.out.println("PER_ID" + "\t" + "NAME");
		        while (rset.next()){
		            int perid = rset.getInt("PER_ID");
		            String name = rset.getString("NAME");
		            System.out.println(perid + "\t" + name);
		        }
		        rset.close();		        
			    stmt.close();
			    System.out.println();
		        
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
		}
    }
    
    public void queryTwo() { // Modification Pass
    	
    	try {
    		conn.setAutoCommit(false);
    		
    		// Change the name of the persons added from queryOne() from
    		// "Atomic Man" and "Molecule Man" to "Evil Dr. Atom"
    		// and "Evil Dr. Molecule" respectively
    		this.stmt = conn.prepareStatement("update person set name = 'Evil Dr. Atom' "
    				+ "where per_id = 1111152");
    		stmt.executeUpdate();
    	
    		this.stmt = conn.prepareStatement("update person set name = 'Evil Dr. Molecule' "
    				+ "where per_id = 1111153");
    		stmt.executeUpdate();
    	
    		conn.commit();
    	} catch (SQLException e) {
    		// If there is an error, print "Modifications Failed"
    		// This should not occur
			try {
				System.out.println("Modifications failed");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				// Finally print out the per_id's and names of the new persons we just added
				// Expected result is
				// PER_ID	NAME
				// 1111152	Evil Dr. Atom
				// 1111153	Evil Dr. Molecule
				conn.setAutoCommit(true);
				stmt = conn.prepareStatement("SELECT per_id, name " +
		                "FROM person " +
		                "WHERE per_id = 1111152 OR per_id = 1111153");
		        
		        rset = stmt.executeQuery();
		        
		        System.out.println("PER_ID" + "\t" + "NAME");
		        while (rset.next()){
		            int perid = rset.getInt("PER_ID");
		            String name = rset.getString("NAME");
		            System.out.println(perid + "\t" + name);
		        }
		        
		        
		        // Finally, delete the new persons we added into the database
		        this.stmt = conn.prepareStatement("delete from person where per_id = 1111152");
		        stmt.executeUpdate();
		        
		        this.stmt = conn.prepareStatement("delete from person where per_id = 1111153");
		        stmt.executeUpdate();
		        
		        System.out.println("New additions successfully deleted\n");
		        
		        rset.close();		        
			    stmt.close();
		        
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
    	
    }
    
    public void queryThree() { //Insert Fail
    	
    	System.out.println("Attempt to insert new data:");
    	System.out.println("persons 'Valid name' and 'This name is too... long' ");
    	try {
			conn.setAutoCommit(false);
			
			// Attempt to insert a new person into the Person table
			// This is a valid entry with the person having the name "Valid Name"
			this.stmt = conn.prepareStatement("insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values "
					+ "(1111152, 'Valid Name', null, '1', 'Atomic Drive', 'Atomic City', 'AL', '30567', 'aman0@bbc.co.uk', 'M')");
			stmt.executeUpdate();
			
			// Attempt to insert a new person into the Person table
			// This is an invalid entry with the person having a name
			// that is too long to be a valid string for the table
			this.stmt = conn.prepareStatement("insert into person (per_id, name, apt_number, street_number, street_name, city, state, zip_code, email, gender) values "
					+ "(1111153, 'THIS NAME IS TOO LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONG', "
					+ "null, '1', 'Molecule Drive', 'Molecule City', 'AL', '30567', 'mman0@bbc.co.uk', 'M')");
			stmt.executeUpdate();
			stmt.close();
			
			conn.commit();
		} catch (SQLException e) {
			// If there is an error, print "Insertions Failed"
			// This should occur
			try {
				System.out.println("Insertions failed");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				// Attempt to print out the new persons we just attempted to insert into Person
				// This should not work. Both new entries should have failed (even though 
				// one was valid) and the query
				// should return nothing. This is an all or nothing system.

				// PER_ID	NAME
				// --empty
				conn.setAutoCommit(true);
				stmt = conn.prepareStatement("SELECT per_id, name " +
		                "FROM person " +
		                "WHERE per_id = 1111152 OR per_id = 1111153");
		        
		        rset = stmt.executeQuery();
		        
		        System.out.println("PER_ID" + "\t" + "NAME");
		        while (rset.next()){
		            int perid = rset.getInt("PER_ID");
		            String name = rset.getString("NAME");
		            System.out.println(perid + "\t" + name);
		        }
		        rset.close();		        
			    stmt.close();
			    System.out.println();
		        
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
    	
    }

	public void queryFour() { //Modification Fail
		
		// Successfully insert new data into person table
		// (same data as queryOne()): Atomic Man and Molecule Man
		System.out.println("Insert new data");
		queryOne();
		
		// Now we will attempt to modify this data
		// We will try to change the name of the persons added from queryOne() from
		// "Atomic Man" and "Molecule Man" to "Evil Dr. Atom"
		// and an invalid string that is too long respectively
		System.out.println("\n" + "Attempt to modify new data");
		System.out.println("Attempt to changes names to Evil Dr. Atom and an invalid string");
		try {
    		conn.setAutoCommit(false);
    	
    		this.stmt = conn.prepareStatement("update person set name = 'Evil Dr. Atom' "
    				+ "where per_id = 1111152");
    		stmt.executeUpdate();
    	
    		this.stmt = conn.prepareStatement("update person set name = 'THIS NAME IS TOO LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOONG' "
    				+ "where per_id = 1111153");
    		stmt.executeUpdate();
    	
    		conn.commit();
    	} catch (SQLException e) {
    		// If there is an error, print "Modifications Failed"
    		// This should occur
			try {
				System.out.println("Modifications failed");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				// Print out the new persons we just inserted into Persons and
				// attempted to modify. The persons should be found and they should
				// print. However, instead of printing the new values of:

				// PER_ID	NAME
				// 1111152	Evil Dr. Atom
				// 1111153	{invalid String}
				
				// They will print the original values that were in the database of

				// PER_ID	NAME
				// 1111152	Atomic Man
				// 1111153	Molecule Man
				
				//This is an all or nothing system
				conn.setAutoCommit(true);
				stmt = conn.prepareStatement("SELECT per_id, name " +
		                "FROM person " +
		                "WHERE per_id = 1111152 OR per_id = 1111153");
		        
		        rset = stmt.executeQuery();
		        
		        System.out.println("PER_ID" + "\t" + "NAME");
		        while (rset.next()){
		            int perid = rset.getInt("PER_ID");
		            String name = rset.getString("NAME");
		            System.out.println(perid + "\t" + name);
		        }
		        
		        // Finally, delete the new persons we added into the database
		        this.stmt = conn.prepareStatement("delete from person where per_id = 1111152");
		        stmt.executeUpdate();
		        
		        this.stmt = conn.prepareStatement("delete from person where per_id = 1111153");
		        stmt.executeUpdate();
		        
		        System.out.println("New additions successfully deleted\n");
		        
		        rset.close();		        
			    stmt.close();
		        
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
	}

}
