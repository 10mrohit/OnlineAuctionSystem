using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
        Session.Clear();
        Navbar myMasterPage = (Navbar)Page.Master;

        HyperLink myLink = (HyperLink)myMasterPage.FindControl("reg");
        myLink.Visible = false;

        myLink = (HyperLink)myMasterPage.FindControl("feed");
        myLink.Visible = false;

        myLink = (HyperLink)myMasterPage.FindControl("upload");
        myLink.Visible = false;

        myLink = (HyperLink)myMasterPage.FindControl("edit");
        myLink.Visible = false;
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string uname = Username.Text;
        string pword = Password.Text;
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string selectQuery = "select username,password,name from userinfo where username = @uname and password= @pword";
        SqlCommand cmd = new SqlCommand(selectQuery, con);
        cmd.Parameters.AddWithValue("@uname", uname);
        cmd.Parameters.AddWithValue("@pword", pword);
        try
        {
            con.Open();
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                Label1.Text = "User found";
                Session["username"] = uname;
                Session["name"] = reader["name"];

                Response.Redirect("feed.aspx");
            }
            else
            {
                Label1.Text = "Username Doesn't Exist";
            }
        }
        catch (Exception err)
        {
            Label1.Text = "Server Error Occured. Try Again Later.";
            Label1.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void Register_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}