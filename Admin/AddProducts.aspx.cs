using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillItem();
        }
    }
    public void connection()
    {
        con = new SqlConnection(connectionString);
        con.Open();
    }
    protected void fillItem()
    {
        connection();

        cmd = new SqlCommand("sp_ProductQuery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 1);
        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //adp.Fill(dt);
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            if (dr.HasRows)
            {
                ddlItem.DataSource = dr;
                ddlItem.DataValueField = "item_id";
                ddlItem.DataTextField = "item_name";
                ddlItem.DataBind();
            }
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        connection();
        string name = txtName.Text;
        string item = ddlItem.SelectedValue;
        string price = txtPrice.Text;
        string qnty = txtQuantity.Text;
        string description = txtDescription.Text;
        string pic = Path.GetFileName(fileImage.PostedFile.FileName.ToString());
        fileImage.SaveAs(Server.MapPath("Photos/" + pic));
        cmd = new SqlCommand("sp_ProductQuery", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 2);
        cmd.Parameters.AddWithValue("@product_name",name);
        cmd.Parameters.AddWithValue("@item_id",item);
        cmd.Parameters.AddWithValue("@product_price",price);
        cmd.Parameters.AddWithValue("@product_description", description);
        cmd.Parameters.AddWithValue("@product_photo",pic);



        cmd.Parameters.AddWithValue("@product_quantity", qnty);
        cmd.ExecuteNonQuery();

    }
}