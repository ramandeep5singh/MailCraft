<% Cookie[] cookies = request.getCookies(); %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/styles.css">
    <title>Document</title>
</head>
<script>
    function showComposeForm(x){
        switch(x){
            case 1:
                document.getElementById("compose-overlay").style.display = "block";
                break;
            case 2:
                document.getElementById("compose-overlay").style.display = "none";
                break;
        }
    }
    function profileCard(x){
        switch(x){
            case 1:
                document.getElementById("profile-card").style.display = "block";
                break;
            case 2:
                document.getElementById("profile-card").style.display = "none";
                break;
        }
    }
    function showMailContent(x){
        switch(x){
            case 1:
                document.getElementById("inbox-mails").style.display = "flex";
                document.getElementById("inbox-mails").style.flexDirection = "column";
                document.getElementById("sent-mails").style.display = "none";
                document.getElementById("draft-mails").style.display = "none";
                break;
            case 2:
                document.getElementById("sent-mails").style.display = "flex";
                document.getElementById("sent-mails").style.flexDirection = "column";
                document.getElementById("inbox-mails").style.display = "none";
                document.getElementById("draft-mails").style.display = "none";
                break;
            case 3:
                document.getElementById("draft-mails").style.display = "flex";
                document.getElementById("draft-mails").style.flexDirection = "column";
                document.getElementById("inbox-mails").style.display = "none";
                document.getElementById("sent-mails").style.display = "none";
                break;    
        }
    }
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
<body class="d-flex flex-column" style="height: 100vh;
overflow: hidden;">
<%  if(session!=null){ %>
    <div class="upperNav">
        <jsp:include page="assets/upperNav.jsp" />
    </div>
    <div class="inbox-content d-flex" >
        <jsp:include page="assets/sideNav.html" />
        <div class="content position-relative">
            <div class="mail-content position-relative">
                <div class="content-count position-absolute d-flex flex-column">
                    <div id="inbox-mails">
                        <jsp:include page="assets/mail-content/inboxDisp.jsp" />
                    </div>
                    <div id="sent-mails" style="display:none">
                        <jsp:include page="assets/mail-content/sent.jsp" />
                    </div>
                    <div id="draft-mails" style="display:none">
                        <jsp:include page="assets/mail-content/draft.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="compose-overlay" class="compose-overlay position-fixed">
        <jsp:include page="assets/compose.jsp" />
    </div>
    <% }
    else{ %>
        <jsp:forward page="index.jsp" />
    <% }
%>
</body>
</html>