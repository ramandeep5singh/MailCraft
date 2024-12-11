<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<%  String name = request.getParameter("fname")+" "+request.getParameter("lname");
    name = name.toUpperCase();
    String dob = request.getParameter("dob");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
%>
<jsp:useBean id="bean" class="pack.Bean">
    <jsp:setProperty name="bean" property="name" value="<%= name %>" />
    <jsp:setProperty name="bean" property="dob" value="<%= dob %>" />
    <jsp:setProperty name="bean" property="email" value="<%= email %>" />
    <jsp:setProperty name="bean" property="password" value="<%= password %>" />
</jsp:useBean>

<%  if(!bean.checkUser()){%>

<div class="position-absolute">
    <span style="color: red;
    top: 10vw;
    left: 13vw;">Account already exists!!</span>
</div>
<jsp:include page="newUser.jsp" />
    <% }
    else if(bean.addUser()){ %>
<div class="position-absolute" style="top: 12vw;
right: 16vw;
z-index: 100;">
    <center><span style="color: red;">Account Created successfully!!</span></center>
</div>
<jsp:include page="index.jsp" />
    <%}
    else{ %>
        <div class="position-absolute" style="top: 12vw;
        left: 16vw;
        z-index: 100;">
            <center><span style="color: red;">Something went wrong!!</span></center>
        </div>
        <jsp:include page="newUser.jsp" />
    <%}
%>
<script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
