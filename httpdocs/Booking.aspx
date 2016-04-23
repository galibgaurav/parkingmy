<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media only screen and (max-width:405px) {
            .back {
                margin-left: 0px !important;
            }

            .lll {
                margin-top: 13px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="Label5" runat="server" Visible="false" Text=""></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section id="contact">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="contact-left wow fadeInLeft">
            <h3 style=" font-size: x-large;color: white;">Support For Booking </h3>
             <address class="single-address">
              <h4> address:</h4>
              <p>"J P Nagar Phase 1, bangalore</p>
            </address>
             <address class="single-address">
              <h4>Phone</h4>
              <p>Phone Number:9448159227</p>
        
            </address>
             <address class="single-address">
              <h4>E-Mail</h4>
              <p>Support: support@parkingmy.com</p>
             </address>
          </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <div class="col-md-8 col-sm-6 col-xs-12">
          <div class="contact-right wow fadeInRight">
            <h2><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2><asp:Label ID="lblcode" runat="server" Visible="false"  Text="" ></asp:Label>
            <asp:Label ID="Label2" runat="server" Visible="false"   Text=""></asp:Label>
            <div action="" class="contact-form">
                <center>
                <%--<div class="form-group">                
                <asp:DropDownList ID="DropDownList4"  class="form-control"  runat="server"  
                        DataSourceID="SqlDataSource1" DataTextField="vehical_Type" 
                        DataValueField="Id" ondatabound="DropDownList4_DataBound" onselectedindexchanged="DropDownList4_SelectedIndexChanged"></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  Visible="true" ForeColor="Red" ValidationGroup="a" runat="server" InitialValue="--Select vehicle Type--" ControlToValidate="DropDownList4" ErrorMessage="Select vehicle type"></asp:RequiredFieldValidator>
                         <asp:Label ID="Label7" Visible="false" runat="server" Text=""></asp:Label>
                     </div>--%>
               </center>
              <div class="form-group">
                  <div class="form-group">                
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Driver name"   class="form-control"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ForeColor="Red" runat="server" ValidationGroup="a" ControlToValidate="TextBox3" ErrorMessage="Enter Valid Driver Name"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="None" ValidationGroup="a" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Valid Driver Name"></asp:RegularExpressionValidator>
                  </div>
                  <div class="form-group">                
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Email address"   class="form-control"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ForeColor="Red" runat="server" ValidationGroup="a" ControlToValidate="TextBox4" ErrorMessage="Enter Valid Email Id"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="None" ValidationGroup="a" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter Valid Email Address"></asp:RegularExpressionValidator>
              </div>                
             <div class="form-group">                
                    <asp:TextBox ID="txtmodel" runat="server" placeholder="Mobile number"   class="form-control"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ForeColor="Red" runat="server" ValidationGroup="a" ControlToValidate="txtmodel" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="None" ValidationGroup="a" ValidationExpression="^[0-9]{10}$" runat="server" ControlToValidate="txtmodel" ErrorMessage="Enter Valid 10 Digit Number"></asp:RegularExpressionValidator>
              </div>

                <div class="form-group">        
                <span style="color: white;">Booking from date  </span> 
                <asp:TextBox ID="TextBox1" runat="server" class="form-control back"   placeholder="-Select Date-"  style="width: 165px;display: inline-block;margin-left: 30px;"></asp:TextBox>
                <asp:CalendarExtender ID="TextBox1_CalendarExtender" Format="dd/MM/yyyy"  runat="server" 
                            Enabled="True" TargetControlID="TextBox1" SelectedDate="<%#DateTime.Now %>">
                </asp:CalendarExtender>
                <asp:DropDownList ID="DropDownList2" class="form-control back" style="height: 47px;display: inline-block;width: 165px;" runat="server">                           
                                <asp:ListItem  value="00:00:00" >12:00am</asp:ListItem>
                                <asp:ListItem  value="00:30:00" >12:30am</asp:ListItem>
                                <asp:ListItem  value="01:00:00" >1:00am</asp:ListItem>
                                <asp:ListItem  value="01:30:00" >1:30am</asp:ListItem>
                                <asp:ListItem  value="02:00:00" >2:00am</asp:ListItem>
                                <asp:ListItem  value="02:30:00" >2:30am</asp:ListItem>
                                <asp:ListItem  value="03:00:00" >3:00am</asp:ListItem>
                                <asp:ListItem  value="03:30:00" >3:30am</asp:ListItem>
                                <asp:ListItem  value="04:00:00" >4:00am</asp:ListItem>
                                <asp:ListItem  value="04:30:00" >4:30am</asp:ListItem>
                                <asp:ListItem  value="05:00:00" >5:00am</asp:ListItem>
                                <asp:ListItem  value="05:30:00" >5:30am</asp:ListItem>
                                <asp:ListItem  value="06:00:00" >6:00am</asp:ListItem>
                                <asp:ListItem  value="06:30:00" >6:30am</asp:ListItem>
                                <asp:ListItem  value="07:00:00" >7:00am</asp:ListItem>
                                <asp:ListItem  value="07:30:00" >7:30am</asp:ListItem>
                                <asp:ListItem  value="08:00:00" selected="selected" >8:00am</asp:ListItem>
                                <asp:ListItem  value="08:30:00" >8:30am</asp:ListItem>
                                <asp:ListItem  value="09:00:00" >9:00am</asp:ListItem>
                                <asp:ListItem  value="09:30:00" >9:30am</asp:ListItem>
                                <asp:ListItem  value="10:00:00" >10:00am</asp:ListItem>
                                <asp:ListItem  value="10:30:00" >10:30am</asp:ListItem>
                                <asp:ListItem  value="11:00:00" >11:00am</asp:ListItem>
                                <asp:ListItem  value="11:30:00" >11:30am</asp:ListItem>
                                <asp:ListItem  value="12:00:00" >12:00pm (Noon)</asp:ListItem>
                                <asp:ListItem  value="12:30:00" >12:30pm</asp:ListItem>
                                <asp:ListItem  value="13:00:00" >1:00pm</asp:ListItem>
                                <asp:ListItem  value="13:30:00" >1:30pm</asp:ListItem>
                                <asp:ListItem  value="14:00:00" >2:00pm</asp:ListItem>
                                <asp:ListItem  value="14:30:00" >2:30pm</asp:ListItem>
                                <asp:ListItem  value="15:00:00" >3:00pm</asp:ListItem>
                                <asp:ListItem  value="15:30:00" >3:30pm</asp:ListItem>
                                <asp:ListItem  value="16:00:00" >4:00pm</asp:ListItem>
                                <asp:ListItem  value="16:30:00" >4:30pm</asp:ListItem>
                                <asp:ListItem  value="17:00:00" >5:00pm</asp:ListItem>
                                <asp:ListItem  value="17:30:00" >5:30pm</asp:ListItem>
                                <asp:ListItem  value="18:00:00" >6:00pm</asp:ListItem>
                                <asp:ListItem  value="18:30:00" >6:30pm</asp:ListItem>
                                <asp:ListItem  value="19:00:00" >7:00pm</asp:ListItem>
                                <asp:ListItem  value="19:30:00" >7:30pm</asp:ListItem>
                                <asp:ListItem  value="20:00:00" >8:00pm</asp:ListItem>
                                <asp:ListItem  value="20:30:00" >8:30pm</asp:ListItem>
                                <asp:ListItem  value="21:00:00" >9:00pm</asp:ListItem>
                                <asp:ListItem  value="21:30:00" >9:30pm</asp:ListItem>
                                <asp:ListItem  value="22:00:00" >10:00pm</asp:ListItem>
                                <asp:ListItem  value="22:30:00" >10:30pm</asp:ListItem>
                                <asp:ListItem  value="23:00:00" >11:00pm</asp:ListItem>
                                <asp:ListItem  value="23:30:00" >11:30pm</asp:ListItem>
                                <asp:ListItem  value="23:59:59" >Midnight</asp:ListItem>
                        </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ForeColor="Red" ValidationGroup="ab" runat="server" ControlToValidate="TextBox1" ErrorMessage="Select From Date"></asp:RequiredFieldValidator>                 
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

              </div>
              <div class="form-group">                
              <span style="color: white;" >Booking to date</span>
                 <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="true"  class="form-control back"   
                 placeholder="-Select Date-" style="width: 165px;display: inline-block;padding-left: 12px;margin-left: 50PX;" ontextchanged="TextBox2_TextChanged"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server"  
                            Enabled="True" TargetControlID="TextBox2" SelectedDate="<%#DateTime.Now %>">
                        </asp:CalendarExtender>
                        <asp:DropDownList ID="DropDownList6" CssClass="form-control back" style="height: 47px;display: inline-block;width: 165px;"  runat="server">
                            
                           
                    <asp:ListItem  value="00:00:00" >12:00am</asp:ListItem>
                    <asp:ListItem  value="00:30:00" >12:30am</asp:ListItem>
                    <asp:ListItem  value="01:00:00" >1:00am</asp:ListItem>
                    <asp:ListItem  value="01:30:00" >1:30am</asp:ListItem>
                    <asp:ListItem  value="02:00:00" >2:00am</asp:ListItem>
                    <asp:ListItem  value="02:30:00" >2:30am</asp:ListItem>
                    <asp:ListItem  value="03:00:00" >3:00am</asp:ListItem>
                    <asp:ListItem  value="03:30:00" >3:30am</asp:ListItem>
                    <asp:ListItem  value="04:00:00" >4:00am</asp:ListItem>
                    <asp:ListItem  value="04:30:00" >4:30am</asp:ListItem>
                    <asp:ListItem  value="05:00:00" >5:00am</asp:ListItem>
                    <asp:ListItem  value="05:30:00" >5:30am</asp:ListItem>
                    <asp:ListItem  value="06:00:00" >6:00am</asp:ListItem>
                    <asp:ListItem  value="06:30:00" >6:30am</asp:ListItem>
                    <asp:ListItem  value="07:00:00" >7:00am</asp:ListItem>
                    <asp:ListItem  value="07:30:00" >7:30am</asp:ListItem>
                    <asp:ListItem  value="08:00:00" selected="selected" >8:00am</asp:ListItem>
                    <asp:ListItem  value="08:30:00" >8:30am</asp:ListItem>
                    <asp:ListItem  value="09:00:00" >9:00am</asp:ListItem>
                    <asp:ListItem  value="09:30:00" >9:30am</asp:ListItem>
                    <asp:ListItem  value="10:00:00" >10:00am</asp:ListItem>
                    <asp:ListItem  value="10:30:00" >10:30am</asp:ListItem>
                    <asp:ListItem  value="11:00:00" >11:00am</asp:ListItem>
                    <asp:ListItem  value="11:30:00" >11:30am</asp:ListItem>
                    <asp:ListItem  value="12:00:00" >12:00pm (Noon)</asp:ListItem>
                    <asp:ListItem  value="12:30:00" >12:30pm</asp:ListItem>
                    <asp:ListItem  value="13:00:00" >1:00pm</asp:ListItem>
                    <asp:ListItem  value="13:30:00" >1:30pm</asp:ListItem>
                    <asp:ListItem  value="14:00:00" >2:00pm</asp:ListItem>
                    <asp:ListItem  value="14:30:00" >2:30pm</asp:ListItem>
                    <asp:ListItem  value="15:00:00" >3:00pm</asp:ListItem>
                    <asp:ListItem  value="15:30:00" >3:30pm</asp:ListItem>
                    <asp:ListItem  value="16:00:00" >4:00pm</asp:ListItem>
                    <asp:ListItem  value="16:30:00" >4:30pm</asp:ListItem>
                    <asp:ListItem  value="17:00:00" >5:00pm</asp:ListItem>
                    <asp:ListItem  value="17:30:00" >5:30pm</asp:ListItem>
                    <asp:ListItem  value="18:00:00" >6:00pm</asp:ListItem>
                    <asp:ListItem  value="18:30:00" >6:30pm</asp:ListItem>
                    <asp:ListItem  value="19:00:00" >7:00pm</asp:ListItem>
                    <asp:ListItem  value="19:30:00" >7:30pm</asp:ListItem>
                    <asp:ListItem  value="20:00:00" >8:00pm</asp:ListItem>
                    <asp:ListItem  value="20:30:00" >8:30pm</asp:ListItem>
                    <asp:ListItem  value="21:00:00" >9:00pm</asp:ListItem>
                    <asp:ListItem  value="21:30:00" >9:30pm</asp:ListItem>
                    <asp:ListItem  value="22:00:00" >10:00pm</asp:ListItem>
                    <asp:ListItem  value="22:30:00" >10:30pm</asp:ListItem>
                    <asp:ListItem  value="23:00:00" >11:00pm</asp:ListItem>
                    <asp:ListItem  value="23:30:00" >11:30pm</asp:ListItem>
                    <asp:ListItem  value="23:59:59" >Midnight</asp:ListItem>
                                            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  ForeColor="Red" ValidationGroup="ab" runat="server" ControlToValidate="TextBox2" ErrorMessage="Select to date"></asp:RequiredFieldValidator>                 
              </div>  
                <asp:Label ID="Label10" runat="server" Visible="false"   Text=""></asp:Label>
           
         
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
              <%--<div class="form-group">                
              <span style="color: white;" > vehicle Type</span>
                <asp:DropDownList ID="DropDownList3"  runat="server" 
                      CssClass="form-conggtrol back"  style="height: 47px;width: 220px;margin-left: 15px;"
                        DataSourceID="SqlDataSource1" AutoPostBack="true"  DataTextField="vehicle_Type" 
                        DataValueField="Id" ondatabound="DropDownList3_DataBound" onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                      ></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Add_vehicle_Type]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ForeColor="Red"  ValidationGroup="ab" InitialValue="--Select vehicle Type--" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Select vehicle Type"></asp:RequiredFieldValidator>                 
                  <asp:Label ID="Label7" Visible="false" runat="server" Text=""></asp:Label>
                   <asp:Label ID="Label8" Visible="false" runat="server" Text=""></asp:Label>
                
              </div>              
              <div class="form-group">
                   <span style="color: white;" > vehicle Name</span>
                   <asp:DropDownList ID="DropDownList5" CssClass="form-conggtrol back" 
                       style="height: 48px;width: 220px; margin-left: 6px;" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="vehicle_Name"  OnDataBound="DropDownList5_DataBound"
                       DataValueField="Register_Id">
                                   
                            </asp:DropDownList> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ForeColor="Red" ValidationGroup="ab" runat="server" InitialValue="--Select vehicle Name--" ControlToValidate="DropDownList5" ErrorMessage="Select vehicle Name"></asp:RequiredFieldValidator>                  
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                       SelectCommand="SELECT [Register_Id], [vehicle_Name] FROM [Admin_Add_vehicle] WHERE ([Register_Id] = @Register_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="Register_Id" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                   </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" CssClass="lll"
                                style="font-size: larger;color: white;background-color: #00d999;" 
                                Text="Add vehicle" onclick="Button1_Click" ></asp:Button>
              </div>--%>
               <center > 
                <%--<asp:Panel ID="Panel1" style="width: 100%;background-color: rgba(241, 241, 241, 0.28);padding: 11px;" Visible="false" runat="server">--%>
                 
        <asp:TextBox ID="txtname" runat="server" placeholder="Licence plate number" class="form-control"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="a" runat="server" ControlToValidate="txtname" ErrorMessage="Enter licence plate number"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="None" ValidationGroup="a" ValidationExpression="^[a-zA-Z0-9''-'\s]{1,15}$" runat="server" ControlToValidate="txtname" ErrorMessage="Enter valid licence plate number"></asp:RegularExpressionValidator>
        </div>
              <div class="form-group">                
                    <asp:TextBox ID="txtcname" runat="server" placeholder="Vehicle company name"  class="form-control"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="a" runat="server" ControlToValidate="txtcname" ErrorMessage="Enter vehicle company Name"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="None" ValidationGroup="a" ValidationExpression="^[a-zA-Z0-9''-'\s]{1,15}$" runat="server" ControlToValidate="txtcname" ErrorMessage="Enter valid vehicle Company Name"></asp:RegularExpressionValidator>

              </div>  
                   
              </center>  
             <div class="form-group">                
             <span style="color: white;" ></span>
        <asp:TextBox ID="TextBox6" runat="server" class="form-control"  style="height: 86px;" placeholder="Purpose Of journey" Rows="1" TextMode="MultiLine"  ></asp:TextBox>
       <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="None" ValidationGroup="a" ValidationExpression="^[a-zA-Z0-9''.'\s]{1,30}$" runat="server" ControlToValidate="TextBox6" ErrorMessage="Purpose Of journey must be less than 30 character long!"></asp:RegularExpressionValidator>
                 <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9"  ForeColor="Red" ValidationGroup="a" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter your purpose of journey"></asp:RequiredFieldValidator> --%>                 
      <%--  <asp:RangeValidator id="Range1" ControlToValidate="TextBox6" ValidationGroup="a" MaximumValue="30" Type="String" EnableClientScript="false"
           Text="Purpose Of journey must be less than 30 character long!"
           runat="server"/>--%>      
             </div></div>
              <div class="form-group">  
             <span style="color: white;" ></span>
              <center>
                     <asp:Button ID="Button4"  ValidationGroup="a"
                     style="width: auto;font-size: larger;color: white;background-color: #00d999;"
                     runat="server" Text=" Book Now " OnClientClick="if ( !confirm('Are you sure Booking ?')) return ;" onclick="Button4_Click"></asp:Button>
                     <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="a" runat="server" ShowMessageBox="True" ShowSummary="false" />
              </center>
              </div>
            </div>
          </div>
        </div>
        <asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
           
                                        <div   style="z-index: 10025; left: 45%;position: fixed; top: 40%" > 
                                       <center>
                                           <img  id="imglddoader" runat="server"  src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                         </center>
                                       </div>
                                        </ProgressTemplate>

         </asp:UpdateProgress>
      </ContentTemplate>
        </asp:UpdatePanel>
              
      </div>
    </div>
  </section>
</asp:Content>


