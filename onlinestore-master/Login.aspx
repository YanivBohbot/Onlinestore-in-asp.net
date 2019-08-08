<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .login_tbl_style {
            
            text-align:center;
            width: 100%;
            font-weight:bold;
            color:white;
            font-size: 25px;
            padding: 70px;
            display:inline-block;
        }
        .txt_box {
            width: 200px;
            height: 30px;   
            float:left;
            border-width: 2px;
        }
        .lnkbtn {            
            color: yellow;
            border-radius: 10px;
            font-weight: bold;
        }
        td {
            padding:7px;
        }
        .lbl {
            color:red;
            font-size:18px;
            font-weight:bold;
        }
        .auto-style1 {
            width: 440px;
        }
    </style> 
    <asp:Panel ID="Panel1" runat="server" DefaultButton="ButtonLogin">
    <table class="login_tbl_style" style="width: 56%; margin-left: 161px">
    <tr>
        <td>User Name</td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBoxUserName" runat="server" class="txt_box"></asp:TextBox>
            <asp:Label ID="lbl_err_usrn" runat="server" CssClass="lbl"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Password</td>
        <td class="auto-style1" >
           <asp:TextBox ID="TextBoxPassword" runat="server" ValidationGroup="TxtValid" TextMode="Password" class="txt_box"></asp:TextBox>
           <asp:Label ID="lbl_err_pss" runat="server" CssClass="lbl"></asp:Label>

        </td>
    </tr>
    <tr>
        <td style="width: 165px; padding: 20px;">
            <asp:Button ID="ButtonLogin" runat="server" Text="Connect" class="btnStyle" style="margin-left:50px;" OnClick="ButtonLogin_Click" />
            <br />
            <asp:Label ID="lb_logged_user" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lb_result" runat="server"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UsersData] WHERE (([UserName] = @UserName) AND ([Password] = @Password))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxUserName" Name="UserName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxPassword" Name="Password" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style1">
            
            
            <asp:LinkButton ID="LinkButtonRegister" runat="server" CssClass="lnkbtn" OnClick="LinkButtonRegister_Click" PostBackUrl="~/Register.aspx">Register</asp:LinkButton>
        </td>
    </tr>
</table>
</asp:Panel>
</asp:Content>

