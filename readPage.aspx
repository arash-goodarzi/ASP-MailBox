<%@ Language="javascript" %>
<% 
        var sql;
        var varRefferMessage=Request.QueryString("refferMessage");
        var myconForMessage=new ActiveXObject("ADODB.Connection");
        var myrecForMessage=new ActiveXObject("ADODB.Recordset");
        sql="SELECT refMessage,content From messages";
        myconForMessage.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb");
        myrecForMessage.Open(sql, myconForMessage);
    
    
     %>
<script >

</script>

<html>
<head>
    <title></title>
    <%=Session("user") %>
</head>
<body>
        <% while(!myrecForMessage.EOF){ %>
        <% if(myrecForMessage.Fields("refMessage").Value==varRefferMessage){%>
        <div><%= myrecForMessage.Fields("content").Value%></div>

        <% } myrecForMessage.MoveNext(); } %>
    <div>
    </div>

</body>
</html>
