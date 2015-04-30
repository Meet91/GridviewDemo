using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Tutorial1
{
    public partial class Page3 : System.Web.UI.Page
    {

        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            getCustomers();

        }

        private void getCustomers()
        {
            try
            {
                string conString = @"Server = JAIGANESH\SQLEXPRESS; Database = northwind; Trusted_Connection = True;";
                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();
                    string query = "SELECT [CustomerID],[CompanyName],[ContactName],[ContactTitle] ,[Address] ,[City],[PostalCode],[Country],[Phone] FROM [NORTHWIND].[dbo].[Customers]";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Connected architecture
                        //SqlDataReader reader = cmd.ExecuteReader();
                        //while (reader.Read())
                        //{
                        //    //cmd.ExecuteReader();

                        //    gvCustomers.DataSource = reader;
                        //    gvCustomers.DataBind();
                        //}

                        // Disconnected archtecture
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        //DataSet ds = new DataSet();
                        adp.Fill(ds);
                        gvCustomers.DataSource = ds;
                       // Session["Customers"] = ds;
                        gvCustomers.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
            }
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomers.PageIndex = e.NewPageIndex;
            getCustomers();
        }

        protected void lnkbtnView_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtnView = sender as LinkButton;
            GridViewRow gvRow = (GridViewRow)lnkbtnView.NamingContainer;
            Label CustomerId = (Label)gvCustomers.Rows[gvRow.RowIndex].FindControl("lblCustomerID");

            try
            {
                string conString = @"Server = JAIGANESH\SQLEXPRESS; Database = northwind; Trusted_Connection = True;";
                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();
                    string query = "SELECT [CustomerID],[CompanyName],[ContactName],[ContactTitle] ,[Address] ,[City],[PostalCode],[Country],[Region],[Phone] FROM [NORTHWIND].[dbo].[Customers] where CustomerID = @CustomerID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("CustomerID", SqlDbType.NChar).Value = CustomerId.Text;
                        // Disconnected archtecture
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        //DataSet ds = new DataSet();
                        adp.Fill(ds);
                        dvCustomers.DataSource = ds;
                        dvCustomers.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
            }

        }

        public SortDirection dir
        {
            get
            {
                if (ViewState["dirState"] == null)
                {
                    ViewState["dirState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["dirState"];
            }
            set
            {
                ViewState["dirState"] = value;
            }

        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                getCustomers();
                string SortDir = string.Empty;
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                if (dir == SortDirection.Ascending)
                {
                    dir = SortDirection.Descending;
                    SortDir = "Desc";
                }
                else
                {
                    dir = SortDirection.Ascending;
                    SortDir = "Asc";
                }
                if (dt != null)
                {
                    DataView dv = new DataView(dt);
                    dv.Sort = e.SortExpression+" "+SortDir;
                    gvCustomers.DataSource = dv;
                    gvCustomers.DataBind();
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }



        }


    }
}