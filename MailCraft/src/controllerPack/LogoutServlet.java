package controllerPack;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LogoutServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession();

    		for(Cookie c : cookies){
        		String name = c.getName();
        		if(name.equals("mail")){
            			c.setValue("");
            			response.addCookie(c);
				session.invalidate();
            			response.sendRedirect("index.jsp");
        		}
    		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		doPost(request,response);
	}
}
