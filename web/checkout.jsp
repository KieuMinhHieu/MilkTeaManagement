<%-- 
    Document   : checkout.jsp
    Created on : Jun 27, 2022, 10:54:23 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page import="sample.tea.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Meri - Checkout</title>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href='edd_templates/edd.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/bootstrap.min.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='style.css' type='text/css' media='all'/>
        <link rel='stylesheet' href='assets/css/font-awesome.css' type='text/css' media='all'/>
        <!-- CHANGE THEME SKIN COLOR HERE (replace blue with any other color from assets/css/skins/ folder) -->
        <link href="assets/css/skins/blue.css" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
        <!--Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .edd_cart_item_quantity{
                width: 18%;
            }
            .edd_cart_item_quantity input{
                border: none;
                margin-bottom: -4px;
            }
            .edd_cart_actions{
                width: 17%;
            }
            .edd_cart_actions input{
                padding: 3px 10px;
                margin-top: -5px;
                margin-bottom: -5px;
            }
            .edd_cart_actions input:first-child{
                background-color: #85ee00;
            }
            .edd_cart_actions input:first-child:hover{
                background-color: #00d6ff;
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
                                            <h1>Checkout</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / Checkout
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TITLE ENDS -->
                    <div class="container padtop50 padbot10">
                        <div class="row">
                            <!-- MAIN CONTENT BEGINS -->
                            <div class="col-md-12">
                                <div id="edd_checkout_wrap">

                                    <div id="edd_checkout_cart_wrap">

                                    <%
                                        String error = (String) request.getAttribute("ERROR");
                                        if (error == null) {
                                            error = "";
                                        }
                                    %>
                                    <h1 style="color: red"><%=error%></h1>

                                    <%
                                        List<TeaDTO> listError = (List<TeaDTO>) request.getAttribute("LIST_ERROR");
                                        if (listError != null) {
                                    %>
                                    <h4 style="color: red;">Sorry for the inconvenience!!!</h4>
                                    <%
                                        for (TeaDTO teaError : listError) {
                                    %>
                                    <p style="color: red;"><%=teaError.getName()%> just have <%=teaError.getQuantity()%> products left in stock!</p>
                                    <%
                                            }
                                        }
                                    %>

                                    <table id="edd_checkout_cart" class="ajaxed">
                                        <thead>
                                            <tr class="edd_cart_header_row">

                                                <th class="edd_cart_item_name">
                                                    Item Name
                                                </th>
                                                <th class="edd_cart_item_price">
                                                    Item Price
                                                </th>
                                                <th class="edd_cart_item_quantity">
                                                    Quantity
                                                </th>
                                                <th class="edd_cart_actions">
                                                    Actions
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                double total = 0;
                                                Cart cart = (Cart) session.getAttribute("CART");
                                                if (cart != null && cart.getCart().size() > 0) {
                                                    for (TeaDTO tea : cart.getCart().values()) {
                                                        total += tea.getPrice() * tea.getQuantity();
                                            %>
                                        <form action="MainController">
                                            <tr class="edd_cart_item">
                                                <td class="edd_cart_item_name">
                                                    <div class="edd_cart_item_image">
                                                        <img width="25" height="25" src="<%=tea.getProductIMG()%>" class="attachment-25x25 wp-post-image" alt="172_1"/>
                                                    </div>
                                                    <span class="edd_checkout_cart_item_title"><%=tea.getName()%></span>
                                                </td>
                                                <td class="edd_cart_item_price">
                                                    <%=tea.getPrice()%>
                                                </td>
                                                <td class="edd_cart_item_quantity">
                                                    <input type="hidden" name="productID" value="<%=tea.getProductID()%>" />
                                                    <input type="number" name="quantity" value="<%=tea.getQuantity()%>" required="" min="1"/>
                                                </td>
                                                <td class="edd_cart_actions">
                                                    <input type="submit" name="action" value="Edit"/>
                                                    <input type="submit" name="action" value="Remove"/>
                                                </td>
                                            </tr>
                                        </form>

                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                        <tfoot>
                                            <tr class="edd_cart_footer_row">									
                                                <td>
                                                    Total: <span class="edd_cart_amount" data-subtotal="50.5" data-total="50.5"><%=total%>VNĐ</span>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <%
                                    String email = request.getParameter("email");
                                    String firstName = request.getParameter("firstName");
                                    String lastName = request.getParameter("lastName");
                                    if(email==null || firstName==null || lastName==null){
                                        email="";
                                        firstName="";
                                        lastName="";
                                    }
                                %>
                                <div id="edd_checkout_form_wrap" class="edd_clearfix">
                                    <form id="edd_purchase_form" class="edd_form" action="MainController" method="POST">
                                        <fieldset id="edd_checkout_user_info">
                                            <p id="edd-email-wrap">
                                                <label class="edd-label" for="edd-email">
                                                    Email Address <span class="edd-required-indicator">*</span>
                                                </label>
                                                <span class="edd-description">We will send the purchase receipt to this address.</span>
                                                <input class="edd-input required" type="email" name="email" placeholder="Email address" id="edd-email" value="<%=email%>" required=""/>
                                            </p>
                                            <p id="edd-first-name-wrap">
                                                <label class="edd-label" for="edd-first">
                                                    First Name <span class="edd-required-indicator">*</span>
                                                </label>
                                                <span class="edd-description">We will use this to personalize your account experience.</span>
                                                <input class="edd-input required" type="text" name="firstName" placeholder="First name" id="edd-first" value="<%=firstName%>" required=""/>
                                            </p>
                                            <p id="edd-last-name-wrap">
                                                <label class="edd-label" for="edd-last">
                                                    Last Name </label>
                                                <span class="edd-description">We will use this as well to personalize your account experience.</span>
                                                <input class="edd-input" type="text" name="lastName" id="edd-last" placeholder="Last name" value="<%=lastName%>" required=""/>
                                            </p>
                                        </fieldset>

                                        <fieldset id="edd_purchase_submit">
                                            <p id="edd_final_total_wrap">
                                                <strong>Purchase Total:</strong>
                                                <span class="edd_cart_amount" data-subtotal="50.5" data-total="50.5"><%=total%></span>
                                            </p>
                                            <input type="radio" name="method" value="Direct" checked=""/> <span> Cash on Delivery </span><br/>
                                            <input type="radio" name="method" value="PayPal" /> <span> Pay with PAYPAL </span><br/>
                                            <input type="submit" class="edd-submit button" id="edd-purchase-button" name="action" value="Purchase"/>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>				
                        <!-- MAIN CONTENT ENDS -->
                        <!--Modal-->
                        <%
                            String paypal = (String) request.getAttribute("PAYPAL");
                            if (paypal != null) {
                        %>

                        <script>
                            $(window).load(function () {
                                $('#dnbtdevModal').modal('show');
                            });
                        </script>
                        <%
                            }
                        %>
                        <div class="modal fade" id="dnbtdevModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">                      
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Message</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                                            <input type="hidden" name="business" value="sb-xidn618171586@business.example.com">

                                            <input type="hidden" name="cmd" value="_xclick">

                                            <input type="hidden" name="item_name" value="HoaDonMuaHang">
                                            Total payment: <%=total%>$<br/>
                                            <input type="hidden" name="amount" value="<%=total%>">

                                            <input type="hidden" name="currency_code" value="USD">

                                            <input type="hidden" name="return" value="http://localhost:8080/MilkTeaManagement/SendEmailController?email=<%=email%>&firstName=<%=firstName%>&lastName=<%=lastName%>">

                                            <input type="hidden" name="cancel_return" value="http://localhost:8080/MilkTeaManagement/error.jsp">
                                            <input type="submit" class="but" name="submit" value="Purchase">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Modal-->
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
