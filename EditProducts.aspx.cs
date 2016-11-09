using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = (string)Session["username"];
        username.Visible = false;
        if(gridProducts.Visible==false)
        {
            Label2.Text = "You Don't Have Any Products To Show";
        }
    }
}