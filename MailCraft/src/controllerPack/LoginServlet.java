package controllerPack;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		commonLogic(request,response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		commonLogic(request,response);
	}

	public void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.

		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		/*if(email==null && password==null){
        		email = (String)request.getAttribute("email");
        		password = (String)request.getAttribute("password");
    		}*/

		pack.Bean bean = new pack.Bean();
		bean.setEmail(email);
		bean.setPassword(password);
	
		HttpSession session;

		try{
			if(bean.setLogin()){
        			if(bean.valid){
            				session = request.getSession(); 
            				session.setAttribute("email",email);
            				/*request.setAttribute("email",email);
            				request.setAttribute("password",password);*/
            				int maxAge = 60*60*24*365;
            				Cookie cookie = new Cookie("mail",email);
            				cookie.setMaxAge(maxAge);
            				response.addCookie(cookie);
					RequestDispatcher rd = request.getRequestDispatcher("inbox.jsp");
					rd.forward(request,response);
				}
				else{
					out.print("<div class='position-absolute' style='top: 12vw; right: 16vw; z-index: 100;'>");
    					out.print("<center><span style='color: red;'>Invalid Password!</span></center>");
					out.print("</div>");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.include(request,response);
				}
			}
			else{
				out.print("<div class='position-absolute' style='top: 12vw; right: 16vw; z-index: 100;'>");
    				out.print("<center><span style='color: red;'>User does'nt exists!</span></center>");
				out.print("</div>");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request,response);
			}
		}
		catch(SQLException e){}
	}
}
