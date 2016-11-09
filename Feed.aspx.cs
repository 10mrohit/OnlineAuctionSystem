using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["username"]==null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            newbidarea.Visible = false;
        }
        /*
        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
        List<ListItem> files = new List<ListItem>();
        foreach (string filePath in filePaths)
        {
            files.Add(new ListItem(Path.GetFileName(filePath), filePath));
        }
        GridView1.DataSource = files;
        GridView1.DataBind();
         * 
         * Image Field
         * <asp:ImageField  DataImageUrlField = "pid" DataImageUrlFormatString = "ImageHandler.aspx?pid={0}" ControlStyle-Width = "100" ControlStyle-Height = "100" HeaderText = "Product Image"/>
        */

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string selectQuery = "select pid,pname,pdesc,bid,enddate,username from products";
        SqlCommand cmd = new SqlCommand(selectQuery, con);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        try
        {
            con.Open();
            adapter.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        Label2.Text = row.Cells[1].Text;
        newbidarea.Visible = true;
    }
    protected void SubmitBid_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string insertQuery = "UPDATE products SET ";
        insertQuery += "bid=@bid ";
        insertQuery += "where pname=@pname AND pdesc=@pdesc AND enddate = @enddate AND username = @username";
        SqlCommand cmd = new SqlCommand(insertQuery, con);
        cmd.Parameters.AddWithValue("@pname", row.Cells[1].Text);
        cmd.Parameters.AddWithValue("@pdesc", row.Cells[2].Text);
        cmd.Parameters.AddWithValue("@bid", newbid.Text);
        cmd.Parameters.AddWithValue("@enddate", row.Cells[4].Text);
        cmd.Parameters.AddWithValue("@username", row.Cells[5].Text);
        try
        {
            con.Open();
            int add = cmd.ExecuteNonQuery();
            if (add > 0)
            {
                //Label1.Text = "Bid Added. Refresh to show changes.";
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                Label1.Text = "Couldn't Add Bid. Try Again Later.";
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
}