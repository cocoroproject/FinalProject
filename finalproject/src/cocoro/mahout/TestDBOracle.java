package cocoro.mahout;

import java.io.*;
import java.sql.*;
 
public class TestDBOracle {
	
	
 
    public static void generateCsvFile(String filename) {
        DatabaseMetaData dbMetaData = null;
        String columnNameQuote = "";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            Connection conn = DriverManager.getConnection(url, "cocoroDB",
                    "1234");
            conn.setAutoCommit(false);
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt
                    .executeQuery("select * from SEARCHINFO");
            ResultSetMetaData rsmd = rset.getMetaData();
            
            FileWriter fname = new FileWriter(filename);
            BufferedWriter bwOutFile = new BufferedWriter(fname);
            StringBuffer sbOutput = new StringBuffer();
            
//			sbOutput.append("u_id,s_id,s_hit");
//			bwOutFile.append(sbOutput);
            
            bwOutFile.append(System.getProperty("line.separator"));
            System.out.println("No of columns in the table:"
                    + rsmd.getColumnCount());
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String  cname = rsmd.getColumnName(i);
                    
            }
 
         /*   System.out.println();*/
            while (rset.next()) {
                System.out.println(rset.getString(1) + " " + rset.getString(2)
                        + " " + rset.getString(3));
                bwOutFile.append(rset.getString(1) + "," + rset.getString(2) + "," + rset.getString(3));
                bwOutFile.append(System.getProperty("line.separator"));
                bwOutFile.flush();
                 
            }
            bwOutFile.close();
            stmt.close();
            System.out.println("Ok.");
        }
 
        catch (Exception e) {
            System.err.println("Unable to connect to database: " + e);
 
        }
        
 
    }
}