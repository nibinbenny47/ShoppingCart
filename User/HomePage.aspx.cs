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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            fillWomenItem();
            fillMenItem();

        }
    }
    public void connection()
    {
        con = new SqlConnection(connectionString);
        con.Open();
    }
    protected void fillMenItem()
    {
        connection();

        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 1);
        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //adp.Fill(dt);
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            if (dr.HasRows)
            {
                ddlMenItem.DataSource = dr;
                ddlMenItem.DataValueField = "item_id";
                ddlMenItem.DataTextField = "item_name";
                ddlMenItem.DataBind();
                ddlMenItem.Items.Insert(0, "--select Men items--");

            }
        }
    }
    protected void fillWomenItem()
    {
        connection();

        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 2);
        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //adp.Fill(dt);
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            if (dr.HasRows)
            {
                ddlWomenItem.DataSource = dr;
                ddlWomenItem.DataValueField = "item_id";
                ddlWomenItem.DataTextField = "item_name";
                ddlWomenItem.DataBind();
                ddlWomenItem.Items.Insert(0, "--select Women items--");
            }
        }
    }

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    connection();
    //}
    protected void fillMenDatalist()
    {
        connection();
        string product = ddlMenItem.SelectedValue;
        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 3);
        cmd.Parameters.AddWithValue("@selectedProduct", product);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        dtlistMenItems.DataSource = dt;
        dtlistMenItems.DataBind();
    }
    protected void fillWomenDatalist()
    {
        connection();
        string product = ddlWomenItem.SelectedValue;
        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 3);
        cmd.Parameters.AddWithValue("@selectedProduct", product);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        dtlistWomenItems.DataSource = dt;
        dtlistWomenItems.DataBind();
    }


    //when clicks on an item in dropdownlist the datatable appears
    protected void ddlMenItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        fillMenDatalist();
    }
    //when clicks on an item in dropdownlist the datatable appears
    protected void ddlWomenItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        fillWomenDatalist();
    }


    

    protected void fillRepeater()
    {
        connection();

        string product = Session["pid"].ToString();
        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 4);
        cmd.Parameters.AddWithValue("@productid", product);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        rptrViewProduct.DataSource = dt;
        rptrViewProduct.DataBind();

    }
    protected void dtlistMenItems_ItemCommand(object source, DataListCommandEventArgs e)
    {
        id = Convert.ToInt32(e.CommandArgument);
        Session["pid"] = id;

        if (e.CommandName == "viewProduct")
        {
            MultiView1.ActiveViewIndex = 2;
            fillRepeater();
        }
    }


   
        //calculating total 
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
        TextBox tb1 = ((TextBox)(sender));
        RepeaterItem rp1 = ((RepeaterItem)(tb1.NamingContainer));
        TextBox tb2 = (TextBox)rp1.FindControl("txtTotal");
        HiddenField hdn = (HiddenField)rp1.FindControl("hdnPrice");
        int id = Convert.ToInt32(hdn.Value);
        tb2.Text = Convert.ToString(Convert.ToDouble(tb1.Text) * id );


    }
    protected void rptrViewProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {

        connection();
        //Reference the Repeater Item using Button.
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string qnty = (item.FindControl("txtQuantity") as TextBox).Text;
        string total = (item.FindControl("txtTotal") as TextBox).Text;
        string description = (item.FindControl("hdnDescription") as HiddenField).ToString();

        string photo = (item.FindControl("hdnPhoto") as HiddenField).ToString();




        string userid = Session["uid"].ToString();
        string product = Session["pid"].ToString();
        cmd = new SqlCommand("sp_Homepage", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@status", 5);
        cmd.Parameters.AddWithValue("@product_id", product);
        cmd.Parameters.AddWithValue("@cart_quantity", qnty);
        cmd.Parameters.AddWithValue("@user_id", userid);

        cmd.Parameters.AddWithValue("@cart_total", total);

        cmd.Parameters.AddWithValue("@payment_status", 0);
        cmd.ExecuteNonQuery();


    }
}















