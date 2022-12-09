package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConnection {
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jbdc.Driver");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jbdc:mysql://localhost:3306/_loja", "root", "");
		}catch(Exception ex1) {
			ex1.printStackTrace();
		}
		return conn;
	}

}
