﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parking My</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="assets/images/favicon1.ico" />
    <!-- Font Awesome -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.css" />
    <!-- Fancybox slider -->
    <link rel="stylesheet" href="assets/css/jquery.fancybox.css" type="text/css" media="screen" />
    <!-- Animate css -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css" />
    <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/default.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- Main Style -->
    <link href="style.css" rel="stylesheet" />

    <!-- Fonts -->
    <!-- Open Sans for body font -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- Raleway for Title -->
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css' />
    <!-- Pacifico for 404 page   -->
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css' />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
    <style type="text/css">
        .modalBackground {
            filter: alpha(opacity=90);
            opacity: 0.8;
            background-color: black;
        }

        .modalPopup {
            border-radius: 13px;
            background-color: #00d999;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-top: 8px;
            padding-left: -21px;
            width: 475px;
            height: 354px;
        }

        .modalPopup1 {
            border-radius: 13px;
            background-color: #00d999;
            border-width: 1px;
            border-style: solid;
            border-color: black;
            padding-top: 8px;
            padding-left: -21px;
            width: 475px;
            height: 475px;
        }

        .kaushik {
            color: black;
            margin-right: 9px;
            width: 35px;
            background: #FFFFFF;
            border: #0E0E0E;
            font-size: 20px;
            font-weight: bold;
            float: right;
            margin-top: 0px;
        }

        .jack2 {
            background-color: white;
            background-size: contain;
            border-color: black;
            text-align: left;
            position: relative;
            width: 92%;
            padding: 3%;
            /* background: #D3D3D3; */
            margin-bottom: 4%;
            font-family: 'Open Sans', sans-serif;
            color: #676767;
            font-weight: 600;
            font-size: 16px;
            outline: none;
            border: none;
            border-radius: 5px;
            border: 1px solid #DED6D6;
            -webkit-appearance: none;
        }

        .jack {
            background-color: white;
            background: url(assets/images/calendar.png) no-repeat center right;
            background-size: contain;
            border-color: black;
            text-align: left;
            position: relative;
            width: 92%;
            padding: 3%;
            /* background: #D3D3D3; */
            margin-bottom: 6%;
            font-family: 'Open Sans', sans-serif;
            color: #676767;
            font-weight: 600;
            font-size: 16px;
            outline: none;
            border: none;
            border-radius: 5px;
            border: 1px solid #DED6D6;
            -webkit-appearance: none;
        }

        .dklll {
            padding: 10px;
            width: 17%;
            float: right;
            margin-right: 0px;
        }

        .pac-container.pac-logo::after {
            display: none;
        }
    
        .fontt {
            font-size: 60px !important;
        }

        @media only screen and (max-width :1073px) {
            .fontt {
                font-size: 45px !important;
            }
        }

        @media only screen and (max-width :803px) {
            .fontt {
                font-size: 35px !important;
                margin-bottom: 0px;
            }
        }

        @media only screen and (max-width :651px) {
            .fontt {
                font-size: 27px !important;
                margin-bottom: 0px;
            }

            .bbbttt {
                width: 130px !important;
            }
        }

        @media only screen and (max-width :529px) {
            .fontt {
                font-size: 27px !important;
                margin-bottom: 0px;
            }

            .jack12 {
                line-height: 1!important;
                font-size: 22px;
            }

            .jackbtn {
                width: 100%!important;
            }

            .imghh {
                height: 400px !important;
            }

            .marr {
                margin-bottom: 30px;
            }
        }

        @media only screen and (max-width :375px) {
            .emm {
                margin: 0em !important;
                width: 100% !important;
                font-size: 22px !important;
            }

            .fonnt {
                font-size: 24px !important;
            }

            .modalPopup1 {
                width: 100% !important;
                height: 340px;
                overflow-x: overlay;
            }
        }

        @media only screen and (max-width :335px) {
            .logo {
                display: none;
            }

            .navbar-toggle {
                margin-right: 45% !important;
            }
        }

        @media only screen and (max-width: 500px) {
            .header-content {
                padding: 10px;
            }

            .modalPopup1 {
                width: 100% !important;
            }

            .modalPopup {
                width: 100% !important;
            }

            .txtwid {
                width: 100% !important;
            }
        }
        .subscribe-form-input-group {
            margin-top: 5px;
        }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwbt61m8Mpefk04QjCIJEeQ8AWzpCIy8Y&libraries=places&callback=initAutocomplete" type="text/javascript"></script>
    <script type="text/javascript">
        function initAutocomplete() {
            google.maps.event.addDomListener(window, 'load', function () {

                var options = {
                    componentRestrictions: { country: "IN" }
                };
                var places = new google.maps.places.Autocomplete(document.getElementById('TextBox1'), options);
                google.maps.event.addListener(places, 'place_changed', function () {
                    var place = places.getPlace();
                    var address = place.formatted_address;
                    var latitude = place.geometry.location.lat();
                    var longitude = place.geometry.location.lng();
                    var mesg = "Address: " + address;
                    mesg += "\nLatitude: " + latitude;
                    mesg += "\nLongitude: " + longitude;
                    // alert(mesg);
                    document.getElementById('start').value = latitude;
                    document.getElementById('end').value = longitude;
                });
            });
        }
        function MakeLoginFormVisible() {
            if (!$('#loginFormID').is(':visible')) {
                $('#loginFormID').css('display', 'block');
            }

        }
        function GeoCoordinate() {
            var geocoder = new google.maps.Geocoder();
            var strSearch = document.getElementById('TextBox1').value;
            if (strSearch == null || strSearch == '') {
                alert('Please select a location before searching.');
            }
            else {
                geocoder.geocode({ 'address': strSearch }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var x = results[0].geometry.location.lat();
                        var y = results[0].geometry.location.lng();
                        console.log('x:' + x);
                        console.log('y:' + y);
                        debugger;
                        document.getElementById('TextBox4').value = y;
                        document.getElementById('start').value = x;
                        document.getElementById('end').value = y;
                        // if()
                        return true;

                    }
                });
            }
        }
    </script>
    
</head>
<body>
   <marquee >--Site is under beta testing.-- --Register your parking space before 28th June 2016 and win shoppers stop gift card.--</marquee>
     
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>

            <a class="scrollToTop" href="#"><i class="fa fa-chevron-up" style="line-height: 50px;"></i></a>
            <!-- END SCROLL TOP BUTTON -->

            <!-- Start header section -->

            <div class="header-inner">
                <!-- Header image -->
                <img src="assets/images/header-bg.jpg" class="imghh" alt="img">
                <div class="header-overlay">
                    <div class="header-content">
                        <!-- Start header content slider -->
                        <h2 class="header-slide fontt">
                            <img src="assets/images/Logo%20(1).png" />
                            <span class="jack12" style="font-style: italic; font-family: monospace;">A Place To Find/Rent Parking Space.</span>
                        </h2>


                        <div class="header-btn-area" style="margin-top: 0px;">

                            <asp:Panel ID="Panel14" runat="server" DefaultButton="Button6">
                                <asp:TextBox ID="TextBox1" placeholder="Where do you want to park? Ex:: (Area, City, State)" class="jack2 jackbtn" Style="width: 52%; background-color: white; border-radius: 7px; padding: 12px;"
                                    runat="server">
                                </asp:TextBox>
                                <asp:Button ID="Button6" runat="server" CssClass="marr"
                                    Style="font-size: larger; width: 126px; color: white; border-radius: 7px; padding: 8px; background-color: #00d999; font-weight: bold;"
                                    Text="Search" OnClientClick="return GeoCoordinate();" OnClick="Button6_Click"></asp:Button>
                                <input id="start" name="start" type="hidden" type="text" placeholder="Start Destination" style="display: inline-block; width: 30%;">
                                <input type="hidden" id="end" name="end" type="text" class="form-control search-input" placeholder="End Destination" style="display: inline-block; width: 30%;">
                                <br />
                                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="butston button-default dklll emm" Style="margin: 1em; background: none; vertical-align: middle; position: relative; z-index: 1; width: 41%; float: none; font-size: 27px; color: white !important; background-color: rgba(0, 217, 153, 0.4);" Text="Rent Out Your Space">
                                </asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>


            <div id="loginFormID">
                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="Button3" BackgroundCssClass="modalBackground" PopupControlID="Panel1" TargetControlID="LinkButton1">
                </asp:ModalPopupExtender>

                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                    <asp:Button ID="Button3" runat="server" Text="X" CssClass="kaushik" />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel3" runat="server">
                                <div class="txtwid" style="margin-top: 15px; width: 68%;">
                                    <center>
                                        <h2>Login Here</h2>
                                    </center>
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        ErrorMessage="Enter Registered Email Id" ControlToValidate="txtusername" Display="None"
                                        ValidationGroup="dss"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                        ControlToValidate="txtusername" Display="None" ErrorMessage="Enter Valid Email Id"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="dss"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        ErrorMessage="Enter Password" ControlToValidate="txtpass" Display="None"
                                        ValidationGroup="dss"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary4" ValidationGroup="dss" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                    <asp:Button ID="Button1" runat="server" Text="Login" ValidationGroup="dss"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button2_Click" />
                                    <br />
                                    <asp:LinkButton OnClick="jack" ID="LinkButton3" runat="server">Forgot Password</asp:LinkButton>

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" Visible="false" runat="server">
                                <div style="margin-top: 15px; width: 68%;">
                                    <center>
                                        <h2>Recover Password</h2>
                                    </center>

                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter Registered Email Id"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ErrorMessage="Enter Registered Email Id" ControlToValidate="TextBox2" Display="None"
                                        ValidationGroup="ds"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                        ControlToValidate="TextBox2" Display="None" ErrorMessage="Enter Valid Email Id"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="ds"></asp:RegularExpressionValidator>
                                    <br />



                                    <asp:Button ID="Button7" runat="server" Text="Recover" ValidationGroup="ds"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button7_Click" />
                                    <asp:Button ID="Button8" runat="server" Text="Cancel"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button8_Click" />
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="ds" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                </div>
                            </asp:Panel>



                            <asp:UpdateProgress ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                <ProgressTemplate>

                                    <div style="z-index: 10025; left: 45%; position: fixed; top: 40%">
                                        <center>
                                            <img id="imglddoader" runat="server" src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                        </center>
                                    </div>
                                </ProgressTemplate>

                            </asp:UpdateProgress>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>

            <div>
                <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="Button4" BackgroundCssClass="modalBackground" PopupControlID="Panel2" TargetControlID="LinkButton2">
                </asp:ModalPopupExtender>


                <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup1" align="center" Style="display: none; top: 86.5px;">
                    <asp:Button ID="Button4" runat="server" Text="X" CssClass="kaushik" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>


                            <div class="txtwid" style="margin-top: 15px; width: 68%;">

                                <asp:Panel ID="Panel12" runat="server">
                                    <center>
                                        <h2 class="fonnt">Create Account Here</h2>
                                    </center>
                                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="Enter Name" ControlToValidate="txtname" Display="None"
                                        ValidationGroup="abcccc"></asp:RequiredFieldValidator>

                                    <br />
                                    <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" placeholder="Mobile Number(Ex:9898xxx)"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="Enter Mobile Number" ControlToValidate="txtmobile"
                                        Display="None" ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="txtmobile" Display="None"
                                        ErrorMessage="Enter Valid Mobile Number"
                                        ValidationExpression="^[0-9]{10}$"
                                        ValidationGroup="abcccc"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email id"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ErrorMessage="Enter Email Id" ControlToValidate="txtemail" Display="None"
                                        ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ControlToValidate="txtemail" Display="None" ErrorMessage="Enter Valid Email Id"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="abcccc"></asp:RegularExpressionValidator>

                                    <br />
                                    <asp:TextBox ID="txtuserpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ErrorMessage="Enter Password" ControlToValidate="txtuserpass"
                                        ValidationGroup="abcccc" Display="None"></asp:RequiredFieldValidator>


                                    <asp:RegularExpressionValidator ID="Regex2" Display="None" runat="server" ControlToValidate="txtuserpass"
                                        ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,})$"
                                        ErrorMessage="Password must be of minimum 6 characters and No Special Character" ValidationGroup="abcccc" ForeColor="Red" />




                                    <br />
                                    <asp:TextBox ID="txtcpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="ConfirmPassword"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToCompare="txtuserpass" ControlToValidate="txtcpass" Display="None"
                                        ErrorMessage="Password Not Match" ValidationGroup="abcccc"></asp:CompareValidator>
                                    <br />


                                    <asp:Button ID="Button5" runat="server" Text="Register" ValidationGroup="abcccc"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button5_Click" />
                                    <br />

                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="abcccc" runat="server" ShowMessageBox="True" ShowSummary="False" />


                                </asp:Panel>
                                <asp:Panel ID="Panel13" Visible="false" runat="server">

                                    <center>
                                        <h3 style="color: White" class="fonnt">Enter Verification Code</h3>
                                    </center>
                                    <asp:Label ID="lblfirstverification" Visible="false" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="txtfiratverification" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"
                                        ErrorMessage="Enter OTP" ControlToValidate="txtfiratverification" Display="None"
                                        ValidationGroup="jacks"></asp:RequiredFieldValidator>
                                    <br />


                                    <asp:Button ID="Button16" runat="server" Text="Finish" ValidationGroup="jacks"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button5_Clickfirstverify" />
                                    <asp:Button ID="Button17" runat="server" Text="Cancel"
                                        Style="color: white; background-color: #333;"
                                        class="btn form-btn btn-lg btn-block" OnClick="Button5_Clickfirstcancel" />
                                    <br />

                                    <asp:ValidationSummary ID="ValidationSummary9" ValidationGroup="jacks" runat="server" ShowMessageBox="True" ShowSummary="False" />

                                </asp:Panel>
                            </div>

                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <ProgressTemplate>

                                    <div style="z-index: 10025; left: 45%; position: fixed; top: 40%">
                                        <center>
                                            <img id="imglaaaddoader" runat="server" src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                        </center>
                                    </div>
                                </ProgressTemplate>

                            </asp:UpdateProgress>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>

            <div>
                <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" CancelControlID="Button9" BackgroundCssClass="modalBackground" PopupControlID="Panel5" TargetControlID="LinkButton4">
                </asp:ModalPopupExtender>


                <asp:Panel ID="Panel5" runat="server" CssClass="modalPopup1" align="center" Style="display: none; top: 86.5px;">
                    <asp:Button ID="Button9" runat="server" Text="X" CssClass="kaushik" />
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="color: white;">
                                <asp:RadioButton ID="RadioButton1" Style="margin-left: -16px; padding-left: 7px;" GroupName="a" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" runat="server" Text="I don't have an account" /><br />

                                <asp:RadioButton ID="RadioButton2" GroupName="a" AutoPostBack="true" Style="padding-left: 7px;" OnCheckedChanged="RadioButton2_CheckedChanged" runat="server" Text="I already have an account" />
                            </div>

                            <asp:Panel ID="Panel6" runat="server">
                                <asp:Panel ID="Panel10" runat="server">

                                    <div class="txtwid" style="margin-top: 15px; width: 68%;">
                                        <center>
                                            <h2 class="fonnt">Create Account Here</h2>
                                        </center>

                                        <asp:TextBox ID="txtname2" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                            ErrorMessage="Enter Name" ControlToValidate="txtname2" Display="None"
                                            ValidationGroup="abccccc"></asp:RequiredFieldValidator>

                                        <br />
                                        <asp:TextBox ID="txtmobile2" runat="server" CssClass="form-control" placeholder="Mobile Number(Ex:9898xxx)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                            ErrorMessage="Enter Mobile Number" ControlToValidate="txtmobile2"
                                            Display="None" ValidationGroup="abccccc"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                            ControlToValidate="txtmobile2" Display="None"
                                            ErrorMessage="Enter Valid Mobile Number"
                                            ValidationExpression="^[0-9]{10}$"
                                            ValidationGroup="abccccc"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:TextBox ID="txtemail2" runat="server" CssClass="form-control" placeholder="Email id"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                            ErrorMessage="Enter Email Id" ControlToValidate="txtemail2" Display="None"
                                            ValidationGroup="abccccc"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                                            ControlToValidate="txtemail2" Display="None" ErrorMessage="Enter Valid Email Id"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="abccccc"></asp:RegularExpressionValidator>

                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" Display="None" Style="font-size: xx-small;" runat="server" ControlToValidate="txtuserpass22"
                                            ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,})$"
                                            ErrorMessage="Password must be of minimum 6 characters and No Special Character" ValidationGroup="abccccc" ForeColor="Red" />
                                        <asp:TextBox ID="txtuserpass22" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                            ErrorMessage="Enter Password" ControlToValidate="txtuserpass22"
                                            ValidationGroup="abccccc" Display="None"></asp:RequiredFieldValidator>

                                        <br />
                                        <asp:TextBox ID="txtcpass2" runat="server" CssClass="form-control" TextMode="Password" placeholder="ConfirmPassword"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                            ErrorMessage="Enter Confirm Password" ControlToValidate="txtcpass2"
                                            ValidationGroup="abccccc" Display="None"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                                            ControlToCompare="txtuserpass22" ControlToValidate="txtcpass2" Display="None"
                                            ErrorMessage="Password Not Match" ValidationGroup="abccccc"></asp:CompareValidator>

                                        <br />

                                        <asp:Button ID="Button10" runat="server" Text="Register" ValidationGroup="abccccc"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button5_Click2" />

                                        <asp:ValidationSummary ID="ValidationSummary5" ValidationGroup="abccccc" runat="server" ShowMessageBox="True" ShowSummary="False" />

                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel11" Visible="false" runat="server">
                                    <div class="txtwid" style="margin-top: 15px; width: 68%;">
                                        <center>
                                            <h3 style="color: White" class="fonnt">Enter Verification Code</h3>
                                        </center>
                                        <asp:Label ID="lbllotp" Visible="false" runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txtverification" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"
                                            ErrorMessage="Enter OTP" ControlToValidate="txtverification" Display="None"
                                            ValidationGroup="jack"></asp:RequiredFieldValidator>
                                        <br />


                                        <asp:Button ID="Button14" runat="server" Text="Finish" ValidationGroup="jack"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button5_Click22" />
                                        <asp:Button ID="Button15" runat="server" Text="Cancel"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button5_Click222" />
                                        <br />

                                        <asp:ValidationSummary ID="ValidationSummary8" ValidationGroup="jack" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                    </div>
                                </asp:Panel>


                            </asp:Panel>

                            <asp:Panel ID="Panel7" Visible="false" runat="server">

                                <asp:Panel ID="Panel8" runat="server">
                                    <div class="txtwid" style="margin-top: 15px; width: 68%;">
                                        <center>
                                            <h2>Login Here</h2>
                                        </center>

                                        <asp:TextBox ID="txtusername2" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                            ErrorMessage="Enter Registered Email Id" ControlToValidate="txtusername2" Display="None"
                                            ValidationGroup="dsdds"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                                            ControlToValidate="txtusername2" Display="None" ErrorMessage="Enter Valid Email Id"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="dsdds"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:TextBox ID="txtpass2" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                            ErrorMessage="Enter Password" ControlToValidate="txtpass2" Display="None"
                                            ValidationGroup="dsdds"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary6" ValidationGroup="dsdds" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                        <asp:Button ID="Button11" runat="server" Text="Login" ValidationGroup="dsdds"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button2_Click2" />
                                        <br />
                                        <asp:LinkButton OnClick="jack2" ID="LinkButton5" runat="server">Forgot Password</asp:LinkButton>
                                    </div>

                                </asp:Panel>

                                <asp:Panel ID="Panel9" Visible="false" runat="server">
                                    <div style="margin-top: 15px; width: 68%;">
                                        <center>
                                            <h2>Recover Password</h2>
                                        </center>

                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter Registered Email Id"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                                            ErrorMessage="Enter Registered Email Id" ControlToValidate="TextBox3" Display="None"
                                            ValidationGroup="dssss"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                            ControlToValidate="TextBox3" Display="None" ErrorMessage="Enter Valid Email Id"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="dssss"></asp:RegularExpressionValidator>
                                        <br />



                                        <asp:Button ID="Button12" runat="server" Text="Recover" ValidationGroup="dssss"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button7_Click2" />
                                        <asp:Button ID="Button13" runat="server" Text="Cancel"
                                            Style="color: white; background-color: #333;"
                                            class="btn form-btn btn-lg btn-block" OnClick="Button8_Click2" />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                        <asp:ValidationSummary ID="ValidationSummary7" ValidationGroup="dssss" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                    </div>
                                </asp:Panel>

                            </asp:Panel>

                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                <ProgressTemplate>

                                    <div style="z-index: 10025; left: 45%; position: fixed; top: 40%">
                                        <center>
                                            <img id="imglddoadaaer" runat="server" src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                        </center>
                                    </div>
                                </ProgressTemplate>

                            </asp:UpdateProgress>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <!-- End header section -->

            <!-- Start menu section -->
            <section id="menu-area">
	<nav class="navbar navbar-default main-navbar" role="navigation">  
	  <div class="container">
		<div class="navbar-header">
		  <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <!-- LOGO -->                                               
		   <a class="navbar-brand logo" href="Default.aspx"><img src="assets/images/LogoHDSmall copy.png" style="
	margin-top: 11px !important;
" alt="logo"></a>                      
		</div>
		<div id="navbar" class="navbar-collapse collapse">
		  <ul id="top-menu" class="nav navbar-nav main-nav menu-scroll">
			<li class="active"><a href="#header">HOME</a></li>
			<li><a href="#about">ABOUT</a></li>               
		   
				 <li><a href="#service">TEAM</a></li>      
			<li> <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="MakeLoginFormVisible()">LOGIN</asp:LinkButton> </li>  
			 <li> <asp:LinkButton ID="LinkButton2" runat="server">REGISTER</asp:LinkButton> </li> 
			 <li><a href="#contact">CONTACT</a></li>
		  </ul>                            
		</div><!--/.nav-collapse -->
	   <div class="search-area">
		  <%--<form action="">
			<input id="search" name="search" type="text" placeholder="What're you looking for ?">
			<input id="search_submit" value="Rechercher" type="submit">
		  </form>--%>
		</div>         
	  </div>          
	</nav> 
  </section>
            <!-- End menu section -->

            <!-- Start about section -->
            <section id="about">
	<div class="container">
	  <div class="row">
		<div class="col-md-12">
		  <!-- Start welcome area -->
		  <div class="welcome-area">
			<div class="title-area">
			  <h2 class="tittle"  style="text-align:center !important;">How it works<span></span></h2>
			  <span class="tittle-line" style="text-align:center !important;"></span>
			  <p>Spare parking space can be proved much beneficial to parking space owner and parking space seeker. The parking space owner can register their parking space on ParkingMy.com.
At ParkingMy.com a space seeker or driver can find available parking spaces in a geo-location and can
contact a space owner. Space seeker will be charged by space owner not by ParkingMy.com</p>
			</div>
			
			<div class="welcome-content" style="padding: 10px; border-top: 1px solid #bbbbbb;">
			 <h2 class="tittle"  style="text-align:center !important;"><span>Parking Space Owners</span></h2>
				<%--  <span class="tittle-line" style="text-align:center !important;"></span>--%>
			  <ul class="wc-table">
				<li>
				  <div class="single-wc-content wow fadeInUp">
				 
					<span class="fa fa-server wc-icon"></span>
					<h4 class="wc-tittle" style="border-bottom: 1px solid rgba(187, 187, 187, 0);">LIST SPACE</h4>
			   
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-usd wc-icon"></span>
					<h4 class="wc-tittle" style="border-bottom: 1px solid rgba(187, 187, 187, 0);">PAY</h4>
			   
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-envelope-square wc-icon"></span>
					<h4 class="wc-tittle" style="border-bottom: 1px solid rgba(187, 187, 187, 0);">GET NOTIFIED</h4>
					<%--<p>At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>--%>
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-cart-arrow-down wc-icon"></span>
					<h4 class="wc-tittle" style="border-bottom: 1px solid rgba(187, 187, 187, 0);">GET PAID</h4>
				  <%--  <p>At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>--%>
				  </div>
				</li>
				
			   <diV style="padding-top: 230px;">
			 
				<h2 class="tittle"  style="text-align:center !important;"><span>Parking Space Seekers</span></h2>
				  </diV>
				 <li>
				  <div class="single-wc-content wow fadeInUp">
				 
					<span class="fa fa-map-marker wc-icon"></span>
					<h4 class="wc-tittle">SEARCH PARKING SPACES</h4>
				<p style="visibility:hidden;">At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-envelope wc-icon"></span>
					<h4 class="wc-tittle">NOTIFY SPACE OWNER</h4>
				<p style="visibility:hidden;">At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-exchange  -square wc-icon"></span>
					<h4 class="wc-tittle">NEGOTIATION</h4>
					<%--<p>At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>--%>
				  </div>
				</li>
				<li>
				  <div class="single-wc-content wow fadeInUp">
					<span class="fa fa-thumbs-o-up wc-icon"></span>
					<h4 class="wc-tittle">GET PARKING SPACE</h4>
				  <%--  <p>At vero eos et accusamus et iusto odio in dignissimos ducimus voluptatum in delenatque </p>--%>
				  </div>
				</li>
			  
			  </ul>
			</div>
		   
		  </div>
		  <!-- End welcome area -->
		</div>
	  </div>
	  <div class="row">
		<div class="col-md-12">
		  <div class="about-area">
			<div class="row">
			  <div class="col-md-5 col-sm-6 col-xs-12">
				<div class="about-left wow fadeInLeft">
				  <img src="assets/images/about-img.jpg" alt="img">
				  <%--<a class="introduction-btn" href="#">Introduction</a>--%>
				</div>
			  </div>
			  <div class="col-md-7 col-sm-6 col-xs-12">
				<div class="about-right wow fadeInRight">
				  <div class="title-area">
					<h2 class="tittle">About <span>ParkingMy.com</span> </h2>
					<span class="tittle-line"></span>
					<p>
					 "It all started from a middle class family's dream of buying a car, which could not lasted long since it got dropped by having no parking space in their home, So we wanted to solve the problem of limited or no parking space for us and for those who are in same page as we are".<br /><br />

Here we are bringing a platform where in people can list their spare parking space whether in a  garage, car park, private driveway or a school campus for rent and needy people can get parking space for rented on hourly, daily , weekly or monthly charge.<br /><br />

We are a startup now and we are committed to solve the <span style="color: #00d999;font-weight: bold;">NoParkingSpaceAvailable</span> problem and we are also committed to expand this service to other metro cities.
					</p>
					<%--<div class="about-btn-area">
					  <a href="#" class="button button-default" data-text="KNOW MORE"><span>KNOW MORE</span></a>
					</div>--%>                    
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </section>
            <!-- End about section -->





            <!-- Start service section -->
            <section id="service">
	<div class="container">
	  <div class="row">
		<div class="col-md-12">
		  <div class="team-area">
			<div class="title-area">
			  <h2 class="tittle">Our team</h2>
			  <span class="tittle-line"></span>
			 
			</div>
			<!-- Start team content -->
			<div class="team-content">
			  <ul class="team-grid">
				<li>
				  <div class="team-item team-img-1 wow fadeInUp">
					<div class="team-info">
					  <p> </p>
					  <a href="https://www.facebook.com/galib.gaurav" target="_blank" ><span class="fa fa-facebook"></span></a>
					  <a href="https://twitter.com/simplygalib" target="_blank" ><span class="fa fa-twitter"></span></a>
				   
					</div>
				  </div>
				  <div class="team-address">
					<p>Galib Gaurav</p>
					<span>Co-Founder</span>
				  </div>
				</li>
				  <li>
				  <div class="team-item team-img-0 wow fadeInUp">
					<div class="team-info">
					  <p> </p>
					  <a href="https://www.facebook.com/gauravsitu" target="_blank" ><span class="fa fa-facebook"></span></a>
					  <a href="https://twitter.com/krgaurav0209" target="_blank" ><span class="fa fa-twitter"></span></a>
				   
					</div>
				  </div>
				  <div class="team-address">
					<p>Kumar Gaurav</p>
					<span>Co-Founder</span>
				  </div>
				</li>
				<li>
				  <div class="team-item team-img-2 wow fadeInUp">
					<div class="team-info">
				  
					  <a href="https://www.facebook.com/SumitJackSpero"><span class="fa fa-facebook"></span></a>
				   </div>
				  </div>
				  <div class="team-address">
					<p>Sumeet Jain</p>
					<span>Developer</span>                  
				  </div>
				</li>
				<li>
				  <div class="team-item team-img-3 wow fadeInUp">
					<div class="team-info">
					
					  <a href="https://www.facebook.com/zanzrukiya.alpesh"><span class="fa fa-facebook"></span></a>
					  
					</div>
				  </div>
				  <div class="team-address">
					<p>Alpesh Zanzrukiya</p>
					<span>Developer</span>
				  </div>
				</li>
				 
			  </ul>
			</div>
			<!-- End team content -->
		  </div>
		</div>
	  </div>
	</div>
  </section>
            <!-- End service section -->







            <!-- Start Contact section -->
            <section id="contact">
	<div class="container">
	  <div class="row">
		<div class="col-md-4 col-sm-6 col-xs-12">
		  <div class="contact-left wow fadeInLeft">
			<h2>Contact with us</h2>
			<address class="single-address">
			  <h4>Address:</h4>
			  <p>9th F Cross Road<br />
SBI Colony,1st Phase,J P Nagar<br />
Bengaluru,Karnataka 560078</p>
			</address>
		  
			 <address class="single-address">
			  <h4>Phone</h4>
			  <p>Phone Number: 9448159227</p>
			</address>
			 <address class="single-address">
			  <h4>E-Mail</h4>
			  <p>Support: support@parkingmy.com</p>
			</address>
		  </div>
		</div>
		<div class="col-md-8 col-sm-6 col-xs-12">
		  <div class="contact-right wow fadeInRight">
			<h2>Send a message</h2>
			<div  class="contact-form">
			  <div class="form-group">  
			  <asp:TextBox ID="txtusernam" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
			  <asp:RequiredFieldValidator ValidationGroup="mesg" ControlToValidate="txtusernam" Display="None" ErrorMessage="Enter Name" ID="RequiredFieldValidator6" runat="server" ></asp:RequiredFieldValidator>
			  <asp:RegularExpressionValidator ID="RegularExpressionValidator11" Display="None" ValidationGroup="mesg" ValidationExpression="^[a-zA-Z0-9''-'\s]{5,25}$" runat="server" ControlToValidate="txtusernam" ErrorMessage="Enter Valid Name"></asp:RegularExpressionValidator>
			  </div>
			  <div class="form-group">                
			  <asp:TextBox ID="txtmob" runat="server" class="form-control" placeholder="Mobile Number "></asp:TextBox>
			  <asp:RequiredFieldValidator ValidationGroup="mesg" ControlToValidate="txtmob" Display="None" ErrorMessage="Enter Mobile Number" ID="RequiredFieldValidator7" runat="server" ></asp:RequiredFieldValidator>
			  <asp:RegularExpressionValidator ID="RegularExpressionValidator12" Display="None" ValidationGroup="mesg" ValidationExpression="^[0-9]{10}$" runat="server" ControlToValidate="txtmob" ErrorMessage="Enter Valid 10 Digit Number"></asp:RegularExpressionValidator>
			  </div>  
			   <div class="form-group">                
			   <asp:TextBox ID="txtema" runat="server" class="form-control" placeholder=" Email Id"></asp:TextBox>
			   <asp:RequiredFieldValidator ValidationGroup="mesg" ControlToValidate="txtema" Display="None" ErrorMessage="Enter Email" ID="RequiredFieldValidator8" runat="server" ></asp:RequiredFieldValidator>
			  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
												ControlToValidate="txtema" Display="None" ErrorMessage="Enter Valid Email Id" 
												ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
												ValidationGroup="mesg"></asp:RegularExpressionValidator>
			  </div>            
			  <div class="form-group">
				<asp:TextBox ID="txtmsg" runat="server" class="form-control" placeholder="Message" Rows="7" TextMode="MultiLine"></asp:TextBox>
				<asp:RequiredFieldValidator ValidationGroup="mesg" ControlToValidate="txtmsg" Display="None" ErrorMessage="Enter Message" ID="RequiredFieldValidator9" runat="server" ></asp:RequiredFieldValidator>
			  </div>
		  <asp:Button ID="Button2" runat="server" Text="SUBMIT" ValidationGroup="mesg" class="button bbbttt button-default dklll" onclick="Button1_Click"></asp:Button>
		   <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="mesg" ShowMessageBox="true" ShowSummary="false" runat="server"></asp:ValidationSummary>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </section>
            <!-- End Contact section -->
            <!-- Start Google Map -->
            <section id="google-map">
  
  <%--<iframe src="https://www.google.com/maps/d/embed?mid=zTD7RabWeJ00.kgWgroJRyaAc" width="100%" height="500"></iframe>--%>
			 <iframe width="100%" height="500" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJFRxc2m8VrjsRwS8g4zWEdLo&key=AIzaSyCwbt61m8Mpefk04QjCIJEeQ8AWzpCIy8Y" allowfullscreen></iframe>  </section>
            <!-- End Google Map -->

            <!-- Start Footer -->
            <footer id="footer">
	<div class="footer-top">
	  <div class="container">
		<div class="row">
		  <div class="col-md-12">
			<div class="footer-top-area">             
				<a class="footer-logo" href="#"><img src="assets/images/Logo (1).png"  style="
	margin-top: 12px;
	/* top: 12px; */
" alt="Logo"></a>              
			  <div class="footer-social">
				 <a class="facebook" href="https://www.facebook.com/parkingmy/" target="_blank" ><span class="fa fa-facebook" style="line-height: 47px;"></span></a>
				<a class="twitter" href="https://twitter.com/ParkingMyCom"target="_blank"  ><span class="fa fa-twitter" style="line-height: 47px;"></span></a>
				<a class="google-plus" href="https://plus.google.com/109417580993695308682" target="_blank" ><span class="fa fa-google-plus" style="line-height: 47px;"></span></a>
			  
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
	<div class="footer-bottom">
	<p><a href="Privacypolicy.aspx">Privacy Policy</a><span> , </span><a href="terms_Condition.aspx">Terms and condition </a></p>
	  <p>Developed by <a href="#" >Connected Skills</a></p>
	</div>
  </footer>
            <!-- End Footer -->


        </div>
    </form>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalError" id="btnError" style="display: none">
    </button>
    <!-- Modal -->
    <div class="modal fade" id="myModalError" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalTitle" style="color: red; font-weight: bold;">title</h4>
                </div>
                <div class="modal-body" id="myModalMessage">
                    message
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveBtn" style="display: none">Save changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeBtn">Close</button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalSuccess" id="btnSuccess" style="display: none">
    </button>
    <!-- Modal -->
    <div class="modal fade" id="myModalSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalTitle1" style="color: green; font-weight: bold;">title</h4>
                </div>
                <div class="modal-body" id="myModalMessage2">
                    message
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="Button19" style="display: none">Save changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="Button20">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--START: Subscribe Modal Coding -->
    <div id="subscribeModal" class="modal fade">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Newsletter</h4>
                </div>
                <div class="modal-body">
                    <p>Subscribe and Stay tuned.</p>
                    <form class="subscribe-form">
                        <div class="input-group subscribe-form-input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-envelope"></span>
                            </span>
                                <input type="email" class="form-control" id="subscribe-email" placeholder="your@email.com" required="required" />
                        </div>
                        <div class="input-group subscribe-form-input-group">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-phone"></span>
                                </span>
                                <input type="text" class="form-control" id="subscribe-contactNumber" placeholder="999 9999 9999" required="required"/>
                        </div>
                        <button type="button" id="subscribe-btn" class="btn-sm btn-primary subscribe-form-input-group">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--END: Subscribe Modal Coding -->

    <!-- initialize jQuery Library -->
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Bootstrap -->

    <!-- Slick Slider -->
    <script type="text/javascript" src="assets/js/slick.js"></script>
    <!-- Counter -->
    <script type="text/javascript" src="assets/js/waypoints.js"></script>
    <script type="text/javascript" src="assets/js/jquery.counterup.js"></script>
    <!-- mixit slider -->
    <script type="text/javascript" src="assets/js/jquery.mixitup.js"></script>
    <!-- Add fancyBox -->
    <script type="text/javascript" src="assets/js/jquery.fancybox.pack.js"></script>
    <!-- Wow animation -->
    <script type="text/javascript" src="assets/js/wow.js"></script>

    <!-- Custom js -->
    <script type="text/javascript" src="assets/js/custom.js"></script>
</body>
</html>
