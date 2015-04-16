<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - OS MobileShop</title>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>

     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
       <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Register for <strong>MobileShop</strong></h3>
                    </div>
        
                    <div class="panel-body">
                 
                            <fieldset>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Company Name" ControlToValidate="txt_company" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_company" class="form-control" runat="server" placeholder="Company Name"></asp:TextBox>
                                </div>
                                <div class="form-group"> 
                                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" >dfdfdsa</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter User Name" ControlToValidate="txt_username" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                   
                                    <asp:TextBox ID="txt_username" class="form-control" runat="server" placeholder="User Name" AutoPostBack="True"></asp:TextBox>                               
                                </div>
                                <div class="form-group">  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txt_password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                  
                                    <asp:TextBox ID="txt_password" class="form-control" placeholder="Password" runat="server" TextMode="Password"  ></asp:TextBox>
                                </div>
                                <div class="form-group">     
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Phone Number" ControlToValidate="txt_phone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_phone" ErrorMessage="Enter Valid Phone number" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                 
                                    <asp:TextBox ID="txt_phone" class="form-control" runat="server" placeholder="Phone Number" MaxLength="10"></asp:TextBox>                               
                                </div>
                                <div class="form-group">  
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="txt_email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                  
                                    <asp:TextBox ID="txt_email" class="form-control" placeholder="E-mail" runat="server" type="Email" ></asp:TextBox>
                                </div>
                                
                              
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-success btn-block" Text="Register" />
                                <asp:Button ID="Button2" runat="server" class="btn btn-lg btn-primary btn-block" Text="Already Registerd? Login here" CausesValidation="False" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel>

<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1" >
<ProgressTemplate>
                                            <div style="background-color: white; filter:alpha(opacity=60); opacity:0.60; width: 100%; top: 0px; left: 0px; position: fixed; height: 100%;">
        </div>
          <div style="margin:auto;
              font-family:Trebuchet MS;
              filter: alpha(opacity=100);
              opacity: 1;
              font-size:small;
              vertical-align: middle;
              top: 45%;
              position: fixed;
              right: 45%;
              color: #2f302f;
              text-align: center;
              
              height: 100px;
              ">
                <img src="img/poi_blue.gif" alt="Loading"  />
                
                
        
                                        </ProgressTemplate>
                                            
                                        </asp:UpdateProgress>






        
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    </form>
</body>
</html>
