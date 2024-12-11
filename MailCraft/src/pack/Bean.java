package pack;

import java.sql.*;

public class Bean{
	private String name;
	private String dob;
	private String email;
	private String password;
	public boolean valid;

	PreparedStatement ps;
    	ResultSet rs;

	connection.Connect cn = new connection.Connect();

	public void setName(String name){
		this.name = name;
	}
	public void setDob(String dob){
		this.dob = dob;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public void setPassword(String password){
		this.password = password;
	}

	public String getName(){
		return name;
	}
	public String getDob(){
		return dob;
	}
	public String getEmail(){
		return email;
	}
	public String getPassword(){
		return password;
	}

	public boolean checkUser() throws SQLException{
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?;");
			ps.setString(1,this.email);
    			rs = ps.executeQuery();
		
			if(rs.next()){
				return false;
			}
			else{
				return true;
			}
		}
		catch(SQLException e){}
		finally{
			con.close();
		}
		return false;
	}
	public boolean addUser() throws SQLException{
		Connection con = cn.getConnection();
		try{				
			ps = con.prepareStatement("insert into users values(?,?,?,?);");
        		ps.setString(1,email);
        		ps.setString(2,name);
        		ps.setString(3,dob);
        		ps.setString(4,password);
        		ps.executeUpdate();
			return true;
		}
		catch(SQLException e){}
		finally{
			con.close();
		}
		return false;
	}

	public boolean setLogin() throws SQLException{
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?");
    			ps.setString(1,email);
    			rs = ps.executeQuery();
		
			if(rs.next()){
				if(rs.getString("password").equals(password)){
					valid = true; 
            				return true;
      				}
				else{
					return false;
				}
			}
			return false;
		}
		catch(SQLException e){}
		finally{
			con.close();
		}
		return false;
	}

	public boolean indexLogic() throws SQLException{
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?;");
                	ps.setString(1,email);
                	rs = ps.executeQuery();

			if(rs.next()){
				password = rs.getString("password");
				return true;
			}
			return false;
		}
		catch(SQLException e){}
		finally{
			con.close();
		}
		return false;
	}
}