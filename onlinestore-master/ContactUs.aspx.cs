using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace WebApplication1
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Sendclick_btn(object sender, EventArgs e)
        {
            MailMessage mm = new MailMessage("sender@gmail.com", "inbalchenz@gmail.com");

            mm.Subject = TextBoxFirstNameCntct.Text;

            mm.Body = "Name: " + TextBoxFirstNameCntct.Text + " " + TextBoxLastNameCntct.Text + "<br /><br />Email: " + TextBoxEMailCntct.Text + "<br />" + TextBox1.Text;


            mm.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";

            smtp.EnableSsl = true;

            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();

            NetworkCred.UserName = "sender@gmail.com";

            NetworkCred.Password = "xxxxx";

            smtp.UseDefaultCredentials = true;

            smtp.Credentials = NetworkCred;

            smtp.Port = 587;

            smtp.Send(mm);

            

        }
    }
}