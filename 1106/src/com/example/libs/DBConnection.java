package com.example.libs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");  //2. Driver loading 한다.
		}catch(ClassNotFoundException ex) {
			System.out.println("Class Not Found");
		}
		Connection conn = null;
		try {
			//3. Database Connection한다.
			conn = DriverManager.getConnection("jdbc:mariadb://192.168.56.4:3306/test", 
				                                     "root", "javamariadb");
		}catch(SQLException ex) {
			System.out.println("Mariadb cannot connect.");
		}
		return conn;
	}
}









