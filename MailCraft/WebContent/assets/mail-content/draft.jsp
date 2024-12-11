<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%! PreparedStatement ps;
    ResultSet rs;
%>
<%  String email = (String)session.getAttribute("email");
ps = con.prepareStatement("select count(*) from draft where sender=?;");
ps.setString(1,email);
rs = ps.executeQuery();

int count = 0;
if(rs.next()){
    count = rs.getInt(1);
} %>
<span class="mail-count">Draft mails: <%= count %></span>
<div class="draft-mails d-flex flex-column-reverse">
    <%  ps = con.prepareStatement("select * from draft where sender=?;");
        ps.setString(1,email);
        rs = ps.executeQuery();
        int x=0;

        while(rs.next()){
            x++;
            String reciever = rs.getString("reciever");
            String heading = "";
            if(!rs.getString("heading").equals("")){
                heading = rs.getString("heading");
            }
            else{
                heading = "No Subject";
            } 
            String message = rs.getString("message");
            String id1 = "reciever"+x;
            String id2 = "heading"+x;
            String id3 = "message"+x; %>
            <div class="message d-flex justify-content-between" style="cursor:auto;">
                <span id="<%= id1 %>" class="message-name"><%= reciever %></span>
                <span id="<%= id2 %>" class="message-head"><%= heading %></span>
                <p id="<%= id3 %>" style="display: none;"><%= message %></p>
                <span style="cursor: pointer;" class="draft-view d-flex flex-column justify-content-center" onclick='showDraft("<%= x %>")'>View</span>
            </div>
        <%}
    %>
</div>
<script>
    function showDraft(x){
        let reciever = document.getElementById("reciever"+x).innerHTML;
        let subject = document.getElementById("heading"+x).innerHTML;
        let message = document.getElementById("message"+x).innerHTML;

        document.getElementById("to").value = reciever;
        document.getElementById("sub").value = subject;
        document.getElementById("message").value = message;
        document.getElementById("compose-overlay").style.display = "block";
    }   
</script>