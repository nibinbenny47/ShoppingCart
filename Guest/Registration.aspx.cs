using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
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
       
        string pass = txtPassword.Text;
        string confirm = txtConfirm.Text;
        if (pass == confirm)
        {

            cmd = new SqlCommand("sp_userInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name",txtName.Text);
            cmd.Parameters.AddWithValue("@gender",radGender.SelectedValue);
            cmd.Parameters.AddWithValue("@email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@address",txtAddress.Text);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password",txtPassword.Text);
            cmd.ExecuteNonQuery();
            //    string insQry = "insert into tbl_user(user_name,user_gender,user_address,place_id,user_photo,user_uname,user_password,user_status)values('" + txtName.Text + "','" + radGender.SelectedValue + "','" + txtAddress.Text + "','" + drpPlace.SelectedValue + "','" + pic + "','" + txtUsername.Text + "','" + txtPassword.Text + "',0)";


            //    SqlCommand cmd = new SqlCommand(insQry, con);
            //    cmd.ExecuteNonQuery();
        }
        else
        {
            Response.Write("Error");
        }



    }
}