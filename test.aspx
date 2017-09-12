<%@ Page Language="javascript" %>
<%
        var id=Request.Form("txtStudentId");
        var fname=Request.Form("txtFirstName");
        var lname=Request.Form("txtLastName");
        var bday=Request.Form("txtBdate");
        var pwd=Request.Form("txtPassword");
      
        ////////////////////
        var myconStudent=new ActiveXObject("ADODB.Connection"); 
        var myrecStudent=new ActiveXObject("ADODB.Recordset");
        myconStudent.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:/420-P65-AS ASP/omnivox3/App_Data/lasalleCollegeDB.accdb");
        
        var sql;
        sql="SELECT * From Student";
        myrecStudent.Open(sql, myconStudent);
        
        var heIsAStudent=false;
        var heIsAMember=false;
        
        while(!myrecStudent.EOF){ 
            if(myrecStudent.Fields("studentID").Value==id|| 
                myrecStudent.Fields("firstName").Value==fname||
                myrecStudent.Fields("lastName").Value==lname||
                myrecStudent.Fields("birthDate").Value==bday
                )
            {
                heIsAStudent=true;
               
            }
            myrecStudent.MoveNext();
        }
        
        if(heIsAStudent==false)
        {
        Session("msgNotStudent")="You are not student of lasalle college";
        Response.Redirect("index.aspx");
        }
        
        var mycon=new ActiveXObject("ADODB.Connection"); 
        var myrec=new ActiveXObject("ADODB.Recordset");
        mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:/420-P65-AS ASP/omnivox3/App_Data/omnivoxDB.accdb");
    sql="SELECT StudentID FROM members";

        myrec.Open(sql,mycon);
        while(!myrec.EOF){
            if(myrec.Fields("StudentID").Value==id)
            {
                 Session("msgAlreadyMember")="You are Already member";
                Response.Redirect("index.aspx",false);
            } 
            myrec.MoveNext();
        }

        var sql;
        sql="INSERT INTO members(StudentID,[Password],firstName,lastName) values('"+id+"','"+pwd+"','"+fname+"','"+lname+"')";
        
        mycon.Execute(sql);
        Session("msgBeMember")="You are register";
        Response.Redirect("index.aspx",false);
    %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <%= id%><br />
    <%= fname%><br />
    <%= lname%><br />
    <%= bday%><br />
    <%= pwd%><br />
</body>
</html>
