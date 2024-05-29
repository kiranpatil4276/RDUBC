package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;


public class Database {
	
	public static Connection getConnection()throws Exception{
        Connection conn;
        Class.forName("com.mysql.jdbc.Driver");
        //System.out.println("Driver Registered");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/smartrationcard","root","root");
        //System.out.println("Connection Established !");
        
        return conn;
    }

}
