<%@ Language="javascript" %>
<% 
        var mycon=new ActiveXObject("ADODB.Connection"); 
        var myrec=new ActiveXObject("ADODB.Recordset");
        var varStudentID=Request.QueryString("txtStudentID");
        var varPassword=Request.QueryString("txtPassword");
        var sql;

        var varFirstName;
        var varLastName;
        var colorOfRow="pink"; 
        
        sql="SELECT * From members";
        mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb");
        myrec.Open(sql, mycon,3);
        var findData=false; 
        while(!myrec.EOF){ 
        if((myrec.Fields("StudentID").Value==varStudentID)&&(myrec.Fields("Password").Value==varPassword)){
        findData=true;
        varFirstName=myrec.Fields("firstName").Value;
        varLastName=myrec.Fields("lastName").Value;
        var refMember=myrec.Fields("RefMember").Value;
            Session("user")=parseInt(myrec.Fields("RefMember"));
            Session("id")=varStudentID;
            Session("pwd")=varPassword;
        } 

        
        myrec.MoveNext(); } 
        if(findData==false){
    Session("msg")="StudentID or password incorrect. try again";
        Response.Redirect("index.aspx",false);
        
        }
        myrec.MoveFirst();
        numberOfMessage=myrec.RecordCount;
        ////////////////////
        //second querry
        var numberOfMessage;
        var myconForMessage=new ActiveXObject("ADODB.Connection");
        var myrecForMessage=new ActiveXObject("ADODB.Recordset");
        sql="SELECT * From messages,members WHERE  senderID=RefMember" ;
        myconForMessage.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb");
        myrecForMessage.Open(sql, myconForMessage,3);

        

     %>
<html>
<head>
    <title></title>
    <style>
        *{padding:0;margin:0;}
         div.backgroundHead {
            background-color:green;
         }

        div.transbox {
         margin: 30px;
         background-color: #ffffff;
         border: 1px solid black;
         opacity: 0.9;
        }
         IMG.displayed {
        display: block;
        margin-left: auto;
        margin-right: auto }


        .main-nav {width:180px;background: #ff3333;}
        .main-nav li{list-style:none;}
        .main-nav a{color:#FFF; text-transform:uppercase;letter-spacing: .2em; 
			text-decoration:none;display:block;padding:10px 0 10px 20px;
			border-bottom:1px dotted gray;}
        .main-nav a:hover{background:#ff0000;}
        .main-nav-ul ul a:before {content: '\203A' ; margin-right:20px;}
        .main-nav-ul ul {display:none;}
        .main-nav-ul li.tap ul{display:block;}
        .main-nav .sub-arrow:after {
		content: '\203A';
		float:right;
		margin-right:20px;
		transform: rotate(90deg);
		-webkit-transform: rotate(90deg);
		-moz-transform: rotate(90deg);
		}
.main-nav li.tap .sub-arrow:after{content: '\2039';}
        nav {
        float:left;	      
        }

    table, th, td {
    border: 1px solid black;
     border-collapse: collapse;
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
    <div>
        <nav class="main-nav">
	        <ul class="main-nav-ul">
		        <li><a href="./mailBox.aspx"> Inbox</a></li>
		        <li><a href="./pages/about_us.html"> OutBox</a></li>
		        <li id="haloween"><a href="SendPage.aspx?reffMember=<%= refMember %>"> Send message</a></li>
		        <li><a href=""> ------</a></li>
		        <li><a href=""> ------</a></li>
		        <li><a href=""> Contact</a></li>
	        </ul>
        </nav>
        <div id="contentPage" style="border: 2px solid red;">
            <h2>Welcome <%=varFirstName %>&nbsp<%=varLastName %>. You have <%=numberOfMessage %> emails</h2>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Sender</th>
                    <th>Date</th>
                    <th></th>
                    <th>Read</th>
                    <th>Delete</th>
                </tr>
            
                    <% while(!myrecForMessage.EOF){ %>
                    <% if((myrecForMessage.Fields("recieveID").Value==refMember)){%>
                    <% if(myrecForMessage.Fields("itsNew").Value){colorOfRow="white";} %>
                    <tr bgcolor=<%= colorOfRow%> >
                        <td><%= myrecForMessage.Fields("title").Value%></td>

                          <td><%= myrecForMessage.Fields("lastName").Value%></td>  
                 
                        <td><%= myrecForMessage.Fields("dateMail").Value%></td>
                        <td><%
                            if(myrecForMessage.Fields("itsNew").Value)
                            Response.Write("red");
                            else 
                            Response.Write("white");
                            %></td>
                        <td><a href="readPage.aspx?refferMessage=<%= myrecForMessage.Fields("refMessage").Value%>" target="_blank">Read it</a></td>
                        <td><a href="#">Remove</a></td>
                    </tr>
                    <%colorOfRow="pink";  %>
                     <%myrec.MoveFirst(); %>
                    <% } myrecForMessage.MoveNext(); }%>
                </table>
        </div>

    </div>
</body>
</html>
