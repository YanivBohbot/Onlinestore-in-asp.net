<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="WebApplication1.Store" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <style type="text/css">

        .lnk_btn {
            width:100px;
            height: 30px;
            background-color: greenyellow;
            color:black;
            border-radius: 7px;
            -webkit-border-radius: 7px;
            -moz-border-radius: 7px;
            font-size: 18px;
            font-weight: bold;
        }
        .lnk_btn:hover {
            background-color:yellow;
        }
        .datalist {
            color: white;
            font-weight: bold;
            margin: 0 auto;
            text-align:center;
        }
        .img {            
            background-color:white;
            border: solid 2px;
            border-color:black;
            box-shadow: 0 0 4px 2px grey; 
        }
        .lbl_price {
            font-size: 24px;
            
        }
        .crt {
             border-radius: 70px;
            -webkit-border-radius: 70px;
            -moz-border-radius: 70px;
             background-color:#ff0066;
        }
        .lbl_cart {
            font-weight: bold;
            color:#ff0066;
        }
        .lbl_num_of_products {
            color:#ff0066;
            font-weight: bold;
        }
       
        
    </style>
    
    
    <asp:HyperLink runat="server" ID="hlThumbnail" Target="_blank"  Style="height: 66px;" NavigateUrl="~/Cart.aspx">
        
        <asp:Image runat="server" ID="imgThumbnail" Height="66px" CssClass="crt" ImageUrl="~/images/cart.png" />
    </asp:HyperLink>
    <br />
    <asp:Label ID="Label5" runat="server" CssClass="lbl_num_of_products" ></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" CssClass="lbl_cart">Cart</asp:Label>
    
    <asp:DataList ID="DataList1" CssClass="datalist" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table style="width: 100%">
                <div style="padding:12px">                
                <tr> 
                    <br />                   
                    <td>Product Id
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("pName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="200px" class="img" ImageUrl='<%# Eval("pImage") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td>$
                        <asp:Label ID="Label3" runat="server" CssClass="lbl_price" Text='<%# Eval("price") %>' ></asp:Label>
                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" CssClass="lnk_btn" runat="server" Font-Underline="false" CommandName="addtocart" AutoPostBack ="false"  CommandArgument='<%#Eval("id") %>'>Add To Cart</asp:LinkButton>
                         
                    </td>
                </tr>
                    <hr></hr>
                </div>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    <br />
        </ContentTemplate>

    </asp:UpdatePanel>
    
    
</asp:Content>
