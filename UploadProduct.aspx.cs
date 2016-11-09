using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    private int pid_fetcher()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string selectQuery = "select count(*) from products";
        SqlCommand cmd = new SqlCommand(selectQuery, con);
        int last_pid = 0;
        try
        {
            con.Open();
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                last_pid = Convert.ToInt32(reader[0]);
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
        return last_pid;
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False");
        string pname = prodname.Text;
        string pdesc = proddesc.Text;
        double bid = Convert.ToDouble(initialbid.Text);
        DateTime enddate = Calendar1.SelectedDate;

        //New Image Upload
        /*
        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string getext = Path.GetExtension(FileUpload1.PostedFile.FileName);
        int lastpid = pid_fetcher();
        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + (lastpid+1).ToString() + getext);*/

        //Image Upload
        /*
        string filePath = FileUpload1.PostedFile.FileName;  
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
        switch(ext)
        {
            case ".doc":
                contenttype = "application/vnd.ms-word";
                break;
            case ".docx":
                contenttype = "application/vnd.ms-word";
                break;
            case ".xls":
                contenttype = "application/vnd.ms-excel";
                break;
            case ".xlsx":
                contenttype = "application/vnd.ms-excel";
                break;
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
            case ".gif":
                contenttype = "image/gif";
                break;
            case ".pdf":
                contenttype = "application/pdf";
                break;
        }

        if (!contenttype.Contains("image"))
        {
            Label1.Text = "Please upload an image";
        }
            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        */
        string username = (string)Session["username"];
        string insertQuery = "INSERT INTO products (";
        insertQuery += "pname,pdesc,bid,enddate,username)";
        insertQuery += " VALUES (";
        insertQuery += "@pname,@pdesc,@bid,@enddate,@username)";
        SqlCommand cmd = new SqlCommand(insertQuery, con);
        cmd.Parameters.AddWithValue("@pname", pname);
        cmd.Parameters.AddWithValue("@pdesc", pdesc);
        cmd.Parameters.AddWithValue("@bid", bid);
        cmd.Parameters.AddWithValue("@enddate", enddate);
        cmd.Parameters.AddWithValue("@username", username);
        try
        {
            con.Open();
            int add = cmd.ExecuteNonQuery();
            if (add > 0)
            {
                Label1.Text = "Product Added";
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