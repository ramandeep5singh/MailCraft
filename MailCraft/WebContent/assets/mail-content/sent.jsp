<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%! PreparedStatement ps;
    ResultSet rs;
%>

<%  String email = (String)session.getAttribute("email");
    ps = con.prepareStatement("select count(*) from sent where sender=?;");
    ps.setString(1,email);
    rs = ps.executeQuery();

    int count = 0;
    if(rs.next()){
        count = rs.getInt(1);
    } %>
<span class="mail-count">Sent mails: <%= count %></span>
<div class="sent-mails d-flex flex-column-reverse">
    <%  ps = con.prepareStatement("select * from sent where sender=?;");
        ps.setString(1,email);
        rs = ps.executeQuery();

        while(rs.next()){
            String reciever = rs.getString("reciever");
            String heading = "";
            if(!rs.getString("heading").equals("")){
                heading = rs.getString("heading");
            }
            else{
                heading = "No Subject";
            }
            String date = rs.getString("date");
            String message = rs.getString("message");
            String attachment = rs.getString("attachment"); %>
            <form action="assets/mailSent.jsp" method="post" class="message d-flex justify-content-between">
                <input type="hidden" name="reciever" value="<%= reciever %>">
                <input type="hidden" name="heading" value="<%= heading %>">
                <input type="hidden" name="date" value="<%= date %>">
                <input type="hidden" name="message" value="<%= message %>">
                <input type="hidden" name="attachment" value="<%= attachment %>">
                <button type="submit" class="d-flex justify-content-between">
                    <span class="message-name"><%= reciever %></span>
                    <span class="message-head"><%= heading %></span>
                    <span class="message-date"><%= date %></span>
                </button>
            </form>
        <%}%>
</div>
