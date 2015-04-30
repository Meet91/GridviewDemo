using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutorial1
{
    public partial class Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<string> names = new List<string>();

            names.Add("Mitesh");
            names.Add("Harika");
            names.Add("Yamini");

            //foreach (string item in names)
            //{
            //   // TextBox1.Text += item + "</br>";
            //    Literal1.Text += item + "</br>";
            //}

            GridView1.DataSource = names;
            GridView1.DataBind();
        }
    }
}