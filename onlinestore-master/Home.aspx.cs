using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                SetimageUrl();
            }
        }

        

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            SetimageUrl();
        }

        private void SetimageUrl()
        {
            Random _rand = new Random();
            int i = _rand.Next(1, 6);
            Image1.ImageUrl = "~/images/" + i.ToString() + ".jpg";
        }
    }
}