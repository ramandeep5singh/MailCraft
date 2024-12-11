package controllerPack;

import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.*;
import java.sql.*;

@MultipartConfig(
		location = "C:\\Tomcat 8.5\\webapps\\MailingProject\\attachments",
		fileSizeThreshold = 1024 * 1024,   //1mb
		maxFileSize = 1024 * 1024 * 10,    //10mb
		maxRequestSize = 1024 * 1024 * 11 //11mb
	)
	
public class SendMailServlet extends HttpServlet{
	static int check=0;
	
	private String getFileName(Part part) {
        	for (String cd : part.getHeader("content-disposition").split(";")) {
            		if (cd.trim().startsWith("filename")) {
                		String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                		return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            		}
        	}
        	return null;
    	}

	private String getAttachmentFolderPath(String reciever) {
        	String rootPath = getServletContext().getRealPath("/attachments");
        	return rootPath + File.separator + reciever;
    	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.sendRedirect("inbox.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.

		out.print("<head>");
    		out.print("<meta charset='UTF-8'>");
    		out.print("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
    		out.print("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>");
    		out.print("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>");
    		out.print("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css' integrity='sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==' crossorigin='anonymous' referrerpolicy='no-referrer' />");
    		out.print("<link rel='stylesheet' href='assets/styles.css'>");
    		out.print("<title>Document</title>");
		out.print("</head>");
	
		HttpSession session = request.getSession();

		String sender = (String)session.getAttribute("email");
        	String reciever = request.getParameter("reciever");
        	String subject = request.getParameter("subject");
        	String message = request.getParameter("message");
		Part part = request.getPart("file");

		String fileName = getFileName(part);

		pack.MailBean mb = new pack.MailBean();
		mb.setSender(sender);
		mb.setEmail(reciever);
		mb.setHeading(subject);
		mb.setMessage(message);
		mb.setFileName(fileName);

		if(reciever==null){
            		response.sendRedirect("index.jsp");   
        	}
		else{
			if(reciever.equals(sender)){
				out.print("<div id='failure' class='send-failure position-fixed d-flex flex-column justify-content-center'>");
                    		out.print("<center>");
                        	out.print("<div class='failure-message d-flex flex-column'>");
                            	out.print("<a href='inbox.jsp' style='text-align: right;'><i class='fa-solid fa-xmark'></i></a>");
                            	out.print("<span>can't send to self!!</span>");
                        	out.print("</div>");
                    		out.print("</center>");
                		out.print("</div>");
				//request.setAttribute("sendFailure","can't send to self!!");
				RequestDispatcher rd = request.getRequestDispatcher("inbox.jsp");
				rd.include(request,response);
			}
			else{
				if(mb.sendMail()){
					String receiverFolderPath = getAttachmentFolderPath(reciever);
       					File receiverFolder = new File(receiverFolderPath);
        				if (!receiverFolder.exists()) {
            					boolean created = receiverFolder.mkdirs();
            					if (created) {
                					System.out.println("Receiver folder created successfully");
            					} else {
                					System.out.println("Failed to create receiver folder");
            					}
        				}

        				// Save the file in the receiver's subdirectory
        				String filePath = receiverFolderPath + File.separator + fileName;
        				part.write(filePath);   
                   			response.sendRedirect("inbox.jsp");
                		}
				else{
					out.print("<div id='failure' class='send-failure position-fixed d-flex flex-column justify-content-center'>");
                    			out.print("<center>");
                        		out.print("<div class='failure-message d-flex flex-column'>");
                            		out.print("<a href='inbox.jsp' style='text-align: right;'><i class='fa-solid fa-xmark'></i></a>");
                            		out.print("<span>User does'nt exists!!</span>");
                        		out.print("</div>");
                    			out.print("</center>");
                			out.print("</div>");
					//request.setAttribute("sendFailure","User does'nt exists!!");
					RequestDispatcher rd = request.getRequestDispatcher("inbox.jsp");
					rd.include(request,response);
				}
			}
		}
	}
}