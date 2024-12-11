if ( window.history.replaceState ) {
    window.history.replaceState( null, null, window.location.href );
}

<script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }

    function checkForm(){
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;

        if(email=="" || password==""){
            document.getElementById("login-email").style.border = "0.2vw solid red";
            document.getElementById("s1").style.color = "red";
            document.getElementById("login-password").style.border = "0.2vw solid red";
            document.getElementById("s2").style.color = "red";
            window.alert("Fill credentials properly!!");
            return false;
        }
        document.getElementById("login-email").style.border = "0.2vw solid red";
        document.getElementById("s1").style.color = "red";
        document.getElementById("login-password").style.border = "0.2vw solid red";
        document.getElementById("s2").style.color = "red";
        return true;
    }
    function final(){
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;

        if(email==""){
            document.getElementById("login-email").style.border = "0.2vw solid red";
            document.getElementById("s1").style.color = "red";
            window.alert("email id required!!");
        }
        else{
            document.getElementById("login-password").style.display = "block";
            document.getElementById("next").style.display = "none";
            document.getElementById("submit").style.display = "block";
        }
    }
    function checkNull(x){
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;

        switch(x){
            case 1:
                if(email===""){
                    document.getElementById("login-email").style.border = "0.2vw solid red";
                    document.getElementById("s1").style.color = "red";
                }
                else{
                    document.getElementById("login-email").style.border = "0.2vw solid green";
                    document.getElementById("s1").style.color = "green";
                }
                break;
            case 2:
                if(password===""){
                    document.getElementById("login-password").style.border = "0.2vw solid red";
                    document.getElementById("s2").style.color = "red";
                }
                else{
                    document.getElementById("login-password").style.border = "0.2vw solid green";
                    document.getElementById("s2").style.color = "green";
                }
                break;
        }
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    }
</script>

<section class="index-section d-flex position-fixed">
    <div class="left-gradient">
        <img src="assets/required-imgs/mailing-bakground.jpg" alt="ramandeep">
    </div>
    <div class="form d-flex flex-column">
        <h1 class="login-heading">
            LOGIN TO MailCraft Pro
        </h1>
        <center>
            <form class="position-relative" onsubmit="return checkForm()" action="login" method="post">
                <div id="login-email" class="form-input position-relative">
                    <span id="s1" class="position-absolute">Email</span>
                    <input id="email" name="email" type="text" placeholder="Enter email"  onblur="checkNull(1)">
                </div>
                <div id="login-password" class="form-input position-relative" style="display: none;">
                    <span id="s2" class="position-absolute">Password</span>
                    <input id="password" name="password" type="password" placeholder="Enter password"  onblur="checkNull(2)">
                </div>
                <div class="create-next d-flex justify-content-center">
                    <a href="regsiter.jsp">Create Account</a>
                    <a id="next" onclick="final()">Next</a>
                </div>
                <div id="submit" class="submit-button">
                    <button type="submit">Login</button>
                </div>
            </form>
        </center>
    </div>
</section>