using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Home : System.Web.UI.MasterPage
{
    string jackk;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["search"] == "city")
            {
                jackk = "1";
            }
            else if (Session["search"] == "Area")
            {
                jackk = "2";
            }
            else if (Session["search"] == "details")
            {
                jackk = "3";
            }
        }
        catch
        {

        }

        callname();
    }


    private void callname()
    {
        try
        {
            if (Session["username"] != "" || Session["username"] != null)
            {
                string asas = Session["username"].ToString();
                // callusername();
            }
            else
            {
            }
        }
        catch
        {
        }

        try
        {
            if (Session["user"] != "" || Session["user"] != null)
            {
                string asas = Session["user"].ToString();
                // callusername();
            }
            else
            {
            }
        }
        catch
        {
        }


    }
    public string ConvertDataTabletoString()
    {

        DataTable dt = new DataTable();
        if (Session["la"]!=null)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                qry = "SELECT title=Parking_Name,lat=lat,lng=longt,Parking_Name FROM(SELECT *,(((acos(sin((@lat*pi()/180)) * sin((lat*pi()/180))+cos((@lat*pi()/180)) * cos((lat*pi()/180)) * cos(((@longt - longt)*pi()/180))))*180/pi())*60*1.1515*1.609344) as distance FROM Admin_Rent_Space) t WHERE distance <=3";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    string aa = Session["la"].ToString();
                    cmd.Parameters.AddWithValue("@lat", Session["la"].ToString());
                    cmd.Parameters.AddWithValue("@longt", Session["lo"].ToString());
                    try
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                    catch
                    { }
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    return serializer.Serialize(rows);
                }

            }
        }
        else
            return "";
    }
}
