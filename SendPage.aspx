<%@ Language="javascript" %>
<% 
        var mycon=new ActiveXObject("ADODB.Connection"); 
        var myrec=new ActiveXObject("ADODB.Recordset");
        var varRefferMember=Request.QueryString("reffMember");

        var sql;
        sql="SELECT RefMember,lastName,firstName,StudentID FROM members";
        mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\420-P65-AS ASP\\omnivox3\\App_Data\\omnivoxDB.mdb");
        myrec.Open(sql, mycon);

    
    
    
    
    %>


<html>
<head>
    <title></title>
    <style>
        div{
            border: 9px inset rgba(51,153,0,0.65);
            width:800px;
            height:494px;
            margin-left:auto;
            margin-right:auto;
            display:block;
        }
        td{
            padding-left:10px;
            padding-top:10px;
        }
        td input#tdTitle{
            width:650px;
            border: 3px inset rgba(51,153,0,0.65);
        }
        td input#cboTo{
            
            width:650px;
            border: 3px inset rgba(51,153,0,0.65);
        }
        td input#tdSubject{
            height:300px;
            width:650px;
            border: 5px inset rgba(51,153,0,0.65);
            vertical-align: text-bottom;
        }
        textarea { 
            vertical-align: top; 
            background-color:#99ff99;
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
        #cboTo {
            width: 650px;
        }
    </style>
</head>
<body>
    <div>
        <form action="Send.aspx" method="post">
            <table><br />
                <tr>
                    <td>Title</td>
                    <td>
                        <input id="tdTitle" type="text" name="txtSubject" value="" required="required"/></td>
                </tr>
                <tr>
                    <td>To</td>
                    <td>                       
                        <select name="cboSender" id ="cboTo" size="1">
                            <% while(!myrec.EOF){ %>
                            <option value="<%=myrec.Fields("RefMember").Value %>"><%= myrec.Fields("firstName").Value %><%= myrec.Fields("lastName").Value %>-<%= myrec.Fields("StudentID").Value %></option>
                            <% myrec.MoveNext(); } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">Subject</td>
                    <td>
                        <textarea id="txtContent" rows="20" cols="90" name="txtContent" />    
                        </textarea>
                    </td>
                </tr>
                <tr >
                    <td colspan="2"> <input class="button" type="submit"  value="Send" />
                        <input class="button type="reset"  value="Clear" />
                    </td>

                </tr>
            </table>
        </form>
    </div>
</body>
</html>
