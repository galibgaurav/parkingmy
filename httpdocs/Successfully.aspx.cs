
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Text;

public partial class Successfully : System.Web.UI.Page
{
    string ss, xxx, sss;
    int idd;
    string abbb;
    string area, city, state, country,areaname;
    Exception ex1;
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            //if (Session["user"] != "" || Session["user"] != null)
            //{
            //    Label1.Text = Session["parkingiiidd"].ToString();
            //    Label2.Text = Session["regisss"].ToString();
            //    Label3.Text = Session["bookid"].ToString();
            //    Label5.Text = Session["price"].ToString();

            //    SuccessFunc();
            //    Mail();
            //}
            //else
            //{
            //    Response.Redirect("Default.aspx");
            //}
            ex1 = new Exception();
                Label1.Text = Session["parkingiiidd"].ToString();
                //Label2.Text = Session["regisss"].ToString();
                Label3.Text = Session["bookid"].ToString();
                SuccessFunc();
                Mail();
            
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
    }

    private void Mail()
    {
       
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
        cn.Open();
        
        //SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Registration_Id=@Registration_Id", cn);
        SqlCommand cmd1 = new SqlCommand("Select *  from Admin_Login where Email_Id=(SELECT  owner_mail FROM dbo.Admin_Rent_Space where Parking_Id=@Parking_Id)", cn);
        cmd1.Parameters.AddWithValue("@Parking_Id", Label1.Text);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        if (dt1.Rows.Count == 1)
        {
            Label4.Text = dt1.Rows[0]["Email_Id"].ToString();
            txtname1.Text  = dt1.Rows[0]["Username"].ToString();
            txtmobile2.Text = dt1.Rows[0]["Mobile_Number"].ToString();

            if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
        cn.Open();

        SqlCommand cmd3 = new SqlCommand("Select * from Admin_Booking_Parking where booking_Id=@booking_Id", cn);
        cmd3.Parameters.AddWithValue("@booking_Id",Label3.Text);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count == 1)
        {
            
            txtfromdate.Text=dt3.Rows[0]["From_Date"].ToString();
            txttodate.Text = dt3.Rows[0]["To_Date"].ToString();
            txtvehicalname.Text=dt3.Rows[0]["Vehical_name"].ToString();
            //txttype.Text=dt3.Rows[0]["Vehical_Type_Name"].ToString();
        }

        SqlCommand cmd4 = new SqlCommand("Select * from Admin_Rent_Space where Parking_Id=@Parking_Id", cn);
        cmd4.Parameters.AddWithValue("@Parking_Id", Label1.Text);
        SqlDataReader dr4 = cmd4.ExecuteReader();
        DataTable dt4 = new DataTable();
        dt4.Load(dr4);
        if (dt4.Rows.Count == 1)
        {

            txtpname.Text = dt4.Rows[0]["Parking_Name"].ToString();
            txtaddress.Text = dt4.Rows[0]["Address"].ToString();
            areaname=dt4.Rows[0]["Area_Name"].ToString();
        }

        SqlCommand cmd5 = new SqlCommand("Select * from Admin_Add_Vehical where Register_Id=@Register_Id AND Vehical_Name=@Vehical_Name ", cn);
        cmd5.Parameters.AddWithValue("@Register_Id", Label2.Text);
        cmd5.Parameters.AddWithValue("@Vehical_Name", txtvehicalname.Text);
        SqlDataReader dr5 = cmd5.ExecuteReader();
        DataTable dt5 = new DataTable();
        dt5.Load(dr5);
        //SendEmailToOwner();
        //sending SMS
        SendSmsToOwner(txtmobile2.Text, Label1.Text,Session["DriverMobileNum"].ToString(), Session["DriverEmailId"].ToString()); 
        SendSmsToDriver(Session["DriverMobileNum"].ToString(),Label1.Text,txtmobile2.Text);
       

        //if (dt5.Rows.Count == 1)
        //{

        //    txtmodelname.Text = dt5.Rows[0]["Model_Number"].ToString();


        //}
        
        
        //url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtmobile2.Text + "&sid=PARKMY&msg=New booking for parking. User code is " + Label3.Text + ", vehicle name " + txtmodelname.Text + ", vehicle number " + txtvehicalname.Text + "&fl=0&gwid=2";

        //try
        //{
        //    System.Net.HttpWebRequest fr = null;
        //    Uri targetURI = new Uri(url);

        //    fr = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(targetURI);

        //    if ((fr.GetResponse().ContentLength > 0))
        //    {
        //        System.IO.StreamReader str = new System.IO.StreamReader(fr.GetResponse().GetResponseStream());
        //        //Response.Write(str.ReadToEnd())
        //        Response_f = str.ReadToEnd();
        //        str.Close();
        //    }

        //}
        //catch
        //{
        //    //  Response_f = "Registration failed please try again later.";

        //}

            
        }
    }

    private void SendSmsToOwner(string ownerMobileNumber, string parkingId, string driverMobileNumber,string driverEmailID)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=");
        builder.Append(ownerMobileNumber);
        builder.Append("&sid=PARKMY&msg=");
        builder.Append("Congrats! U got a new parking space booking request for ParkingID ");
        builder.Append(parkingId);
        builder.Append(" from user " + Session["DriverEmailId"] + " Mobile No. " + Session["DriverMobileNum"] + "&fl=0&gwid=2");
        if (!SendSms(builder.ToString()))
        {
           // ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Sorry something went wrong, please try again.');", true);
        }
        return;
    }

    private void SendSmsToDriver(string driverMobileNumber,string parkingId,string ownerMobileNumber)
    {
        StringBuilder builder = new StringBuilder();
        builder.Append("http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=");
        builder.Append(driverMobileNumber);
        builder.Append("&sid=PARKMY&msg=");
        builder.Append("Your request for parking space is submitted for parking space owner approval. You can also call him/her on " + ownerMobileNumber + " for approval.&fl=0&gwid=2");
        if (!SendSms(builder.ToString()))
        {
            //ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Sorry something went wrong, please try again.');", true);
        }
        return;
    }

    private bool SendSms(string url)
    {
        try
        {
          
            Elmah.ErrorLog.GetDefault(HttpContext.Current).Log(new Elmah.Error(new  Exception("inside SendSms")));
            System.Net.HttpWebRequest fr = null;
            Uri targetURI = new Uri(url);

            fr = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(targetURI);

            if ((fr.GetResponse().ContentLength > 0))
            {
                System.IO.StreamReader str = new System.IO.StreamReader(fr.GetResponse().GetResponseStream());
                //Response.Write(str.ReadToEnd())
                string Response_f = str.ReadToEnd();
                str.Close();
            }

        }
        catch(Exception ex)
        {
            //Elmah.ErrorLog.GetDefault(HttpContext.Current).Log(new Elmah.Error(ex));
            return false;
        }
        return true;
    }
    private void SendEmailToOwner()
    {
        try
        {
            MailMessage mm = new MailMessage("support@parkingmy.com", Session["DriverEmailId"].ToString());
            mm.Subject = "ParkingMy.com:: Booking Request";
            mm.Body = "<html><head><style type='text/css'>.style1{height: 23px;}</style></head><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'><tbody><tr><td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td></tr><tr><td width='1' bgcolor='#d6d6d6'></td><td><table cellspacing='0' cellpadding='0' width='598' border='0' align='center'><tbody><tr><td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname1.Text + "</i>,<br /><br /><br /></b>                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Number :-                  </b>" + Label3.Text + "</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Date :-                  </b>" + txtfromdate.Text + " To " + txttodate.Text + "</td>              </tr>              <tr>                <td width='24' class='style1'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  </td>              </tr>              <tr>                <td width='24' class='style1'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Name :-                  </b>" + txtvehicalname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Type :-                  </b>" + txttype.Text + "                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                 &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Name :-                  </b>" + txtpname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Address :-                  </b>" + txtaddress.Text + "<br /><br /><br /><b>                    Total Price :-                  </b>" + Label5.Text + "               </td>              </tr>              <tr>                <td height='20' colspan='2'></td>                <td height='20' colspan='2'>&nbsp;</td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9448159227 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);

            MailMessage mm1 = new MailMessage("support@parkingmy.com", Label4.Text.ToString());
            mm1.Subject = "ParkingMy.com:: New Booking ";
            mm1.Body = "<html><head><style type='text/css'>.style1{height: 23px;}</style></head><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname1.Text + "</i>,<br /><br /><br /></b>                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Number :-                  </b>" + Label3.Text + "</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Date :-                  </b>" + txtfromdate.Text + " To " + txttodate.Text + "</td>              </tr>              <tr>                <td width='24' class='style1'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  </td>              </tr>              <tr>                <td width='24' class='style1'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Name :-                  </b>" + txtvehicalname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Type :-                  </b>" + txttype.Text + "                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                 &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Name :-                  </b>" + txtpname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Address :-                  </b>" + txtaddress.Text + "<br /><br /><br /><b>                    Total Price :-                  </b>" + Label5.Text + "              </td>              </tr>              <tr>                <td height='20' colspan='2'></td>                <td height='20' colspan='2'>&nbsp;</td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9448159227 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";
            mm1.IsBodyHtml = true;
            SmtpClient smtp1 = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp1.Send(mm1);
        }
        catch (Exception ex)
        {
            return;
        }
           //MailMessage mm = new MailMessage("support@parkingmy.com", "" + Label4.Text + "");
           // mm.Subject = "ParkingMy.com:: Confirm Booking ";
           // mm.Body = "<html><head><style type='text/css'>.style1{height: 23px;}</style></head><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname1.Text + "</i>,<br /><br /><br /></b>                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Number :-                  </b>" + Label3.Text + "</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Date :-                  </b>" + txtfromdate.Text + " To " + txttodate.Text + "</td>              </tr>              <tr>                <td width='24' class='style1'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  </td>              </tr>              <tr>                <td width='24' class='style1'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Name :-                  </b>" + txtvehicalname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Type :-                  </b>" + txttype.Text + "                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                 &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Name :-                  </b>" + txtpname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Address :-                  </b>" + txtaddress.Text + "<br /><br /><br /><b>                    Total Price :-                  </b>"+Label5.Text +"               </td>              </tr>              <tr>                <td height='20' colspan='2'></td>                <td height='20' colspan='2'>&nbsp;</td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9448159227 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";

           // mm.IsBodyHtml = true;
           // SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
           // ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
           // smtp.Send(mm);

           // MailMessage mm1 = new MailMessage("support@parkingmy.com", "support@parkingmy.com");
           // mm1.Subject = "ParkingMy.com:: New Booking ";
           // mm1.Body = "<html><head><style type='text/css'>.style1{height: 23px;}</style></head><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname1.Text + "</i>,<br /><br /><br /></b>                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Number :-                  </b>" + Label3.Text + "</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Booking Date :-                  </b>" + txtfromdate.Text + " To " + txttodate.Text + "</td>              </tr>              <tr>                <td width='24' class='style1'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  </td>              </tr>              <tr>                <td width='24' class='style1'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3' class='style1'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Name :-                  </b>" + txtvehicalname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Vehical Type :-                  </b>" + txttype.Text + "                </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                 &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  &nbsp;</td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Name :-                  </b>" + txtpname.Text + "               </td>              </tr>              <tr>                <td width='24'>&nbsp;</td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    parking Address :-                  </b>" + txtaddress.Text + "<br /><br /><br /><b>                    Total Price :-                  </b>"+Label5.Text +"              </td>              </tr>              <tr>                <td height='20' colspan='2'></td>                <td height='20' colspan='2'>&nbsp;</td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9448159227 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";
           // mm1.IsBodyHtml = true;
           // SmtpClient smtp1 = new SmtpClient("relay-hosting.secureserver.net", 25);
           // ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
           // smtp1.Send(mm1);
        return;
    }

    private void SuccessFunc()
    {
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
        cn.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Booking_Parking where booking_Id=@booking_Id", cn);
        cmd1.Parameters.AddWithValue("@booking_Id",Label3.Text);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        if (dt1.Rows.Count == 1)
        {
            

            SqlCommand cmd2 = new SqlCommand("update Admin_Booking_Parking SET Success_Id=@Success_Id  where booking_Id=@booking_Id", cn);
            cmd2.Parameters.AddWithValue("@booking_Id", Label3.Text);
            cmd2.Parameters.AddWithValue("@Success_Id", "1");
            cmd2.ExecuteNonQuery();
          
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