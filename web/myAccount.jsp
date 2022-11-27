<%-- 
    Document   : myAccount
    Created on : Jun 8, 2022, 5:12:47 PM
    Author     : DELL
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Account Page</title>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href='edd_templates/edd.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/bootstrap.min.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='style.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/font-awesome.css' type='text/css' media='all'/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <!-- UNCOMMENT THE FOLLOWING LINE TO ACTIVATE THE BOXED LAYOUT (see the documentation for more)-->

        <!--
        <link href="assets/css/boxed.css" rel="stylesheet">
        -->	

        <!-- CHANGE THEME SKIN COLOR HERE (replace blue with any other color from assets/css/skins/ folder) -->
        <link href="assets/css/skins/blue.css" rel="stylesheet">
        <style>
            .Login_with_google{
                padding: 8px;
                padding-right: 15px;
                border-radius: 10px;
                font-size: 18px;
                color: white;
                background-color: #8bcdeb;
            }
            .Login_with_google i{
                margin-right: 5px;
                font-size: 18px;
                padding: 5px;
                color: white;
            }
            .Login_with_google:hover{
                color: white;
            }

        </style>
    </head>


    <body>
        <div class="boxedlayout">

            <!-- HEADER
            ================================================== -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- PAGE CONTENT
                ================================================== -->
                <div class="templatemyaccount">

                    <!-- TITLE BEGINS -->
                    <div class="headerimage" style="background-image: url(http://www.themepush.com/demo-kailo/wp-content/uploads/sites/6/2015/03/header.jpg);">
                        <div class="headercontent">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="fleft">
                                            <h1>My Account</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / My Account
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TITLE ENDS -->

                    <div class="container padtop40 padbot50">
                        <div class="row">
                            <!-- MAIN CONTENT BEGINS -->                        
                            <div class="col-md-12">
                                <div class="wraplogin">
                                    <form id="edd_login_form" class="edd_form" action="MainController" method="POST">
                                        <fieldset>
                                            <legend>Log into Your Account</legend>

                                            <p>
                                                <label>Username</label>
                                                <input name="userName" id="edd_user_login" class="required edd-input" type="text" title="Username" required=""/>
                                            </p>
                                            <p>
                                                <label>Password</label>
                                                <input name="password" id="edd_user_pass" class="password required edd-input" type="password" required=""/>
                                            </p>
                                            <!-- RECAPTCHA -->
                                            <div class="g-recaptcha" data-sitekey="6LeCbmMgAAAAAKfJEhXtaFMzu0o-Zmt3FwUs1rXh"></div>
                                            <p>
                                                <input id="edd_login_submit" type="submit" class="edd_submit" name="action" value="Login"/>
                                            <%
                                                String error = (String) request.getAttribute("ERROR");
                                                if (error == null) {
                                                    error = "";
                                                }
                                            %>
                                        <p style="color: red;"><%=error%></p>      
                                        </p>
                                        <p class="edd-lost-password">
                                            <a href="#" title="Lost Password">
                                                Lost Password? </a>
                                        </p>
                                        <a class="Login_with_google" href="https://accounts.google.com/o/oauth2/auth?scope=openid%20profile%20email&redirect_uri=http://localhost:8080/MilkTeaManagement/LoginGoogleController&response_type=code
                                           &client_id=1069845867814-2iah9c450orumncu1mqra3bl6fj03i7b.apps.googleusercontent.com&approval_prompt=force"><i class="fa-brands fa-google-plus-g"></i>Login With Google</a> 
                                    </fieldset>
                                </form>

                            </div>
                            <span class="or">or</span>
                            <%
                                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                if (userError == null) {
                                    userError = new UserError();

                                }
                            %>

                            <div class="wrapregister">
                                <form id="edd_register_form" class="edd_form" action="MainController" method="POST">
                                    <fieldset>
                                        <legend>Register New Account</legend>
                                        <p>
                                            <label>Username</label>
                                            <input id="edd-user-login" class="required edd-input" type="text" name="userName" title="Username"/>
                                        </p>
                                        <%=userError.getUserName()%>
                                        <p>
                                            <label>Email</label>
                                            <input id="edd-user-email" class="required edd-input" type="email" name="email" title="Email Address"/>
                                        </p>
                                        <%=userError.getEmail()%>
                                        <p>
                                            <label>Password</label>
                                            <input id="edd-user-pass" class="password required edd-input" type="password" name="password"/>
                                        </p>

                                        <p>
                                            <label>Confirm Password</label>
                                            <input id="edd-user-pass2" class="password required edd-input" type="password" name="confirm"/>
                                        </p>
                                        <%=userError.getPassword()%>
                                        <p>
                                            <input class="button" name="action" type="submit" value="Create"/>
                                        </p>
                                        <%
                                            String message=(String) request.getAttribute("MESSAGE");
                                            if(message==null){
                                                message="";
                                            }
                                        %>
                                        <p style="color: limegreen"><%=message%></p>
                                    </fieldset>
                                </form>
                            </div>
                        </div>				
                        <!-- MAIN CONTENT ENDS -->

                    </div>				
                </div>
            </div>		


            <!-- FOOTER
            ================================================== -->		
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- SCRIPTS
            ================================================== -->			
            <script type='text/javascript' src='assets/js/jquery.js'></script>
            <script type='text/javascript' src='assets/js/bootstrap.min.js'></script>
            <script type='text/javascript' src='assets/js/masonry.js'></script>
            <script type='text/javascript' src='assets/js/imagesloaded.js'></script>
            <script type='text/javascript' src='assets/js/SmoothScroll.js'></script>
            <script type='text/javascript' src='assets/js/init.js'></script>
            <script type='text/javascript' src='assets/js/anim.js'></script>
            <script src="https://www.google.com/recaptcha/api.js"></script>
        </div>
    </body>
</html>
