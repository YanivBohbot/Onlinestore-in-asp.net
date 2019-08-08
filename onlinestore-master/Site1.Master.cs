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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["logged"] as string;
            lb_logged_user.Text = (username == null ? "not logged" : "logged as " + username);

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ButtonAboutUs_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AboutUs.aspx");
             
        }

        protected void ButtonHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
            ButtonHome.BackColor = System.Drawing.Color.Black;
        }

        protected void ButtonStore_Click(object sender, EventArgs e)
        {
            if (Session["logged"] != null)
            {
                Response.Redirect("Store.aspx");
            }
            Response.Redirect("Login.aspx");

        }
        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Session.Clear();
            Session["valid"] = false;
            string username = Session["logged"] as string;
            lb_logged_user.Text = (username == null ? "not logged" : "logged as " + username);
            Response.Cookies.Clear();
            Response.Redirect("Home.aspx");
        }
    }
}