using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Collections.Generic;

public partial class Default2 : System.Web.UI.Page
{
    string ss, xxx, sss;
    int idd;
    string abbb;
    string area, city, state, country;
    ArrayList list2 = new ArrayList();
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void Page_Load(object sender, EventArgs e)
    {
        Label5.Text = Session["pname"].ToString();
        // Label4.Text= Session["pid"].ToString();
        list2 = (ArrayList)Session["sess"];
        DisplayParkingSpace();

    }
    private void DisplayParkingSpace()
    {

        DataTable dt = new DataTable();
        foreach (string li in list2)
        {
            string s = "Select * From Admin_Rent_Space Where Id='" + li + "'";
            SqlCommand cmd = new SqlCommand(s, sconn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }

    private void calll2()
    {

        SqlCommand abcdd = new SqlCommand("select * from Admin_Rent_Space where Area_Name=@Area_Name", sconn);
        abcdd.Parameters.AddWithValue("@Area_Name", Label4.Text);
        SqlDataAdapter daa = new SqlDataAdapter(abcdd);
        DataTable dta = new DataTable();
        daa.Fill(dta);
        if (dta.Rows.Count > 0)
        {
            DataList1.DataSource = dta;
            DataList1.DataBind();

        }
        else
        {
            Label6.Visible = true;
        }
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        //string[] data = TextBox1.Text.Split(',');
        //if (data.Length == 4)
        //{
        //    area = data[0];
        //    city = data[1];
        //    state = data[2];
        //    country = data[3];
        //    callarea();
        //}
        //else if (data.Length == 3)
        //{
        //    city = data[0];
        //    state = data[1];
        //    country = data[2];
        //    callcity();
        //}
        //else if (data.Length == 2)
        //{
        //    state = data[0];
        //    country = data[1];
        //}
        //else if (data.Length == 1)
        //{
        //    country = data[0];
        //}
        //else
        //{ }
    }
    private void callarea()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        string remove = area.Trim();
        SqlCommand con = new SqlCommand("select * from Admin_Rent_Space where Area_Name=@Area_Name", sconn);
        con.Parameters.AddWithValue("@Area_Name", remove);
        SqlDataAdapter da = new SqlDataAdapter(con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string isss = dt.Rows[0]["Id"].ToString();

            idd = int.Parse(isss);
            Session["pid"] = remove;
            Session["pname"] = remove;
            Session["search"] = "Area";
            Response.Redirect("Default2.aspx");

        }
        else
        {

        }
    }

    private void callcity()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        string remove = city.Trim();
        SqlCommand con = new SqlCommand("select * from Admin_Rent_Space where City_Name=@City_Name", sconn);
        con.Parameters.AddWithValue("@City_Name", city);
        SqlDataAdapter da = new SqlDataAdapter(con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string isss = dt.Rows[0]["Id"].ToString();

            idd = int.Parse(isss);
            Session["pid"] = city;
            Session["pname"] = city;
            Session["search"] = "city";
            Response.Redirect("Default2.aspx");

        }
        else
        {

        }
    }
    protected void DataList1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lbl = (Label)e.Item.FindControl("Label7");
        Label lbl2 = (Label)e.Item.FindControl("Label1");

        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        SqlCommand abcdd = new SqlCommand("select MIN(Rate) From Admin_Parking_Rate where Pcode=@Pcode ", sconn);
        abcdd.Parameters.AddWithValue("@Pcode", lbl.Text);
        SqlDataAdapter daa = new SqlDataAdapter(abcdd);
        DataTable dta = new DataTable();
        daa.Fill(dta);
        if (dta.Rows.Count > 0)
        {
            lbl2.Text = dta.Rows[0][0].ToString();


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