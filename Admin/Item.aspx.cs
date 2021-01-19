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
        if (!IsPostBack)
        {
            fillGenderCategory();
            fillRepeater();

        }
    }
    public void connection()
    {
        con = new SqlConnection(connectionString);
        con.Open();
    }
    public void fillGenderCategory()
    {
        connection();

        cmd = new SqlCommand("sp_ItemQuery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 1);
        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //adp.Fill(dt);
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            if (dr.HasRows)
            {
                rdbGenderCategory.DataSource = dr;
                rdbGenderCategory.DataValueField = "gender_id";
                rdbGenderCategory.DataTextField = "gender_category";
                rdbGenderCategory.DataBind();
            }
        }
    }



        

    public void cancel()
    {
        txtName.Text = "";

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        cancel();
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        connection();
        string name = txtName.Text;
        string gender = rdbGenderCategory.SelectedValue;
        cmd = new SqlCommand("sp_ItemQuery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 2);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@genderid", gender);
        cmd.ExecuteNonQuery();
        cancel();
        fillRepeater();





    }
    protected void fillRepeater()
    {
        connection();
        cmd = new SqlCommand("sp_ItemQuery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 3);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        rptrItem.DataSource = dt;
        rptrItem.DataBind();
    }
}