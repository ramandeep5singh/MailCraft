package connection;

import java.sql.*;

public class Connect{
	private String driver = "com.mysql.jdbc.Driver";
	private String database = "jdbc:mysql://localhost:3306/mail";
	private String root = "root";
	private String password = "ramandeep";

	public Connection getConnection(){
		try{
			Class.forName(driver);
    			Connection con = DriverManager.getConnection(database,root,password);
			return con;
		}
		catch(ClassNotFoundException | SQLException e){}
		return null;
	}
}