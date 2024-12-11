<script>
    function verifyMail(){
        let to = document.getElementById('to').value;

        // Regular expression for basic email validation
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(to)) {
            alert('Please enter a valid email address.');
            return false; // Prevent form submission
        }

        // Continue with form submission if the email is valid
        return true;
    }
    function checkNull(x){
        let to = document.getElementById("to").value;
        let message = document.getElementById("message").value;

        switch(x){
            case 1:
                if(to==""){
                    document.getElementById("s1").style.display = "block";
                }
                else{
                    document.getElementById("s1").style.display = "none";
                }
                break;
            case 2:
                if(message==""){
                    document.getElementById("s2").style.display = "block";
                }
                else{
                    document.getElementById("s2").style.display = "none";
                }
                break;
        }
    }
    function mailCheck(){
        let to = document.getElementById("to").value;
        let message = document.getElementById("message").value;
        let form = document.getElementById("compose-form");

        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(to=="" || message==""){
            if(to=="" && message!=""){
                document.getElementById("s1").style.display = "block";
                document.getElementById("s2").style.display = "none";
                return false;
            }
            else if(to!="" && message==""){
                document.getElementById("s1").style.display = "none";
                document.getElementById("s2").style.display = "block";
                return false;
            }
            else{
                document.getElementById("s1").style.display = "block";
                document.getElementById("s2").style.display = "block";
                return false;
            }
        }
        else if(!emailRegex.test(to)){
            alert('Please enter a valid email address.');
            return false;
        }
        else{
            document.getElementById("compose-overlay").style.display = "none";
            form.action = "send";
            form.method = "post";
        }
    }
    function dispatchDraft(){
        let to = document.getElementById("to").value;
        let message = document.getElementById("message").value;
        let subject = document.getElementById("sub").value;
        let form = document.getElementById("compose-form");

        if(to=="" || message==""){
            document.getElementById("s1").style.display = "block";
            document.getElementById("s2").style.display = "block";
            return false;
        }
        else{
            form.action = "assets/saveDraft.jsp";
            form.method = "post";
        }
    }
    function updateFileStatus(){
        let file = document.getElementById("file");
        let fileStatus = document.getElementById("file-select-status");

        if(file.files.length > 0){
            fileStatus.textContent = input.files[0].name;
        }
        else{
            fileName.textContent = "not selected properly";
        }
    }
</script>
<section class="compose-page d-flex flex-column justify-content-center">
    <center style="height: fit-content;">
        <form id="compose-form" action="" method="post" enctype="multipart/form-data">
            <div class="compose-card">
                <div class="compose-head d-flex justify-content-between">
                    <span>New Message</span>
                    <i class="fa-solid fa-xmark" onclick="showComposeForm(2)"></i>
                </div>
                <div class="compose-to-sub d-flex justify-content-between position-relative">
                    <span>To</span>
                    <input id="to" name="reciever" value="" type="email" placeholder="Enter Reciever's Address" onblur="checkNull(1)" required>
                    <span id="s1" class="position-absolute" style="display: none; bottom: 0; right: 0; font-weight: 200; font-size: 1vw; color: red;">Reciever's address required</span>
                </div>
                <div class="compose-to-sub d-flex justify-content-between">
                    <span>Subject</span>
                    <input id="sub" type="text" value="" name="subject" placeholder="Enter Subject">
                </div>
                <div class="compose-message position-relative">
                    <textarea onblur="checkNull(2)" name="message" id="message" rows="12" placeholder="Write your message"></textarea>
                    <span id="s2" class="position-absolute" style="display: none; bottom: 1vw; right: 1vw; font-size: 1vw; color: red;">Message required!</span>
                </div>
                <div class="compose-buttons d-flex justify-content-between">
                    <button id="save-draft" type="submit" onclick="return dispatchDraft()">Save Draft</button>
                    <div class="file-select d-flex flex-column">
                        <!--<label for="file" class="d-flex flex-column justify-content-center">
                            <i class="fa-solid fa-paperclip" style="font-size: 1.5vw; cursor: pointer;"></i>
                        </label>-->
                        <input type="file" name="file" id="file" onchange="updateFileStatus()" style="width: 13vw;
                        font-size: 1vw;">
                        <!--<span id="file-select-status">No file Chosen</span>-->
                    </div>
                    <button type="submit" onclick="return mailCheck();">SEND</button>
                </div>
            </div>
        </form>
    </center>
</section>