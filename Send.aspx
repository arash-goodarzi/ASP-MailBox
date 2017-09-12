<%@ Language="javascript" %>
<%        
        var mycon=new ActiveXObject("ADODB.Connection"); 
        var myrec=new ActiveXObject("ADODB.Recordset");

        var sub=Request.Form("txtSubject");
        var sender=Request.Form("cboSender");
        var cont=Request.Form("txtContent");
        var sql;
       // sql="INSERT INTO messages(title,content,senderID,recieveID) values('"+sub+"','"+cont+"',"+Session("user")+","+sender+")";
    sql="INSERT INTO messages(title,content,senderID,recieveID) values('"+sub+"','"+cont+"',"+Session("user")+","+sender+")";   
     mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb");
        mycon.Execute(sql);
        
        //mycon.Close();
       Response.Redirect("mailBox.aspx?txtUsername="+Session("id")+"&txtPassword="+Session("pwd"));
    
     %>
<!DOCTYPE html>

<script>

</script>

<html>
<head>
    <title></title>
</head>
<body>
    <%= Session("id") %><br />
    <%= Session("pwd") %><br />
    <%= Session("user") %><br />
    <%= sub %><br />
    <%= sender %><br />
    <%= cont %><br />
    <%= sql %><br />
</body>
</html>
