<%@ page import="java.sql.*" %>
<%! Connection con; %>
<%  Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","ramandeep");
%>