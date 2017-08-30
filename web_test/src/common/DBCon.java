package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {

	private Connection con;
	
	public DBCon() throws ClassNotFoundException, SQLException{
		String url = "jdbc:mysql://localhost:3306/jsp";
		String id = "root";
		String pwd = "tlqdnjs1";
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url, id, pwd);
	}
	
	public Connection getCon() {
		return con;
	}
}
