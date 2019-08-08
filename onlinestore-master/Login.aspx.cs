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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("To Approach The Store Log In First!!");
            Session["valid"] = false;
        }

        protected void LinkButtonRegister_Click(object sender, EventArgs e)
        {
            string username = Session["logged"] as string;
            lb_logged_user.Text = (username == null ? "not logged" : "logged as " + username);
             
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (TextBoxUserName.Text =="" && TextBoxPassword.Text==""){
                //Response.Write("<script>alert('All fields must be fill')</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                lbl_err_pss.Visible = true;
                lbl_err_usrn.Visible = true;
                lbl_err_usrn.Text = "Enter UserName";
                lbl_err_pss.Text = "Enter Password";
                TextBoxUserName.BorderColor = System.Drawing.Color.Red;
                TextBoxPassword.BorderColor = System.Drawing.Color.Red;
                
            }

            else if (CheckUserLogin(TextBoxUserName.Text, TextBoxPassword.Text))
            {

                lb_result.Text = "Successful Login";
                Session["logged"] = TextBoxUserName.Text;
                Session["valid"] = true;
                Response.Redirect("Home.aspx");
                TextBoxUserName.BorderColor = System.Drawing.Color.Empty;
                TextBoxPassword.BorderColor = System.Drawing.Color.Empty;
            }
            else if (TextBoxUserName.Text == "InbalChen" && TextBoxPassword.Text == "6026102")
            {
                Session["Advalid"] = true;
                Response.Redirect("Admin.aspx");
            }
            else {
                lbl_err_pss.Visible = false;
                lbl_err_usrn.Visible = false;
                TextBoxUserName.BorderColor = System.Drawing.Color.Empty;
                TextBoxPassword.BorderColor = System.Drawing.Color.Empty;
                lb_result.Text = "User Name Or Password Does Not Exist!";
                TextBoxUserName.BorderColor = System.Drawing.Color.Red;
                

            }






        }
        private bool CheckUserLogin(string userName, string password)
        {
            string conString =
           ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                SqlCommand com = new SqlCommand("SELECT Username FROM UsersData WHERE Username = @Username AND Password = @Password", con);
               
                com.Parameters.Add("@Username", SqlDbType.NVarChar).Value = userName;
                com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
                con.Open();

                string result = Convert.ToString(com.ExecuteScalar());
                if (string.IsNullOrEmpty(result))
                    return false;
                else
                    return true;
            }
        }
    }
}