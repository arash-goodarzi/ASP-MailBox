<%@ Language="javascript" %>

<script>

</script>

<html>
<head>
    
    <title></title>
    <style>
        body{

            background: url(./pic/mailbox-Stock-Photo.png) repeat;
            background-size: cover;
        }
        h1 {
            text-align:center;
            color: #001a00;
            text-shadow: 2px 2px 4px #000000;
        }
        h2 {
            text-align: center;
            color: #001a00;
            text-shadow: 2px 2px 4px #063102;
        }
        #mainMenu {
            margin-top:40px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 50px 15px;
            box-shadow: 10px 10px;
            background-color: #BE81F7;
            width: 350px;
            height: 470px;
            opacity: 0.8;
            filter: alpha(opacity=80); /* For IE8 and earlier */


        }
        td.fistTd{
            padding-left:15px;
            padding-right:5px;
                        font-weight: bold;
        }
        .button{
            display: inline-block;
            padding: 10px 10px;
            font-size: 10px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #00ff00;
            background-color: #001a00;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px #000000;
            margin:40px;
            width:70px;
            margin-top:5px;
        }
    </style>
</head>
<body>
    <div id="mainMenu">
        <form action="test.aspx" method="post">
            <br />
            <h1>Registreation</h1>
            <br />
            <hr />
            <h2>Please fill all of textBox</h2>
            <table>
                <tr>
                    <td class="fistTd">Student ID:</td>
                    <td colspan="3"><input type="text" name="txtStudentId" value="" /></td>
                </tr>
                <tr>
                    <td class="fistTd">First name:</td>
                    <td colspan="3"><input type="text" name="txtFirstName" value="" /></td>
                </tr>
                <tr>
                    <td class="fistTd">Last name:</td>
                    <td colspan="3"><input type="text" name="txtLastName" value="" /></td>
                </tr>
                <tr>
                    <td class="fistTd">Birthday: </td>
                    <td colspan="3"><input type="date" name="txtBdate" value="" size="1" maxlength="4"/></td>
                </tr>
                <tr>
                    <td class="fistTd">Password</td>
                    <td colspan="3"><input type="password" name="txtPassword" value="" /></td>
                </tr>
                <tr>
                    <td class="fistTd">Password again</td>
                    <td colspan="3"><input type="password" value="" /><br /></td>
                </tr>
                <tr>
                    <td class="fistTd" colspan="4"><br /><input class="button" type="submit" value="Register" /><input class="button" type="reset" value="Clear" /></td>
                </tr>
            </table>

            
            
            
            
            
            
        </form>
    </div>


</body>
</html>
