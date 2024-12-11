package ajaxController;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class SearchSuggestionsServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		String qry = request.getParameter("qry");
		
		pack.SearchSuggestionsBean sb = new pack.SearchSuggestionsBean();
		sb.setQry(qry.trim());
		String suggestions = sb.getSuggestions(); 

		out.println("{ \"suggestions\": \"" + suggestions + "\" }");

		out.close();
	}
}