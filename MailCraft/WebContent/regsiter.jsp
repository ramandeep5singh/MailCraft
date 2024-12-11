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
    <link rel="stylesheet" href="assets/styles.css">
    <title>Create SSAcount</title>
</head>
<script> 
    let count = 0;

    let date = new Date();
    document.getElementById("date").setAttribute("max",date);

    function showNext(){
        let firstName = document.getElementById("firstName").value;
        let lastName = document.getElementById("lastName").value;
        let date = document.getElementById("date").value;
        let sque = document.getElementById("sque").value;
        let userName = document.getElementById("userName").value;
        let password1 = document.getElementById("password1").value;
        let password2 = document.getElementById("password2").value;
        
        switch(count){
            case 0:
                if(firstName==="" && lastName===""){
                    document.getElementById("form-input1").style.border = "0.2vw solid red";
                    document.getElementById("s1").style.color = "red";
                    document.getElementById("form-input2").style.border = "0.2vw solid red";
                    document.getElementById("s2").style.color = "red";
                } 
                else{
                    document.getElementById("d0").style.display = "none";
                    document.getElementById("d1").style.display = "block";
                    document.getElementById("d2").style.display = "none";
                    document.getElementById("d3").style.display = "none";
                    document.getElementById("previous").style.display = "block";
                    count++;
                }
                break;
            case 1:
                if(date==="" && sque==""){
                    document.getElementById("form-input3").style.border = "0.2vw solid red";
                    document.getElementById("s3").style.color = "red";
                    document.getElementById("form-input4").style.border = "0.2vw solid red";
                    document.getElementById("s4").style.color = "red";
                    
                } 
                else{
                    document.getElementById("d0").style.display = "none";
                    document.getElementById("d1").style.display = "none";
                    document.getElementById("d2").style.display = "block";
                    document.getElementById("d3").style.display = "none";
                    count++;
                }
                break;
            case 2:
                if(userName===""){
                    document.getElementById("form-input6").style.border = "0.2vw solid red";
                    document.getElementById("s6").style.color = "red";
                } 
                else{
                    document.getElementById("d0").style.display = "none";
                    document.getElementById("d1").style.display = "none";
                    document.getElementById("d2").style.display = "none";
                    document.getElementById("d3").style.display = "block";
                    document.getElementById("next").style.display = "none";
                    document.getElementById("submit").style.display = "block";
                    count++;
                }
                break;

        }
    }
    function showPrevious(){
        switch(count){
            case 1:
                document.getElementById("d0").style.display = "block";
                document.getElementById("d1").style.display = "none";
                document.getElementById("d2").style.display = "none";
                document.getElementById("d3").style.display = "none";
                document.getElementById("previous").style.display = "none";
                count--;
                break;
            case 2:
                document.getElementById("d0").style.display = "none";
                document.getElementById("d1").style.display = "block";
                document.getElementById("d2").style.display = "none";
                document.getElementById("d3").style.display = "none";
                count--;
                break;
            case 3:
                document.getElementById("d0").style.display = "none";
                document.getElementById("d1").style.display = "none";
                document.getElementById("d2").style.display = "block";
                document.getElementById("d3").style.display = "none";
                document.getElementById("next").style.display = "block";
                document.getElementById("submit").style.display = "none";
                count--;
                break;
        }
    }
    function checkNull(x){
        let firstName = document.getElementById("firstName").value;
        let lastName = document.getElementById("lastName").value;
        let date = document.getElementById("date").value;
        let sque = document.getElementById("sque").value;
        let userName = document.getElementById("userName").value;
        let password1 = document.getElementById("password1").value;
        let password2 = document.getElementById("password2").value;
        switch(x){
            case 1:
                if(firstName===""){
                    document.getElementById("form-input1").style.border = "0.2vw solid red";
                    document.getElementById("s1").style.color = "red";
                }
                else{
                    document.getElementById("form-input1").style.border = "0.2vw solid green";
                    document.getElementById("s1").style.color = "green";
                }
                break;
            case 2:
                if(lastName===""){
                    document.getElementById("form-input2").style.border = "0.2vw solid red";
                    document.getElementById("s2").style.color = "red";
                }
                else{
                    document.getElementById("form-input2").style.border = "0.2vw solid green";
                    document.getElementById("s2").style.color = "green";
                }
                break;
            case 3:
                if(date===""){
                    document.getElementById("form-input3").style.border = "0.2vw solid red";
                    document.getElementById("s3").style.color = "red";
                }
                else{
                    document.getElementById("form-input3").style.border = "0.2vw solid green";
                    document.getElementById("s3").style.color = "green";
                }
                break;
            case 4:
                if(sque===""){
                    document.getElementById("form-input4").style.border = "0.2vw solid red";
                    document.getElementById("s4").style.color = "red";
                }
                else{
                    if(sque.includes(' ')){
                        document.getElementById("form-input4").style.border = "0.2vw solid red";
                        document.getElementById("s4").style.color = "red";
                        window.alert("userName must not contain space and should be unique!")
                    }
                    else{
                        document.getElementById("form-input4").style.border = "0.2vw solid green";
                        document.getElementById("s4").style.color = "green";
                    } 
                }
                break;
            case 6:
                if(lastName===""){
                    document.getElementById("form-input6").style.border = "0.2vw solid red";
                    document.getElementById("s4").style.color = "red";
                }
                else{
                    document.getElementById("form-input6").style.border = "0.2vw solid green";
                    document.getElementById("s6").style.color = "green";
                }
                break;
            case 7:
                if(password1===""){
                    document.getElementById("form-input7").style.border = "0.2vw solid red";
                    document.getElementById("s7").style.color = "red";
                }
                else{
                    document.getElementById("form-input7").style.border = "0.2vw solid green";
                    document.getElementById("s7").style.color = "green";
                }
                break;
            case 8:
                if(password1===""){
                    document.getElementById("form-input8").style.border = "0.2vw solid red";
                    document.getElementById("s8").style.color = "red";
                }
                else{
                    document.getElementById("form-input8").style.border = "0.2vw solid green";
                    document.getElementById("s8").style.color = "green";
                }
                break;
        }
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    }
</script>
<body>
    <section class="index-section d-flex position-fixed">
        <div class="form d-flex flex-column">
            <h1 class="login-heading">
                Sign In to MailCraftPro
            </h1>
            <center>
                <span id="signup-heading" style="font-size: 2vw;
                font-family: cursive;
                color: #00d2ff;">Enter your details</span>
                <form action="newUser.jsp" method="post">
                    <div id="d0">
                        <div id="form-input1" class="form-input position-relative">
                            <span id="s1" class="position-absolute">First Name</span>
                            <input id="firstName" name="fname" type="text" placeholder="Enter First Name" required onblur="checkNull(1)">
                        </div>
                        <div id="form-input2" class="form-input position-relative">
                            <span id="s2" class="position-absolute">Last Name</span>
                            <input id="lastName" name="lname" type="text" max="DD-MM-YYYY" placeholder="Enter Last Name" required onblur="checkNull(2)">
                        </div>
                    </div>
                    <div id="d1">
                        <div id="form-input3" class="form-input position-relative">
                            <span id="s3" class="position-absolute">Date of Birth</span>
                            <input id="date" name="dob" type="date" required onblur="checkNull(3)">
                        </div>
                    </div>
                    <div id="d2">
                        <div id="form-input6" class="form-input position-relative">
                            <span id="s6" class="position-absolute">E-Mail ID</span>
                            <input id="userName" name="email" type="email" placeholder="Enter email id" required onblur="checkNull(6)">
                        </div>
                    </div>
                    <div id="d3">
                        <div id="form-input7" class="form-input position-relative">
                            <span id="s7" class="position-absolute">Password</span>
                            <input id="password1" type="password" placeholder="Enter Password" required onblur="checkNull(7)">
                        </div>
                        <div id="form-input8" class="form-input position-relative">
                            <span id="s8" class="position-absolute">Confirm Password</span>
                            <input id="password2" name="password" type="password" placeholder="Re-Enter Password" required onblur="checkNull(8)">
                        </div>
                    </div>
                    <!--<div class="create-next d-flex justify-content-center">
                        <a id="previous" style="display: none;" type="button" onclick="showPrevious()">Previous</a>
                        <a id="next" type="button" onclick="showNext()">Next</a>
                    </div>-->
                    <div id="submit" class="submit-button">
                        <button type="submit">SignUp</button>
                    </div>
                </form>
            </center>
        </div>
        <div class="left-gradient d-sm-block">
            <img src="assets/required-imgs/mailing-bakground.jpg" alt="ramandeep">
        </div>
    </section>
</body>
</html>