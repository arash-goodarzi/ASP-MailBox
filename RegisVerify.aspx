<%@ Page Language="javascript" %>
<%
        var id=Request.Form("txtStudentId");
        var fname=Request.Form("txtFirstName");
        var lname=Request.Form("txtLastName");
        var bday=Request.Form("txtBdate");
        var pwd=Request.Form("txtPassword");

        var mycon=new ActiveXObject("ADODB.Connection"); 
        var myrec=new ActiveXObject("ADODB.Recordset");
        mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\lasalleCollegeDB.mdb;Persist Security Info=True");
        
        var sql;
        sql="SELECT * From Student";
        myrec.Open(sql, mycon);
        
        var heIsAStudent=false;
        var heIsAMember=false;
        
        while(!myrec.EOF){ 
            if(myrec.Fields("studentID").Value==id|| 
                myrec.Fields("firstName").Value==fname||
                myrec.Fields("lastName").Value==lname||
                myrec.Fields("birthDate").Value==bday
                )
            {
                heIsAStudent=true;
               
            }
        }
        
        //if(heIsAStudent==false){Response.Redirect("registrationPage.aspx");}
       // myrec.Close;
       // mycon.Close();

        var mycon2=new ActiveXObject("ADODB.Connection"); 
        var myrec2=new ActiveXObject("ADODB.Recordset");
        mycon2.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb;Persist Security Info=True");
        sql="SELECT * From members WHERE StudentID='"+id+"'";
        myrec2.Open(sql, mycon2);
        while(!myrec.EOF){ 
            if(myrec.Fields("studentID").Value==id)
            {
                heIsAMember=true;
                Response.Redirect("registrationPage.aspx");
            }
        }
            ///now it pass all=>register


    var sqlMessage ="INSERT INTO members(StudentID, Password, firstName, lastName) VALUES('" +id+"','"+pwd+"'," + fname + "," + lname+")";
    mycon2.Execute(sqlMessage);
    //sql="INSERT INTO members(StudentID, Password, firstName, lastName) VALUES(
    //'"+id+"','"+pwd+"','"+fname+"','"+lname+"')";
    //mycon2.Execute(sql);
    //Response.Write(sql);
    Response.Redirect("index.aspx");
%>