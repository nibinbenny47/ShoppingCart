using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.IO;
using System.Data.SqlClient;

public partial class User_Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    public static int id;
    //public static int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showCart();
        }
    }
    public void connection()
    {
        con = new SqlConnection(connectionString);
        con.Open();
    }
    protected void showCart()
    {
        connection();

        string userid = Session["uid"].ToString();
        cmd = new SqlCommand("sp_ViewCart", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 1);
        cmd.Parameters.AddWithValue("@user_id", userid);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        rptrViewCart.DataSource = dt;
        rptrViewCart.DataBind();



    }

    protected void rptrViewCart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        id = Convert.ToInt32(e.CommandArgument);
        if(e.CommandName == "deleteFromCart")
        {
            connection();

          
            cmd = new SqlCommand("sp_ViewCart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", 2);
            cmd.Parameters.AddWithValue("@cart_id", id);
            cmd.ExecuteNonQuery();
            //call show cart function to display the repeater
            showCart();

        }
    }
}