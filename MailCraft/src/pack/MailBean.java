package pack;

import java.sql.*;

public class MailBean{
	private String sender;
	private String email;
	private String heading;
	private String message;
	private String fileName;

	PreparedStatement ps;
    	ResultSet rs;
	
	connection.Connect cn = new connection.Connect();

	private java.util.Date d = new java.util.Date();
        private java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd:MM:yyyy");
        private String date = sdf.format(d);
    
        int checked = 0;

	public void setSender(String sender){
		this.sender = sender;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public void setHeading(String heading){
		this.heading = heading;
	}	
	public void setMessage(String message){
		this.message = message;
	}
	public void setFileName(String fileName){
		this.fileName = fileName;
	}

	public String getEmail(){
		return email;
	}
	public String getHeading(){
		return heading;
	}
	public String getMessage(){
		return message;
	}
	public String getName(){
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?");
    			ps.setString(1,email);
    			rs = ps.executeQuery();
			
			if(rs.next()){
				return rs.getString("name");
			}
		}
		catch(SQLException e){}
		finally{
			try{
				con.close();
			}
			catch(SQLException e){}
		}

		return null;
	}

	public boolean saveDraft(){
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?;");
        		ps.setString(1,email);
        		rs = ps.executeQuery();

        		if(rs.next()){
           			ps = con.prepareStatement("insert into draft values(?,?,?,?);");
            			ps.setString(1,sender);
            			ps.setString(2,email);
            			ps.setString(3,heading);
            			ps.setString(4,message);
            			ps.executeUpdate();

				return true;
			}
		}
		catch(SQLException e){}
		finally{
			try{
				con.close();
			}
			catch(SQLException e){}
		}
		return false;
	}

	public boolean sendMail(){
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email=?;");
                	ps.setString(1,email);
                	rs = ps.executeQuery();

			if(rs.next()){
                    		ps = con.prepareStatement("insert into inbox values(?,?,?,?,?,?);");
                    		ps.setString(1,sender);
                    		ps.setString(2,email);
                    		ps.setString(3,heading);
                    		ps.setString(4,message);
                    		ps.setString(5,date);
				ps.setString(6,fileName);
                    		ps.executeUpdate();
    
                    		ps = con.prepareStatement("insert into sent values(?,?,?,?,?,?);");
            			ps.setString(1,sender);
            			ps.setString(2,email);
            			ps.setString(3,heading);
            			ps.setString(4,message);
            			ps.setString(5,date);
            			ps.setString(6,fileName);
            			ps.executeUpdate();

				return true;
			}
		}
		catch(SQLException e){}
		finally{
			try{
				con.close();
			}
			catch(SQLException e){}
		}
		return false;
	}
			
}	