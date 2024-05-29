package jdbc;

import java.sql.*;



public class Database {
	
	public static Connection getConnection(){
        Connection conn = null;
   
        try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //System.out.println("Driver Registered");
        try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/smartrationcard","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //System.out.println("Connection Established !");
        
        return conn;
    }

}
