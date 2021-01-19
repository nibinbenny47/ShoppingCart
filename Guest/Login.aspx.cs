using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class Guest_Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void connection()
    {
        con = new SqlConnection(connectionString);
        con.Open();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        connection();
        //string selQry = "select * from tbl_user where user_username='" + txtName.Text + "' and user_password='" + txtPassword.Text + "'";
        //SqlDataAdapter adp = new SqlDataAdapter(selQry, con);

        //DataTable dt = new DataTable();
        //adp.Fill(dt);

        cmd = new SqlCommand("sp_shopLogin", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", txtName.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adp = new SqlDataAdapter();
        adp.SelectCommand = cmd;

        DataTable dt = new DataTable();
        adp.Fill(dt);



        if (dt.Rows.Count > 0)
        {

            Session["uid"] = dt.Rows[0]["user_id"].ToString();
            Session["uname"] = dt.Rows[0]["user_name"].ToString();
            Session["uemail"] = dt.Rows[0]["user_email"].ToString();
            Response.Redirect("../User/Homepage.aspx");
            //lblMsg.Text = "success";
        }
        else
        {
            Response.Write("<script>alert('invalid')</script>");
        }

    }
}