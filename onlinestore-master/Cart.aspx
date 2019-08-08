<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication1.Cart" %>


<asp:Content ID="Contect3" ContentPlaceHolderID="head" runat="server">
 

    


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>  
        <style type="text/css">
        .img {
            height:200px;
            width: 200px;
        }
        .grdview {
            color: white;
            margin: 0 auto;
            font-weight: bold;
            font-size: 18px;
            padding: 100px;
            background-color:rgba(0,0,0,0.5);
            box-shadow: 0 0 4px 2px grey; 
            border: 2px;
            border-color: black;
        }
        .hpr_txt {
            font-weight: bold;
            font-size: 28px;
            color:greenyellow;

        }
    </style>
    
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="hpr_txt" NavigateUrl="~/Store.aspx">Continue Shopping</asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="grdview" AutoGenerateColumns="False" Height="240px" Width="700px" OnRowDeleting="GridView1_RowDeleting">
        <Columns >
            <asp:BoundField DataField="sno" HeaderText="S.No">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="productid" HeaderText="Product Id">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="productname" HeaderText="Product Name">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="Price">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            
            <asp:ImageField DataImageUrlField="productimage" HeaderText="Product Image" ControlStyle-Height="150" ControlStyle-Width="150">
<ControlStyle Height="150px" Width="150px"></ControlStyle>

                <ItemStyle HorizontalAlign="Center" Height="50px" Width="50px" />
            </asp:ImageField>
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
        </Columns>
        <HeaderStyle Height="50px" Width="100px" />
    </asp:GridView>
         
    <br />
    <br />
    <br />
            </ContentTemplate>
    </asp:UpdatePanel>


 

    


</asp:Content>
