<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Hrow1 {
            margin: auto;
            width: 100%;
        }
        .box {
            background-color: rgba(0,0,0,0.5);
            height: 600px;
            margin-top: 0;
            width: 800px;
            margin: 0 auto;
            color: white;
        }
        .foot {
            width:100%;
            height:100px;
            background-color:white;
            font-weight: bold;
        }
        .cntcn_lnk {
            color:greenyellow;
            font-size:30px;
            font-weight: bold;
            border: 1px solid;
        }
        .cntcn_lnk:hover {
            color:white;
        }

    </style>
    <div class="box">

    <table  style=" margin: 0 auto;">
        <tr>
            <td  class="Hrow1" ">
                
                
                <br style="background-color: #993333" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick1" Interval="2000">
                        </asp:Timer>
                        <asp:Image ID="Image1" Height="200px" Width="300px" runat="server"  />
                    </ContentTemplate>
                </asp:UpdatePanel>
                 <h1>Welcome to my bicycle store!</h1> <br />
                <p>
                   Here you can find the best bikes ever! <br />
                    Enjoy
                </p>
                <br />
                <asp:LinkButton ID="LinkButton1" Font-Underline="false" CssClass="cntcn_lnk" runat="server" PostBackUrl="~/ContactUs.aspx" >Contact Us</asp:LinkButton>
            </td>
            
        </tr>
    </table>
    </div>
    <div class="foot">
        
        <p style="padding:5px">Visit us</p>
        
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/facebook-icon.png" style="height:30px; width:30px;" PostBackUrl="https://www.facebook.com/inbal.chen.5" />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/iconmonstr-linkedin-3.png" style="height:30px; width:30px;" PostBackUrl="https://www.linkedin.com/in/inbal-chen-318244135/"/>
    </div>
</asp:Content>
