package pack;

import java.sql.*;

public class SearchSuggestionsBean {
	private String qry;
	
	PreparedStatement ps;
    	ResultSet rs;
	connection.Connect cn = new connection.Connect();
	
	public void setQry(String qry){
		this.qry = qry;
	}	
	
	private String generateSuggestions(ResultSet rs) throws SQLException{
		StringBuilder suggestions = new StringBuilder();
		
		if(rs!=null){
			while(rs.next()){
				String email = rs.getString("email");
				suggestions.append("<tr><td style='padding: 0.5vw 1vw; border-bottom: 1px solid black'>"+email+"</td></tr>");
			}
			if(suggestions.length()>0){
				return suggestions.toString();
			}
		}

		return "<tr><td style='padding: 0.5vw 1vw; border-bottom: 1px solid black'>no results found</td></tr>";
	}

	public String getSuggestions(){
		Connection con = cn.getConnection();
		try{
			ps = con.prepareStatement("select * from users where email LIKE ?;");
			ps.setString(1,"%"+qry+"%");
			rs = ps.executeQuery();
			
			String suggestions = generateSuggestions(rs);

			return suggestions;
		}
		catch(SQLException e){
		}
		finally{
			try{
				con.close();
			}
			catch(SQLException e){}
		}

		return "<tr><td style='padding: 0.5vw 1vw; border-bottom: 1px solid black'>something went wrong!!</td></tr>";
	}
}