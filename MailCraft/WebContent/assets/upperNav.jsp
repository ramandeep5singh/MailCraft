<div class="upper-nav d-flex justify-content-around">
    <div class="logo">
        <h1>MailCraft Pro</h1>
    </div>
    <div class="search-bar d-flex flex-column justify-content-center">
        <div class="search-cont position-relative">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" name="search" id="search" placeholder="Search here" onkeyup="emailSuggestions(this.value)" onblur="disappearSearch()">
            <table id="suggestions-table" class="search-table position-absolute" style="display: none;">
            </table>
        </div>
    </div>
    <div class="profile d-flex flex-column justify-content-center position-relative">
        <div class="profile-in">
            <span>
                <%  String email = (String)session.getAttribute("email"); %>
                <jsp:useBean id="mb" class="pack.MailBean" >
                    <jsp:setProperty name="mb" property="email" value="<%= email %>" />
                </jsp:useBean>
                <%  String name = mb.getName(); %>
                <%= name %>
            </span>
            <i class="fa-solid fa-bars profile-button" onclick="profileCard(1)"></i>
            <div id="profile-card" style="display: none;" class="profile-info position-absolute">
                <i class="fa-solid fa-xmark position-absolute" onclick="profileCard(2)"></i>
                <center style="height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-around;">
                    <div class="profile-email">
                        <span><%= email %></span>
                    </div>
                    <div class="profile-icon">
                        <span><%= name.charAt(0) %></span>
                    </div>
                    <div class="profile-name">
                        <span><%= name %></span>
                    </div>
                    <div class="profile-logout">
                        <a href="logout">LOGOUT</a>
                    </div>
                </center>
            </div>
        </div>
    </div>
</div>
<script>
    function emailSuggestions(qry){
        document.getElementById("suggestions-table").style.display = "block";
        $.ajax({
            type: "GET",
            url: "search", //SearchServlet url
            data: {query: qry},
            success: function(response){
                console.log("Response Object: ", response);
                $("#suggestions-table").html(response.suggestions);
            }
        });
    }
    function disappearSearch(){
        document.getElementById("suggestions-table").style.display = "none";
    }
</script>