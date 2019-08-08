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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from UsersData where UserName='" + TextBoxUsrNameReg.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if(temp==1)
                {
                    Response.Write("User Already Exist");

                }

                conn.Close();
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {

            if (!Page.IsValid)
            {
                Response.Write("<script>alert('All fields must be fill')</script>");

            }
            else
            {
                
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string insertQuery = "insert into UsersData (FirstName, LastName, UserName, Email, Password) values (@Fname, @Lname, @Uname, @email, @password)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@Fname", TextBoxFirstNameReg.Text);
                    com.Parameters.AddWithValue("@Lname", TextBoxLastNameReg.Text);
                    com.Parameters.AddWithValue("@Uname", TextBoxUsrNameReg.Text);
                    com.Parameters.AddWithValue("@email", TextBoxEMailReg.Text);
                    com.Parameters.AddWithValue("@password", TextBoxPasswReg.Text);

                    com.ExecuteNonQuery();
                    Response.Write("<script>alert('Successfuly Registered')</script>");
                    Response.Redirect("Login.aspx");
                    Response.Write("Registration Complited");

                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString());
                }

            }






        }
    }
}