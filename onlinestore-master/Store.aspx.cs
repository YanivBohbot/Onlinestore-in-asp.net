using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Store : System.Web.UI.Page
    {
        private Boolean IsPageRefresh = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
                    ViewState["postids"] = System.Guid.NewGuid().ToString();
                    Session["postid"] = ViewState["postids"].ToString();
                    if (Session["valid"] == null)
                    {
                        Response.Write("LOG IN FIRST!!!!");
                        Response.Redirect("Login.aspx");
                    }

                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["buyitems"];
                    if (dt != null)
                    {

                        Label5.Text = dt.Rows.Count.ToString();
                    }
                    else
                    {
                        Label5.Text = "0";
                    }
               }
               else
               {
                   if (ViewState["postids"].ToString() != Session["postid"].ToString())
                   {
                       IsPageRefresh = true;
                   }
                   Session["postid"] = System.Guid.NewGuid().ToString();
                   ViewState["postids"] = Session["postid"];

                }
                
            




        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (!IsPageRefresh)
            {
                if (e.CommandName == "addtocart")
                {

                    Response.Redirect("Cart.aspx?id=" + e.CommandArgument.ToString());

                }
            }
               
            
                
            
            
        }
       
    }
}