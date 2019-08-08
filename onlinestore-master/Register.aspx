<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .reg_tbl_style {
            
            text-align:center;
            width: 100%;
            font-weight:bold;
            color:white;
            font-size: 25px;
            padding: 70px;
            display:inline-block;
            margin-left: 161px;
            
        }
        .btnStyle{
            border: 1px solid;
            background-color: darkred;
            width: 90px;
            height: 40px;
            border-radius: 15px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            margin: 7px;
            text-align: center;
            font-family:'Century Gothic';
            color: white;
            font-size: 18px;
            font-weight: bold;    
        }

        .btnStyle:hover {
            background-color: lightsalmon;
         }
        .txt_box {
            width: 200px;
            height: 30px;            
            float:left;
        }
        .lnkbtn {
            background-color:beige;
            color:darkblue;
            border-radius: 10px;
            font-weight: bold;
        }
        td {
            padding:7px;
        }
        .validtxt {
            font-size: 18px;
            color: red;
        }
         
    </style> 
    <div style="margin: 0 auto; align-items:center">
    <table class="reg_tbl_style" style="width: 56%">
    <tr>
        <td >First Name</td>
        <td>
            <asp:TextBox ID="TextBoxFirstNameReg" runat="server" class="txt_box"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxFirstNameReg" ErrorMessage="First name required" ValidationGroup="Group1" class="validtxt"/>        

        </td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td>
            <asp:TextBox ID="TextBoxLastNameReg" runat="server" class="txt_box"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxLastNameReg" ErrorMessage="Last name required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>User Name</td>
        <td>
            <asp:TextBox ID="TextBoxUsrNameReg" runat="server" class="txt_box"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxUsrNameReg" ErrorMessage="User name required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>E-Mail</td>
        <td>
            <asp:TextBox ID="TextBoxEMailReg" runat="server" class="txt_box"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEMailReg" ErrorMessage="Email Not Valid" ForeColor="#ff6347" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxEMailReg" ErrorMessage="Email required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>Password</td>
        <td>
            <asp:TextBox ID="TextBoxPasswReg" runat="server" class="txt_box" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxPasswReg" ErrorMessage="Password required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>Confirm Password</td>
        <td>
            <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" class="txt_box"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both Passwords must be the same" ControlToCompare="TextBoxPasswReg" ControlToValidate="TextBoxConfirmPass" ForeColor="#ff6347"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxConfirmPass" ErrorMessage="Confirn password required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>
            
        </td>
        <td>
            <asp:Button ID="Button8" runat="server" CssClass="btnStyle" OnClick="Button8_Click" Text="Submit" style="float:right" ValidationGroup="Group1" />
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UsersData]"></asp:SqlDataSource>
            <input id="Reset1" type="reset" value="Reset" class="btnStyle" style="float:left" />
            </td>
    </tr>
</table>
        
        </div>
</asp:Content>
