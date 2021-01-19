using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class Admin_Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(connectionString);
        con.Open();
        //string ins = "insert into tbl_gender (gender_category) values ('"+txtGender.Text+"')";
        //cmd = new SqlCommand(ins, con);
        //cmd.ExecuteNonQuery();
        string category = txtGender.Text;
        SqlCommand cmd = new SqlCommand("sp_shop", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@category", category);
        cmd.ExecuteNonQuery();
        con.Close();


    }
}