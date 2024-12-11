<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <!--<%  String sender = (String)session.getAttribute("email");
        String reciever = request.getParameter("reciever");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
    %>
    <jsp:useBean id="mb" class="pack.MailBean" >
        <jsp:setProperty name="mb" property="sender" value="<%= sender %>" />
        <jsp:setProperty name="mb" property="email" value="<%= reciever %>" />
        <jsp:setProperty name="mb" property="heading" value="<%= subject %>" />
        <jsp:setProperty name="mb" property="message" value="<%= message %>" />
    </jsp:useBean>
        
    <%  if(reciever==null){
            response.sendRedirect("../inbox.jsp");   
        }
        else{
            if(reciever.equals(sender)){ %>
                <div id="failure" class="send-failure position-fixed d-flex flex-column justify-content-center">
                    <center>
                        <div class="failure-message d-flex flex-column">
                            <a href="../inbox.jsp" style="text-align: right;"><i class="fa-solid fa-xmark"></i></a>
                            <span>can't send to self!!</span>
                        </div>
                    </center>
                </div>
                <jsp:include page="../inbox.jsp" />
            <% }
            else{
                if(mb.sendMail()){    
                    response.sendRedirect("../inbox.jsp");
                }
                else{%>
                    <div class="send-failure position-fixed d-flex flex-column justify-content-center">
                        <center>
                            <div class="failure-message d-flex flex-column">
                                <a href="../inbox.jsp" style="text-align: right;"><i class="fa-solid fa-xmark"></i></a>
                                <span>Reciever does not exists!!</span>
                            </div>
                        </center>
                    </div>
                    <jsp:include page="../inbox.jsp" />
                <%}
            }
        }
    %>-->
    <div class="send-failure position-fixed d-flex flex-column justify-content-center">
        <center>
            <div class="failure-message d-flex flex-column">
                <a href="../inbox.jsp" style="text-align: right;"><i class="fa-solid fa-xmark"></i></a>
                <span><%= (String)request.getAttribute("sendFailure") %></span>
            </div>
        </center>
    </div>
    <jsp:include page="../inbox.jsp" />
</body>
<script language="JavaScript">
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>