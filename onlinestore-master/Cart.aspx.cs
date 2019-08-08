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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("productid");
                dt.Columns.Add("productname");
                dt.Columns.Add("price");
                dt.Columns.Add("productimage");
                dt.Columns.Add("cost");
                dt.Columns.Add("totalcost");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();

                        String mycon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from products where id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["productid"] = ds.Tables[0].Rows[0]["id"].ToString();
                        dr["productname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                        dr["productimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();                             
                        Session["buyitems"] = dt;
                        
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        String mycon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from products where id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["productid"] = ds.Tables[0].Rows[0]["id"].ToString();
                        dr["productname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                        dr["productimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    

                }

            }
            
           
           



        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;
            Response.Redirect("Cart.aspx");
        }
    
    }
}