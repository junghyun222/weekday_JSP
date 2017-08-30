package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConTest {

	public static void main(String[] args) {
		
		Connection con;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "tlqdnjs1");
			System.out.println("연결성공");
			
			String sql = "select * from user";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				
				System.out.println(id+ "," + pwd+ "," + name);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
