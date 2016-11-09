using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string insertQuery = "INSERT INTO userinfo (";
        insertQuery += "name,username,password)";
        insertQuery += " VALUES (";
        insertQuery += "@name,@username,@password)";
        SqlCommand cmd = new SqlCommand(insertQuery,con);
        cmd.Parameters.AddWithValue("@name", FullName.Text);
        cmd.Parameters.AddWithValue("@username", Username.Text);
        cmd.Parameters.AddWithValue("@password", Password.Text);
        try
        {
            con.Open();
            int add = cmd.ExecuteNonQuery();
            if (add > 0)
            {
                Label1.Text = "Account Created";
            }
        }
        catch(Exception err)
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