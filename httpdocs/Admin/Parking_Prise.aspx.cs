using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class User_Parking_Prise : System.Web.UI.Page
{
    string ss, xxx, sss;
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate11();
        try
        {
            if (Session["user"] != "" || Session["user"] != null)
            {

                Label1.Text = Session["Registration_Id"].ToString();
            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
        }
        catch
        {
            Response.Redirect("../Default.aspx");
        }

    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0,"---Select Parking Name-");
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0,"--Select Vehical Type--");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Label2.Text == "")
        {
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();

            SqlCommand cmd2 = new SqlCommand("Select * from Admin_Parking_Rate where Pcode=@Pcode AND Vehical_Type_Name=@Vehical_Type_Name", sconn);
            cmd2.Parameters.AddWithValue("@Pcode", DropDownList1.SelectedValue.ToString());
            cmd2.Parameters.AddWithValue("@Vehical_Type_Name", DropDownList2.SelectedItem.ToString());
            SqlDataReader dr = cmd2.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count == 1)
            {

                SqlCommand cmd = new SqlCommand("insert into Admin_Parking_Rate(Pcode,Rate,Vehical_Type_Id,Vehical_Type_Name,Default_Date,Time,Time_id) values(@Pcode,@Rate,@Vehical_Type_Id,@Vehical_Type_Name,@Default_Date,@Time,@Time_id)", sconn);
                cmd.Parameters.AddWithValue("@Pcode", DropDownList1.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Rate", Txtrate.Text);
                cmd.Parameters.AddWithValue("@Vehical_Type_Id", DropDownList2.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Vehical_Type_Name", DropDownList2.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
                cmd.Parameters.AddWithValue("@Time", DropDownList3.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Time_id", DropDownList3.SelectedValue.ToString());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Add Price Successfully')", true);
                GridView1.DataBind();
                Txtrate.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Already Exist')", true);
            }
        }
        else
        {
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd = new SqlCommand("update Admin_Parking_Rate Set Pcode=@Pcode,Rate=@Rate,Vehical_Type_Id=@Vehical_Type_Id,Vehical_Type_Name=@Vehical_Type_Name,Time=@Time,Time_id=@Time_id Where Id=@Id", sconn);
            cmd.Parameters.AddWithValue("@Id",Label2.Text);
            cmd.Parameters.AddWithValue("@Pcode", DropDownList1.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Rate", Txtrate.Text);
            cmd.Parameters.AddWithValue("@Vehical_Type_Id", DropDownList2.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Vehical_Type_Name", DropDownList2.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
            cmd.Parameters.AddWithValue("@Time", DropDownList3.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Time_id", DropDownList3.SelectedValue.ToString());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Update Price Successfully')", true);
            GridView1.DataBind();
            Txtrate.Text = "";
            Label2.Text = "";
        }

    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "-" + dt.Month.ToString() + "-" + dt.Year.ToString();

        return sss;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Text = DropDownList1.SelectedValue.ToString();
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edits")
        {
            string abcds = e.CommandArgument.ToString();

       

            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd = new SqlCommand("Select * from Admin_Parking_Rate where Id=@Id", sconn);
            cmd.Parameters.AddWithValue("Id", abcds);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count == 1)
            {

                Label2.Text = dt.Rows[0]["Id"].ToString();
                Txtrate.Text = dt.Rows[0]["Rate"].ToString();
                DropDownList3.SelectedValue = dt.Rows[0]["Time_id"].ToString();

                DropDownList2.SelectedValue = dt.Rows[0]["Vehical_Type_Id"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["Pcode"].ToString();
            }
        }
    }
    private void Page_Error(object sender, EventArgs e)
    {
        // Get last error from the server
        Exception exc = Server.GetLastError();

        // Handle exceptions generated by Button 1
        if (exc is InvalidOperationException)
        {
            // Pass the error on to the Generic Error page
            Server.Transfer("GenericErrorPage.aspx", true);
        }

        // Handle exceptions generated by Button 2
        else if (exc is ArgumentOutOfRangeException)
        {
            // Give the user some information, but
            // stay on the default page
            Response.Write("<h2>Default Page Error</h2>\n");
            Response.Write("<p>Provide as much information here as is " +
              "appropriate to show to the client.</p>\n");
            Response.Write("Return to the <a href='Default.aspx'>" +
                "Default Page</a>\n");

            // Log the exception and notify system operators
            ParkingMy.Logic.ExceptionUtility.LogException(exc, "DefaultPage");
            ParkingMy.Logic.ExceptionUtility.NotifySystemOps(exc);

            // Clear the error from the server
            Server.ClearError();
        }
        else
        {
            // Pass the error on to the default global handler
        }
    }
}