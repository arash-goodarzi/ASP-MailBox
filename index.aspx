<%@ Language="javascript" %>


<script>

</script>

<html >
<head >
    <title></title>
    <style>
 div.backgroundHead {
     background: url(./pic/15.png) repeat;
     border: 2px solid black;
     background-size: cover;
     height:350px;

}

 div.transbox {
     margin: 30px;
     background-color: #ffffff;
     border: 1px solid black;
     opacity: 0.9;
     filter: alpha(opacity=60); /* For IE8 and earlier */
}
 IMG.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
 div.backgroundMain{
     background: url(./pic/Mailbox.png) no-repeat right top;
     background-size:300px 150px;
     height:250px;
     width:500px;
     border: 2px solid black;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top:40px;
 }
 body {
     background: url("") no-repeat center center fixed;
     background-size: cover;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
} 
.button {
    display: inline-block;
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    outline: none;
    color: #000000;
    background-color: #808080;
    border: none;
    border-radius: 15px;
    box-shadow: 0 5px #000000;
    margin-left: 4px;
    width:70px;
    margin-top:5px;
        }


</style>

</head>
<body>
    <div class="backgroundHead">
       <div class="transbox" >
         <p style="justify-content: center">
             <img src="./pic/logo2.png" class="displayed" alt="Alternate Text" /></p>
       </div>
    </div>
    <div class="backgroundMain">
        <form action="mailBox.aspx" method="get">
           <fieldset style="width:10px">
             <legend >member ?</legend>
             user name: <input type="text" name="txtStudentID" value="" size="17" required="required" /><br>
             password: <input type="password" name="txtPassword" value="" size="17" required="required" /><br>
               <input class="button" type="submit"  value="Enter" />
               <input class="button" type="reset"  value="Clear" />
           </fieldset>
        </form>
        <br /><br />
        <form action="registrationPage.aspx" method="get">
            <fieldset>
                Not memeber yet?
                <input class="button" type="submit" name="register" value="Register" />
            </fieldset>
        </form>      
    </div>
        <p style="color:red;font-weight:bold"><%= Session("msg") %></p>
        <p style="color:red;font-weight:bold"><%= Session("msgNotStudent") %></p>
        <p style="color:red;font-weight:bold"><%= Session("msgAlreadyMember") %></p>
        <p style="color:red;font-weight:bold"><%= Session("msgBeMember") %></p>
    
    
</body>
</html>
