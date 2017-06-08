import java.sql.*;
import java.util.Date;

public class PreparedStatements {
    
    public Connection conn;
    public PreparedStatement stmt;
    public ResultSet rset;

    public PreparedStatements() throws SQLException {
        this.conn = JDBCconnect.jdbcconnect();
    }
    
    public void one() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT per_id, name " +
                "FROM person NATURAL JOIN works NATURAL JOIN job " +
                "WHERE comp_id = 3333306 AND end_date IS NULL");
        
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
        	String name = rset.getString("NAME");//Also, getint, getdate etc
            System.out.println(perid + "\t" + name);
        }
        
        rset.close();
        stmt.close();
    
    }
    
    public void two() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT per_id, name " +
                "FROM person NATURAL JOIN works NATURAL JOIN job " +
                "WHERE comp_id = 3333307 AND pay_type = 1 AND end_date IS NULL " +
                "ORDER BY pay_rate DESC");
        
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            System.out.println(perid + "\t" + name);
        }
        
        rset.close();
        stmt.close();
    }
    
    public void three() throws SQLException {
        //try {
        stmt = conn.prepareStatement("SELECT comp_id, comp_name, SUM (current_pay_rate * pay_type) AS labor_cost " +
                "FROM job NATURAL JOIN works NATURAL JOIN company " +
                "WHERE end_date IS NULL " +
                "GROUP BY comp_id, comp_name " +
                "ORDER BY labor_cost DESC");
        
        rset = stmt.executeQuery();
        
        System.out.println("COMP_ID" + "\t" + "COMP_NAME" + "\t" + "LABOR_COST");
        while (rset.next()){
            int id = rset.getInt("COMP_ID");
            String name = rset.getString("comp_name");
            int salary = rset.getInt("LABOR_COST");
            System.out.println(id + "\t" + name + "\t" + salary);
        }
        
        rset.close();
        stmt.close();
        
        
        
    }
    
    public void four() throws SQLException {
        stmt = conn.prepareStatement("SELECT job_code, title " +
                "FROM works NATURAL JOIN job " +
                "WHERE per_id = 1111101");
        
        rset = stmt.executeQuery();
        
        System.out.println("JOB_CODE" + "\t" + "TITLE");
        while (rset.next()){
            int code = rset.getInt("JOB_CODE");
            String title = rset.getString("TITLE");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
    }
    
    public void five() throws SQLException {
        stmt = conn.prepareStatement("SELECT ks_code, description " + 
                "FROM has_skill NATURAL JOIN knowledge_skill " + 
                "WHERE per_id = 1111102");
        
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "DESCRIPTION");
        while (rset.next()){
            int code = rset.getInt("KS_CODE");
            String title = rset.getString("DESCRIPTION");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
    }
    
    public void six() throws SQLException {
        stmt = conn.prepareStatement("(SELECT ks_code, description " +
                "FROM works NATURAL JOIN required_skill NATURAL JOIN knowledge_skill " +
                "WHERE per_id = 1111101 AND end_date IS NULL) " +
                "MINUS " +
                "(SELECT ks_code, description " +
                "FROM has_skill NATURAL JOIN knowledge_skill " +
                "WHERE per_id = 1111101)");
        
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "DESCRIPTION");
        while (rset.next()){
            int code = rset.getInt("KS_CODE");
            String title = rset.getString("DESCRIPTION");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
    }
    
    public void seven() throws SQLException {
        stmt = conn.prepareStatement("SELECT ks_code, description " + 
                "FROM knowledge_skill NATURAL JOIN required_skill " + 
                "WHERE job_code = 2222201");
        
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "DESCRIPTION");
        while (rset.next()){
            int code = rset.getInt("KS_CODE");
            String title = rset.getString("DESCRIPTION");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
        
        System.out.println("\nPart b \n");
        
        stmt = conn.prepareStatement("SELECT ks_code, description " + 
                "FROM knowledge_skill NATURAL JOIN skill_set " + 
                "WHERE cate_code = '15-1111'");
        
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "DESCRIPTION");
        while (rset.next()){
            int code = rset.getInt("KS_CODE");
            String title = rset.getString("DESCRIPTION");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
    }
    
    public void eight() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT ks_code, description " + 
                "FROM knowledge_skill NATURAL JOIN " + 
                "((SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222203) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM has_skill " +
                "WHERE per_id = 1111105))");
        
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "DESCRIPTION");
        while (rset.next()){
            int code = rset.getInt("KS_CODE");
            String title = rset.getString("DESCRIPTION");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void nine() throws SQLException {
        
        stmt = conn.prepareStatement("WITH missing_skill AS " + 
                "(SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222201 " +
                "MINUS " +
                "SELECT ks_code " +
                "FROM has_skill " +
                "WHERE per_id = 1111101) " +
                
                "SELECT c_code, title " +
                "FROM course C " +
                "WHERE NOT EXISTS " +
                    "(SELECT * " + 
                    "FROM missing_skill " + 
                    "MINUS " +
                    "SELECT ks_code " +
                    "FROM teaches_skill T " +
                    "WHERE T.c_code = C.c_code)");
        
        rset = stmt.executeQuery();
        
        System.out.println("C_CODE" + "\t" + "TITLE");
        while (rset.next()){
            int code = rset.getInt("C_CODE");
            String title = rset.getString("TITLE");
            System.out.println(code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void ten() throws SQLException {
        
        stmt = conn.prepareStatement("WITH missing_skill AS " + 
                "((SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222201) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM has_skill " +
                "WHERE per_id = 1111101)), " +
                
                "course_needed AS " +
                "(SELECT c_code, sec_no, complete_date " +
                "FROM section C " +
                "WHERE NOT EXISTS " +
                "((SELECT * " +
                "FROM missing_skill) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM teaches_skill T " +
                "WHERE T.c_code = C.c_code))) " +

                "SELECT c_code, sec_no, complete_date " +
                "FROM course_needed " +
                "WHERE complete_date = (SELECT MIN (complete_date) FROM course_needed)");
        
        rset = stmt.executeQuery();
        
        System.out.println("C_CODE" + "\t"+ "SEC_NO" + "\t" + "COMPLETE_DATE");
        while (rset.next()){
            int code = rset.getInt("C_CODE");
            int sec = rset.getInt("SEC_NO");
            Date date = rset.getDate("COMPLETE_DATE");
            System.out.println(code + "\t"+ sec + "\t" + date);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void eleven() throws SQLException {
        
        stmt = conn.prepareStatement("WITH missing_skill AS " + 
                "((SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222201) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM has_skill " +
                "WHERE per_id = 1111101)), " +
                
                "course_needed AS " +
                "(SELECT c_code, sec_no, price " +
                "FROM section S " +
                "WHERE NOT EXISTS " +
                "((SELECT * " +
                "FROM missing_skill) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM teaches_skill T " +
                "WHERE T.c_code = S.c_code))) " +

                "SELECT c_code, sec_no, title, price " +
                "FROM course_needed NATURAL JOIN course " +
                "WHERE price = (SELECT MIN (price) FROM course_needed)");
        
        rset = stmt.executeQuery();
        
        System.out.println("C_CODE" + "\t" + "SEC_NO" + "\t" + "TITLE" + "\t" + "PRICE");
        while (rset.next()){
            int code = rset.getInt("C_CODE");
            int sec = rset.getInt("SEC_NO");
            String title = rset.getString("TITLE");
            double price = rset.getDouble("PRICE");
            System.out.println(code + "\t"+ sec + "\t" + title + "\t" + price);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void twelve() throws SQLException {
    	
    	stmt = conn.prepareStatement("CREATE TABLE all_possible_course_sets " +
    	  "(set_id integer not null, " +
    	   "c_code1 integer, " +
    	   "c_code2 integer, " +
    	   "c_code3 integer, " +
    	   "total_price numeric(8,2), " +
    	   "primary key (set_id) " +
    	  ")");
    	stmt.executeUpdate();
    	stmt.close();
    	
    	stmt = conn.prepareStatement("CREATE SEQUENCE set_seq " +
    	"START WITH 1 " +
    	"INCREMENT BY 1 " +
    	"MAXVALUE 999999 " +
    	"NOCYCLE");
    	stmt.executeUpdate();
    	stmt.close();
    	
    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	  "SELECT set_seq.NEXTVAL, c_code, NULL, NULL, retail_price " +
    	  "FROM course");
    	stmt.executeUpdate();
    	stmt.close();

    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	  "SELECT set_seq.NEXTVAL, C.c_code, D.c_code, NULL, (C.retail_price + D.retail_price) " +
    	  "FROM course C, course D " +
    	  "WHERE C.c_code < D.c_code");
    	stmt.executeUpdate();
    	stmt.close();

    	stmt = conn.prepareStatement("INSERT INTO all_possible_course_sets " +
    	  "SELECT set_seq.NEXTVAL, C.c_code, D.c_code, E.c_code, (C.retail_price + D.retail_price + E.retail_price) " +
    	  "FROM course C,course D, course E " +
    	  "WHERE C.c_code < D.c_code AND D.c_code < E.c_code");
    	stmt.executeUpdate();
    	stmt.close();
    	
    	  stmt = conn.prepareStatement("WITH missing_skills AS ( " +
    	  "SELECT ks_code " +
    	  "FROM required_skill " +
    	  "WHERE job_code = 2222201 " +
    	  "MINUS " +
    	  "SELECT ks_code " +
    	  "FROM has_skill " +
    	  "WHERE per_id = 1111101), " +

    	
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
    
    public void thirteen() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT cate_code, title " +
                "FROM job_category J " +
                "WHERE NOT EXISTS " +
                "((SELECT ks_code " +
                "FROM skill_set S " +
                "WHERE S.cate_code = J.cate_code) " +
                "MINUS " +
                "(SELECT ks_code " +
                "FROM has_skill " +
                "WHERE per_id = 1111106))");
        
        rset = stmt.executeQuery();
        
        System.out.println("CATE_CODE" + "\t" + "TITLE");
        while (rset.next()){
            String cate_code = rset.getString("CATE_CODE");
            String title = rset.getString("TITLE");
            System.out.println(cate_code + "\t" + title);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void fourteen() throws SQLException {
        
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
                    "WHERE per_id = 1111103))" +
                    
                "AND NOT EXISTS " +
                	"((SELECT cert_code " +
                	"FROM required_cert C " +
                	"WHERE C.job_code = J.job_code) " +
                	"MINUS " +
                	"(SELECT cert_code " +
                	"FROM has_cert " +
                	"WHERE per_id = 1111103)))" +

                "SELECT job_code, title, pay_rate " +
                "FROM qualified_job_skills " +
                "WHERE pay_rate = (SELECT MAX (pay_rate) FROM qualified_job_skills)");
        
        rset = stmt.executeQuery();
        
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
    
    public void fifteen() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT per_id, name, email " +
                "FROM person P " +
                "WHERE NOT EXISTS " +
                	"(SELECT ks_code " +
                	"FROM required_skill " +
                	"WHERE job_code = 2222204 " +
                	"MINUS " +
                	"SELECT ks_code " +
                	"FROM has_skill S " +
                	"WHERE P.per_id = S.per_id) " +
                "AND NOT EXISTS ( " + 
                	"SELECT cert_code " + 
                	"FROM required_cert " + 
                	"WHERE job_code = 2222204 " + 
                	"MINUS " + 
                	"SELECT cert_code " + 
                	"FROM has_cert C " + 
        			"WHERE P.per_id = C.per_id)");
        
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME" + "\t" + "EMAIL");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            String email = rset.getString("EMAIL");
            System.out.println(perid + "\t" + name + "\t" + email);
        }
        
        rset.close();
        stmt.close();
        
    }
    
    public void sixteen() throws SQLException {
        
        stmt = conn.prepareStatement("WITH job_skills_required AS " +
                "(SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222202) " +
                
                "SELECT per_id, name " +
                "FROM person P " +
                	"WHERE " +
                	"(SELECT COUNT (*) " +
                		"FROM " +
                		"((SELECT ks_code " +
                		"FROM job_skills_required) " +
                		"MINUS " +
                		"(SELECT ks_code " +
                		"FROM has_skill S " +
                		"WHERE P.per_id = S.per_id))) = 1");
        
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            System.out.println(perid + "\t" + name);
        }
        
        rset.close();
        stmt.close();
        
    }

    public void seventeen() throws SQLException {
    
        stmt = conn.prepareStatement("WITH required_list AS " +
                "(SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222202), " +

                "missing_one AS " +
                "(SELECT per_id, name " +
                "FROM person P " +
                "WHERE " +
                "(SELECT COUNT (*) " +
                "FROM " +
                "(SELECT  ks_code " +
                "FROM    required_list " +
                "MINUS " +
                "SELECT  ks_code " +
                "FROM    has_skill S " +
                "WHERE   P.per_id = S.per_id)) = 1) " +

                "SELECT ks_code, COUNT (*) AS people_count " +
                "FROM " +
                "(SELECT per_id, ks_code " +
                "FROM person, required_list " +
                "MINUS " +
                "SELECT * " +
                "FROM has_skill) NATURAL JOIN missing_one " +
                "GROUP BY ks_code " +
                "ORDER BY people_count");
    
        rset = stmt.executeQuery();
        
        System.out.println("KS_CODE" + "\t" + "PEOPLE_COUNT");
        while (rset.next()){
            int perid = rset.getInt("KS_CODE");
            int count = rset.getInt("PEOPLE_COUNT");
            System.out.println(perid + "\t" + count);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void eighteen() throws SQLException {
        
        stmt = conn.prepareStatement("WITH required_list AS " +
                "(SELECT ks_code " +
                "FROM required_skill " +
                "WHERE job_code = 2222202), " +

                "missing_skill (per_id, missing_count) AS " +
                "(SELECT per_id, count (*) " +
                "FROM " +
                "(SELECT per_id, ks_code " +
                "FROM person, required_list " +
                "MINUS " +
                "SELECT per_id, ks_code " +
                "FROM has_skill) " +
                "GROUP BY per_id) " +

                "SELECT per_id, missing_count AS least_missing " +
                "FROM missing_skill " +
                "WHERE missing_count = (SELECT MIN (missing_count) FROM missing_skill)");
    
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "LEAST_MISSING");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            int count = rset.getInt("LEAST_MISSING");
            System.out.println(perid + "\t" + count);
        }
    
        rset.close();
        stmt.close();
    
    }

    public void nineteen() throws SQLException {
        
        stmt = conn.prepareStatement("WITH job_skills_required AS " +
                "(SELECT ks_code " +
                "FROM skill_set " +
                "WHERE cate_code = '15-1134'), " +

                "missing_skill (per_id, name, missing_skill_count) AS " +
                "(SELECT    per_id, name, COUNT(*) " +
                "FROM " +
                "(SELECT  per_id, name, ks_code " +
                "FROM    person NATURAL JOIN job_skills_required " +
                "MINUS " +
                "SELECT  per_id, name, ks_code " +
                "FROM    has_skill NATURAL JOIN person) " +
                "GROUP BY  per_id, name) " +

                "SELECT      per_id, name, missing_skill_count " +
                "FROM        missing_skill " +
                "WHERE       missing_skill_count <= 3 " +
                "ORDER BY    missing_skill_count ASC");
    
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME" + "\t" + "MISSING_SKILL_COUNT");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            int count = rset.getInt("MISSING_SKILL_COUNT");
            System.out.println(perid + "\t" + name + "\t" + count);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twenty() throws SQLException {
        
        stmt = conn.prepareStatement("WITH job_skills_required AS " + 
                "(SELECT ks_code " + 
                "FROM skill_set " + 
                "WHERE cate_code = '15-1122'), " + 
                          
                "missing_skill (per_id, missing_count) AS " + 
                "(SELECT per_id, COUNT(*) " + 
                "FROM " + 
                	"(SELECT per_id, ks_code " + 
                	"FROM person NATURAL JOIN job_skills_required " + 
                	"MINUS " + 
                	"SELECT * " + 
                	"FROM has_skill) " + 
                "GROUP BY  per_id) " + 

                "SELECT per_id, missing_count AS least_missing_skill " + 
                "FROM missing_skill " + 
                "WHERE missing_count = (SELECT MIN (missing_count) FROM missing_skill)");
                
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "LEAST_MISSING_SKILL");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            int count = rset.getInt("LEAST_MISSING_SKILL");
            System.out.println(perid + "\t" + count);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twentyone() throws SQLException {
        
        stmt = conn.prepareStatement("SELECT DISTINCT per_id, name " +
                "FROM works NATURAL JOIN has_category NATURAL JOIN person " +
                "WHERE cate_code = '15-1122'");
                
        rset = stmt.executeQuery();
        
        System.out.println("PER_ID" + "\t" + "NAME");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            System.out.println(perid + "\t" + name);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twentytwo() throws SQLException {
        
        stmt = conn.prepareStatement("WITH unemployed_persons AS " +
                "(SELECT DISTINCT per_id, name " +
                "FROM works NATURAL JOIN person " +
                "MINUS " +
                "SELECT DISTINCT per_id, name " +
                "FROM works NATURAL JOIN person " +
                "WHERE end_date IS NULL) " +

                "SELECT per_id, name " +
                "FROM unemployed_persons NATURAL JOIN works " +
                "WHERE job_code = 2222207");
                
        rset = stmt.executeQuery();

        System.out.println("PER_ID" + "\t" + "NAME");
        while (rset.next()){
            int perid = rset.getInt("PER_ID");
            String name = rset.getString("NAME");
            System.out.println(perid + "\t" + name);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twentythree() throws SQLException {

        stmt = conn.prepareStatement("WITH total_employees AS " +
                "(SELECT comp_id, COUNT(*) AS number_of_employees " +
                "FROM job NATURAL JOIN works " +
                "WHERE end_date IS NULL " +
                "GROUP BY comp_id) " +

                "SELECT comp_id, comp_name, number_of_employees " +
                "FROM total_employees NATURAL JOIN company " +
                "WHERE number_of_employees = (SELECT MAX (number_of_employees) FROM total_employees)");
        
        rset = stmt.executeQuery();
        
        System.out.println("COMP_ID" + "\t" + "COMP_NAME" + "\t" + "NUMBER_OF_EMPLOYEES");
        while (rset.next()){
            int id = rset.getInt("COMP_ID");
            String name = rset.getString("COMP_NAME");
            int cost = rset.getInt("NUMBER_OF_EMPLOYEES");
            System.out.println(id + "\t" + name + "\t" + cost);
        }
        
        rset.close();
        stmt.close();
        
        
        System.out.println("\nPart b \n");
        
        stmt = conn.prepareStatement("WITH total_labor_costs AS " +
                "(SELECT comp_id, SUM(current_pay_rate*pay_type) AS labor_cost " +
                "FROM job NATURAL JOIN works " +
                "WHERE end_date IS NULL " +
                "GROUP BY comp_id) " +

                "SELECT comp_id, comp_name, labor_cost " +
                "FROM total_labor_costs NATURAL JOIN company " +
                "WHERE labor_cost = (SELECT MAX (labor_cost) FROM total_labor_costs)");
        
        rset = stmt.executeQuery();
        
        System.out.println("COMP_ID" + "\t" + "COMP_NAME" + "\t" + "LABOR_COST");
        while (rset.next()){
            int id = rset.getInt("COMP_ID");
            String name = rset.getString("COMP_NAME");
            int cost = rset.getInt("LABOR_COST");
            System.out.println(id + "\t" + name + "\t" + cost);
        }
        
        rset.close();
        stmt.close();

    }
    
    public void twentyfour() throws SQLException {

        stmt = conn.prepareStatement("WITH total_naics_employees AS " +
                "(SELECT naics_code, COUNT(*) AS number_of_employees " +
                "FROM job NATURAL JOIN company_naics " +
                "GROUP BY naics_code) " +

                "SELECT naics_code, number_of_employees " +
                "FROM total_naics_employees " +
                "WHERE number_of_employees = (SELECT MAX (number_of_employees) FROM total_naics_employees)");
        
        rset = stmt.executeQuery();
        
        System.out.println("NAICS_CODE" + "\t" + "NUMBER_OF_EMPLOYEES");
        while (rset.next()){
            int id = rset.getInt("NAICS_CODE");
            int count = rset.getInt("NUMBER_OF_EMPLOYEES");
            System.out.println(id + "\t" + count);
        }
        
        rset.close();
        stmt.close();

        System.out.println("\nPart b \n");
        
        stmt = conn.prepareStatement("WITH total_naics_costs AS " +
                "(SELECT naics_code, SUM(current_pay_rate*pay_type) AS labor_cost " +
                "FROM job NATURAL JOIN company_naics " +
                "GROUP BY naics_code) " +

                "SELECT naics_code, labor_cost " +
                "FROM total_naics_costs " +
                "WHERE labor_cost = (SELECT MAX (labor_cost) FROM total_naics_costs)");
        
        rset = stmt.executeQuery();
        
        System.out.println("NAICS_CODE" + "\t" + "LABOR_COST");
        while (rset.next()){
            int id = rset.getInt("NAICS_CODE");
            int cost = rset.getInt("LABOR_COST");
            System.out.println(id + "\t" + cost);
        }
        
        rset.close();
        stmt.close();

    }
    
    public void twentyfive() throws SQLException {
        
        stmt = conn.prepareStatement("WITH past_job AS ( " +
        		"SELECT per_id, job_code, (pay_rate * pay_type) as past_rate " +
        		"FROM works NATURAL JOIN job NATURAL JOIN ( " +
        			"SELECT per_id, MAX (end_date) " +
        			"FROM works " +
        			"GROUP BY per_id)), " +

				"current_job AS ( " +
					"SELECT per_id, MAX (pay_rate * pay_type) AS current_rate " +
					"FROM works NATURAL JOIN job " +
					"WHERE end_date IS NULL " +
					"GROUP BY per_id) " +
  
				"SELECT ROUND (num_increased / num_decreased, 2) AS ratio " +
					"FROM " +
						"(SELECT COUNT(*) AS num_decreased " +
						"FROM past_job NATURAL JOIN current_job " +
						"WHERE current_rate < past_rate), " +
						"(SELECT COUNT(*) as num_increased " +
						"FROM past_job NATURAL JOIN current_job " +
        				"WHERE current_rate >= past_rate)");
                
        rset = stmt.executeQuery();

        System.out.println("RATIO");
        while (rset.next()){
            double ratio = rset.getDouble("ratio");
            System.out.println(ratio);
        }
        
        rset.close();
        stmt.close();

        System.out.println("\nPart b \n");
        
        stmt = conn.prepareStatement("WITH past_job AS ( " +
        		"SELECT per_id, job_code, (pay_rate * pay_type) as past_rate " +
        		"FROM works NATURAL JOIN job NATURAL JOIN ( " +
        			"SELECT per_id, MAX (end_date) " +
        			"FROM works " +
        			"GROUP BY per_id)), " +

				"current_job AS ( " +
					"SELECT per_id, MAX (pay_rate * pay_type) AS current_rate " +
					"FROM works NATURAL JOIN job " +
					"WHERE end_date IS NULL " +
					"GROUP BY per_id), " +
				
				"past_current_job AS ( " + 
					"SELECT per_id, past_rate, current_rate " + 
					"FROM past_job NATURAL JOIN current_job NATURAL JOIN job NATURAL JOIN company_naics " + 
					"WHERE naics_code = 541519) " + 

				"SELECT ROUND (AVG ((current_rate - past_rate) / current_rate), 2) AS improved_rate " + 
        		"FROM past_current_job");
        
        rset = stmt.executeQuery();

        System.out.println("IMPROVED_RATE");
        while (rset.next()){
            double ratio = rset.getDouble("IMPROVED_RATE");
            System.out.println(ratio);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twentysix() throws SQLException {
        
        stmt = conn.prepareStatement("WITH vacant_jobs AS ( " +
        		"SELECT job_code, cate_code " +
        		"FROM job NATURAL JOIN has_category " +
        		"MINUS " +
        		"SELECT job_code, cate_code " +
        		"FROM works NATURAL JOIN has_category " +
        		"WHERE end_date IS NULL), " +
        		
		"cate_jobs AS ( " +
			"SELECT cate_code, COUNT (job_code) as openings " +
			"FROM vacant_jobs " +
			"GROUP BY cate_code), " +

		"cate_qualified AS ( " +
			"SELECT cate_code, COUNT (per_id) AS qualified " +
			"FROM cate_jobs C, person P " +
			"WHERE NOT EXISTS ( " +
				"SELECT ks_code " +
				"FROM cate_jobs NATURAL JOIN skill_set " +
				"WHERE C.cate_code = cate_code " +
				"MINUS " +
				"SELECT ks_code " +
				"FROM cate_jobs NATURAL JOIN skill_set NATURAL JOIN has_skill " +
				"WHERE P.per_id = per_id) " +
			"GROUP BY  cate_code), " +

		"vacancy_diff AS ( " +
			"SELECT cate_code, (openings - qualified) AS difference " +
			"FROM cate_jobs NATURAL JOIN cate_qualified) " +

		"SELECT cate_code, difference AS openings_count " +
		"FROM vacancy_diff " +
        "WHERE difference = (SELECT MAX (difference) from vacancy_diff)");
        
        rset = stmt.executeQuery();
        
        System.out.println("CATE_CODE" + "\t" + "OPENINGS_COUNT");
        while (rset.next()){
            String cate_code = rset.getString("CATE_CODE");
            int open_count = rset.getInt("OPENINGS_COUNT");
            System.out.println(cate_code + "\t" + open_count);
        }
    
        rset.close();
        stmt.close();
    
    }
    
    public void twentyseven() throws SQLException {
    	
    	stmt = conn.prepareStatement("WITH vacant_jobs AS ( " +
    			"SELECT job_code, cate_code " +
    			"FROM job NATURAL JOIN has_category " +
    			"MINUS " +
    			"SELECT job_code, cate_code " +
    			"FROM works NATURAL JOIN has_category " +
    			"WHERE end_date IS NULL), " +

			"cate_jobs AS ( " +
				"SELECT cate_code, COUNT (job_code) as openings " +
				"FROM vacant_jobs " +
				"GROUP BY cate_code), " +

			"cate_qualified AS ( " +
				"SELECT cate_code, COUNT (per_id) AS qualified " +
				"FROM cate_jobs C, person P " +
				"WHERE NOT EXISTS ( " +
					"SELECT ks_code " +
					"FROM cate_jobs NATURAL JOIN skill_set " +
					"WHERE C.cate_code = cate_code " +
					"MINUS " +
					"SELECT ks_code " +
					"FROM cate_jobs NATURAL JOIN skill_set NATURAL JOIN has_skill " +
					"WHERE P.per_id = per_id) " +
				"GROUP BY cate_code), " +

			"vacancy_diff AS ( " +
				"SELECT cate_code, (openings - qualified) AS difference " +
				"FROM cate_jobs NATURAL JOIN cate_qualified), " +

			"max_openings_count AS ( " +
				"SELECT cate_code, difference AS openings_count " +
				"FROM vacancy_diff " +
				"WHERE difference = (SELECT MAX (difference) from vacancy_diff)), " +

			"cate_skills AS ( " +
				"SELECT ks_code " +
				"FROM skill_set NATURAL JOIN max_openings_count) " +

			"SELECT c_code, title " +
			"FROM course C " +
			"WHERE EXISTS ( " +
				"SELECT ks_code " +
				"FROM cate_skills " +
				"INTERSECT " +
				"SELECT ks_code " +
				"FROM teaches_skill T " +
    			"WHERE C.c_code = T.c_code)");
    	
    	rset = stmt.executeQuery();
        
        System.out.println("C_CODE" + "\t" + "TITLE");
        while (rset.next()){
            int ccode = rset.getInt("C_CODE");
            String title = rset.getString("TITLE");
            System.out.println(ccode + "\t" + title);
        }
    
        rset.close();
        stmt.close();
    	
    }
    
    public void twentyeight() throws SQLException {
    	
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
  	    			"FROM skill_set " +
  	    			"WHERE cate_code = '15-1143' " +
  	    			"MINUS " +
  	    			"SELECT ks_code " +
  	    			"FROM has_skill " +
  	    			"WHERE per_id = 1111109), " +

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
						"WHERE CST.set_id = CS.set_id)), " +
    
				"minimum_course_set AS ( " +
					"SELECT set_id, c_code1, c_code2, c_code3, total_price " +
					"FROM cover_course_sets NATURAL JOIN all_possible_course_sets " +
					"WHERE total_price = (SELECT MIN (total_price) FROM cover_course_sets NATURAL JOIN all_possible_course_sets)), " +

				"distinct_course_set AS ( " +
					"SELECT set_id, c_code1, c_code2, c_code3, total_price " +
					"FROM minimum_course_set " +
					"WHERE set_id = (SELECT MIN (set_id) FROM minimum_course_set)), " +

				"course_set_table(c_code) AS ( " +
					"SELECT c_code1 as c_code " +
						"FROM distinct_course_set " +
						"UNION " +
						"SELECT c_code2 as c_code " +
						"FROM distinct_course_set " +
						"UNION " +
						"SELECT c_code3 as c_code " +
						"FROM distinct_course_set), " +
  
				"courses_and_prereqs AS ( " +
					"SELECT c_code, prereq_code " +
					"FROM course_set_table NATURAL JOIN has_prereq), " +

				"prerequisites(c_code, prereq_code) AS ( " +
					"SELECT c_code, prereq_code " +
						"FROM courses_and_prereqs " +
						"UNION ALL " +
						"SELECT prerequisites.c_code, prerequisites.prereq_code " +
						"FROM prerequisites, courses_and_prereqs " +
						"WHERE prerequisites.prereq_code = courses_and_prereqs.c_code), " +

				"distinct_prerequisites AS ( " +
					"SELECT DISTINCT c_code " +
					"FROM ( " +
						"SELECT prereq_code AS c_code " +
						"FROM prerequisites " +
						"UNION " +
						"SELECT c_code " +
						"FROM prerequisites)) " +

				"(SELECT c_code " +
				"FROM distinct_prerequisites " +
				"MINUS " +
				"SELECT c_code " +
				"FROM takes " +
  	    		"WHERE per_id = 1111109)");
  	    	
  	    	rset = stmt.executeQuery();
  	        
  	        System.out.println("C_CODE");
  	        while (rset.next()){;
  	            int ccode = rset.getInt("C_CODE");
  	            System.out.println(ccode);
  	        }
  	    	
  	    	stmt = conn.prepareStatement("drop table all_possible_course_sets cascade constraints");
	    	stmt.executeUpdate();
	    	stmt.close();
	    	
	    	stmt = conn.prepareStatement("drop sequence set_seq");
	    	stmt.executeUpdate();
	    	
	    	rset.close();
	        stmt.close();
    	
    }
    
    public void SQLerror() {
        
    }
    
    public void connClose() throws SQLException {
        conn.close();
    }
}
