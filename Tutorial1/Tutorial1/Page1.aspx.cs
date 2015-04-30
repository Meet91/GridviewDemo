using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tutorial1
{
    public partial class Page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.WebForms;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblOp.Text = txtInput1.Text + txtInput2.Text;
        }

        

        
    }
}