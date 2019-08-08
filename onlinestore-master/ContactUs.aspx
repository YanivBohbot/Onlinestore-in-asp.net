<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebApplication1.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">

         .txt_box {
            width: 200px;
            height: 30px;            
            float:left;
        }
        .tbl {
            color: white;
            font-size: 28px;
            font-weight:bold;
            margin: 0 auto;
            display:inline-block;
            width: 100%;
            margin-left: 161px;
            text-align:center;
           
        }
        td {
            padding:7px;
        }
    </style>

    <table class="tbl" style="width: 56%">

     <tr>
        <td >First Name</td>
        <td>
            <asp:TextBox ID="TextBoxFirstNameCntct" runat="server" class="txt_box"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxFirstNameCntct" ErrorMessage="First name required" ValidationGroup="Group1" class="validtxt"/>        

        </td>
      </tr>
        <tr>
        <td>Last Name</td>
        <td>
            <asp:TextBox ID="TextBoxLastNameCntct" runat="server" class="txt_box"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxLastNameCntct" ErrorMessage="Last name required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>E-Mail</td>
        <td>
            <asp:TextBox ID="TextBoxEMailCntct" runat="server" class="txt_box"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEMailCntct" ErrorMessage="Email Not Valid" ForeColor="#ff6347" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxEMailCntct" ErrorMessage="Email required" ValidationGroup="Group1" class="validtxt" />        

        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" style="height:200px; width:200px; float:left" placeholder="What's on your mind.."></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSend" runat="server" CssClass="btnStyle" Text="Send" OnClick="Sendclick_btn" ValidationGroup="Group1" />


        </td>
    </tr>

    </table>
</asp:Content>

