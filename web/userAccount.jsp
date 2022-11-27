<%-- 
    Document   : userAccount
    Created on : Jun 9, 2022, 7:53:07 AM
    Author     : DELL
--%>


<%@page import="sample.user.UserError"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page import="sample.tea.Cart"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.user.GoogleUserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>User Page</title>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href='edd_templates/edd.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/bootstrap.min.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='style.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/font-awesome.css' type='text/css' media='all'/>

        <!-- UNCOMMENT THE FOLLOWING LINE TO ACTIVATE THE BOXED LAYOUT (see the documentation for more)-->

        <!--
        <link href="assets/css/boxed.css" rel="stylesheet">
        -->	

        <!-- CHANGE THEME SKIN COLOR HERE (replace blue with any other color from assets/css/skins/ folder) -->
        <link href="assets/css/skins/blue.css" rel="stylesheet">

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
                                            <h1>User Account</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / User Account
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TITLE ENDS -->


                    <div class="container padtop40 padbot50">
                        <div class="row">
                            <div class="col-md-6">
                                <span class="smalltitle">Purchase History</span>
                                <table id="edd_user_history">
                                    <thead>
                                        <tr class="edd_purchase_row">
                                            <th class="edd_purchase_id">
                                                ID
                                            </th>
                                            <th class="edd_purchase_date">
                                                Date
                                            </th>
                                            <th class="edd_purchase_amount">
                                                Amount
                                            </th>
                                            <th class="edd_purchase_details">
                                                Details
                                            </th>
                                        </tr>
                                    </thead>
                                    <tr class="edd_purchase_row">
                                        <td class="edd_purchase_id">
                                            #147
                                        </td>
                                        <td class="edd_purchase_date">
                                            March 1, 2015
                                        </td>
                                        <td class="edd_purchase_amount">
                                            <span class="edd_purchase_amount">$27.00</span>
                                        </td>
                                        <td class="edd_purchase_details">
                                            <a href="purchaseconfirmation.jsp">View Details and Downloads</a>
                                        </td>
                                    </tr>
                                </table>
                                <div id="edd_purchase_history_pagination" class="edd_pagination navigation">
                                </div>
                                <div style="margin-top:40px;display:block;">
                                    <span class="smalltitle">Shopping Cart</span>
                                <%
                                    double total = 0;
                                    Cart cart = (Cart) session.getAttribute("CART");
                                    int size = 0;
                                    if (cart == null) {
                                        size = 0;
                                    } else {
                                        size = cart.getSize();
                                    }
                                %>
                                <div class="shoppingcartarea">
                                    <p class="edd-cart-number-of-items" style="">
                                        Number of items in cart: <span class="edd-cart-quantity"><%=size%></span>
                                    </p>
                                    <ul class="edd-cart">
                                        <%
                                            if (cart != null && cart.getCart().size() > 0) {
                                                for (TeaDTO tea : cart.getCart().values()) {
                                                    total += tea.getPrice() * tea.getQuantity();
                                        %>
                                        <li class="edd-cart-item">
                                            <span class="edd-cart-item-title"><%=tea.getName()%></span>
                                            <span class="edd-cart-item-separator">-</span><span class="edd-cart-item-price">&nbsp;<%=tea.getPrice()%>VNĐ&nbsp;</span>
                                            <a href="MainController?action=Remove&productID=<%=tea.getProductID()%>" class="edd-remove-from-cart" style="float: right;">remove</a>
                                        </li>
                                        <%
                                                }
                                            }
                                        %>
                                        <li class="cart_item edd_subtotal" style="">Subtotal: <span class='subtotal'><%=total%>VNĐ</span></li>
                                        <li class="cart_item edd_checkout" style=""><a href="checkout.jsp">Checkout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (loginUser == null) {
                                response.sendRedirect("index.jsp");
                                return;
                            }
                            UserError userError = (UserError) request.getAttribute("USER_ERROR");
                            if (userError == null) {
                                userError = new UserError();
                            }
                            String message = (String) request.getAttribute("MESSAGE");
                            if (message == null) {
                                message = "";
                            }
                        %>
                        <div class="col-md-6">
                            <span class="smalltitle">Profile Editor</span>
                            <h5 style="color: green;"><%=message%></h5>
                            <form id="edd_profile_editor_form" class="edd_form" action="MainController" method="post">
                                <fieldset>
                                    <p id="edd_profile_name_wrap">
                                        <label for="edd_last_name">User Name</label>
                                        <input name="userName" id="edd_last_name" class="text edd-input" type="text" value="<%=loginUser.getUserName()%>"/>
                                    </p>
                                    <%=userError.getUserName()%>
                                    <p>
                                        <label for="edd_email">Email </label>
                                        <input name="email" id="edd_email" class="text edd-input required" type="email" value="<%=loginUser.getEmail()%>"/>
                                    </p>
                                    <%=userError.getEmail()%>
                                    <%
                                        String gmail = (String) request.getAttribute("GMAIL");
                                        if (gmail == null) {
                                            gmail="";
                                    %>
                                    <p id="edd_profile_billing_address_wrap">
                                        <label for="edd_gender_line1">Gender</label>
                                        <select name="gender">     
                                            <option value="male" <%=loginUser.getGender().equals("male") == true ? "selected" : ""%> >Male</option>
                                            <option value="female" <%=loginUser.getGender().equals("female") == true ? "selected" : ""%> >Female</option>
                                        </select>
                                        <br/>
                                        <label for="edd_gender_line1">Birthday</label>
                                        <input name="birthdate" id="edd_address_Birthdate" class="text edd-input" type="date" value="<%=loginUser.getBirthdate()%>"/>
                                        <br/>
                                        <label for="edd_address_line2">Address</label>
                                        <input name="address" id="edd_address_address" class="text edd-input" type="text" value="<%=loginUser.getAddress()%>"/>
                                        <br/>
                                    </p>
                                    
                                    <p id="edd_profile_password_wrap">
                                        <label>New Password</label>
                                        <input name="newPassword" id="edd_new_user_pass1" class="password edd-input" type="password"/>
                                        <br/>
                                        <label>Re-enter Password</label>
                                        <input name="confirm" id="edd_new_user_pass2" class="password edd-input" type="password"/>
                                    </p>
                                    <%=userError.getPassword()%>
                                    <p class="edd_password_change_notice">
                                        Please note after changing your password, you must log back in.
                                    </p>
                                    <p id="edd_profile_submit_wrap">
                                        <input name="action" id="edd_profile_editor_submit" type="submit" class="edd_submit" value="Save Changes"/>
                                        <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>"/>
                                    </p>                                   
                                    <%
                                        }
                                    %>
                                    
                                </fieldset>
                            </form>
                                    <h4 style="color: #4cae4c"><%=gmail%></h4>
                            <!-- #edd_profile_editor_form -->
                            <a class="button logout" href="MainController?action=Logout" title="Logout"><i class="fa fa-sign-out"></i> Log Out</a>
                        </div>
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
        </div>
    </body>
</html>
