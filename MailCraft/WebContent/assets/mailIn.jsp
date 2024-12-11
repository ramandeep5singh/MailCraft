<%
    String reciever = (String)session.getAttribute("email");
    String email = request.getParameter("sender");
    String heading = request.getParameter("heading");
    String message = request.getParameter("message");
    String attachment = request.getParameter("attachment");
%>
<jsp:useBean id="mb" class="pack.MailBean" >
    <jsp:setProperty name="mb" property="email" value="<%= email %>" />
    <jsp:setProperty name="mb" property="heading" value="<%= heading %>" />
    <jsp:setProperty name="mb" property="message" value="<%= message %>" />
</jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="styles.css">
    <title></title>
</head>
<body class="mail-page-body position-absolute d-flex flex-column">
    <div id="compose-overlay" class="compose-overlay position-fixed">
        <jsp:include page="compose.jsp" />
    </div>
    <section id="mail-head" class="mail-cover d-flex justify-content-between">
        <div class="mail-sub d-flex flex-column justify-content-center">
            <h3>
                <jsp:getProperty name="mb" property="heading" />
            </h3>
        </div>
        <div class="mailer d-flex flex-column">
            <span>
                <%= mb.getName() %>
            </span>
            <span>
                <jsp:getProperty name="mb" property="email" />
            </span>
        </div>
    </section>
    <section id="mail-mid" class="mail-page-mid">
        <div class="mail-message">
            <p>
                <jsp:getProperty name="mb" property="message" />
            </p>
            <% if(attachment!=null){ %>
                <a href="../attachments/<%= reciever %>/<%= attachment %>" target="_blank">Click to download your attachment!!</a>
            <% } %>
        </div> 
    </section>
    <section id="mail-footer" class="mail-cover d-flex justify-content-center">
        <div class="mail-req-buttons d-flex">
            <form action="../inbox.jsp" method="post">
                <button type="submit">CLOSE</button>
            </form>
            <button type="button" onclick="reply()">REPLY</button>
        </div>
        <div class="mail-forward">
            <i class="fa-regular fa-share-from-square"></i>
            <span>forward</span>
        </div>
    </section>
    <script>
        function reply(){
            document.getElementById("to").value = "<%= mb.getEmail() %>";
            document.getElementById("to").disabled = true;
            document.getElementById("compose-overlay").style.display = "block";
        }
    </script>
</body>
</html>