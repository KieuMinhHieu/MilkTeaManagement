<%-- 
    Document   : index.jsp
    Created on : Jun 8, 2022, 4:22:25 PM
    Author     : DELL
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Home Page</title>
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
        <!--STYLE
        ==================================================-->
        <style>
            .wowitemboxinner .notesarea {
                border:1px solid #ddd;
                padding: 10px;
            }
            .button_cart{
                border: none;
                background-color: white;
                margin-top: -5px;
                color: red;
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

                <!-- TITLE BEGINS -->
                <div class="headerimage homeimg text-center" style="background-image: url(assets/img/background_Image.png);">
                    <div class="headercontent home">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 data-scrollreveal="enter top over 1.9s after 0.2s">WELCOME to MERI</h1>
                                    <p class="lead" data-scrollreveal="enter bottom over 1.9s after 0.4s">
                                        Bear may not have but milk tea must be a cup a day 
                                    </p>
                                <%
                                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                    if (loginUser != null) {
                                %>

                                <a data-scrollreveal="enter bottom over 1.0s after 1.6s" href="MainController?action=Load" class="homeimgbtn">Buy Now</a>

                                <%
                                    }
                                %>

                                <%
                                    if (loginUser == null) {
                                %>
                                <a target="_blank" data-scrollreveal="enter bottom over 1.0s after 1.6s" href="myAccount.jsp" class="homeimgbtn">Buy Now</a>
                                <%
                                    }
                                %>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- TITLE ENDS -->

            <!-- MAIN CONTENT BEGINS -->
            <div id="homepagetemplate" class="container padtop10 padbot40">
                <div class="row">
                    <div class="col-md-12">
                        <div class="clear text-center sectionlatestitems">
                            <h2 class="maintitle">LATEST ITEMS</h2>
                            <div class="separatr">
                                <span>
                                    <a href="MainController?action=Load" class="view-all"><i class="fa fa-reorder"></i></a>
                                </span>
                            </div>
                        </div>
                        <div class="wowitemboxlist sectionlatestitems clear">

                            <%
                                List<TeaDTO> listLast = (List<TeaDTO>) request.getAttribute("LIST_LAST");
                                if (listLast != null && listLast.size() > 0) {
                                    for (TeaDTO tea : listLast) {
                            %>
                            <div class="wowitembox">
                                <div class="wowitemboxinner">
                                    <div class="imagearea">
                                        <img width="555" height="370" src="<%=tea.getProductIMG()%>" class="attachment-post-thumbnail wp-post-image" alt="168_1"/>
                                        <div class="caption">
                                            <div class="blur">
                                            </div>
                                            <div class="caption-text">
                                                <div class="captionbuttons">
                                                    <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>" class="captiondetails"><i class="fa fa-link"></i> VIEW DETAILS</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="notesarea" style="height: 120px">
                                        <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>">
                                            <h2><%=tea.getName()%></h2>
                                        </a>
                                        <div class="notesbottom" style="position: absolute; bottom: 0;margin-bottom: 12px; margin-left: 15px;">
                                            <div class="price fleft" style="margin-right: 50px">
                                                <%=tea.getPrice()%> $ 
                                            </div>
                                            <div class="cart fright">
                                                <button type="submit" class="button_cart" data-toggle="modal" data-target="#<%=tea.getProductID()%>"><i class="fa fa-shopping-cart" style="color: red"></i>Add to Cart</button><br/>
                                                <!-- Modal -->
                                                <div class="modal fade" id="<%=tea.getProductID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="MainController">
                                                                    <div class="row">

                                                                        <div class="col-md-6">
                                                                            <img src="<%=tea.getProductIMG()%>"/>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <p style="font-size: 25px; color: forestgreen"><%=tea.getName()%></p>

                                                                            <label style="font-weight:bold;">Quantity</label><br/>
                                                                            <input type="number" name="quantity" min="1" value="1" required="" max="<%=tea.getQuantity()%>"/>

                                                                            <label style="font-weight:bold;">Price</label>
                                                                            <p style="color: #47a447"><%=tea.getPrice()%> $</p>

                                                                            <input type="hidden" name="productID" value="<%=tea.getProductID()%>"
                                                                                   <!--BUY-->
                                                                                   <input class="buy" type="submit" name="action" value="Buy" style="color: #47a447; background-color: white; padding: 5px 20px"/>
                                                                            <!--close-->
                                                                            <button type="button" class="modal-close" data-dismiss="modal" style="margin-left: 10px">Close</button>
                                                                        </div>

                                                                    </div>


                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- .wowitemboxinner-->
                            </div>
                            <!-- .wowitembox-->

                            <%
                                    }
                                }
                            %>

                        </div>
                        <!-- .wowitemboxlist-->

                        <div class="clear">
                        </div>
                        <div class="divider1">
                        </div>
                        <div class="row text-center seactionitemfeatures">
                            <div class="narrowheader">
                                <h2 class="maintitle">OUR CORE VALUE</h2>
                                “Meri” in Chinese means to offer the best tea to the Emperor from all possessions. It represents the highest quality and self-expectation. Established in 2006, Meri has been appreciated by its customers, relying on good words of mouth and unique customized services originated in Taiwan.From then on, the story of Meri has widely spread, and Meri has become one of the best-known quality tea providers in the world. Nowadays, Meri has blossomed in more than 20 regions all over the world.!
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="featurebox">
                                <h2><i class="fa fa-gift"></i> Friendly & Professional Service </h2>
                                Meri always desires to satisfy customers with professional and friendly service as well as listening to customers’ contributions in order to improve the Gong Cha’s quality.
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="featurebox">
                                <h2><i class="fa fa-trophy"></i> Top Quality </h2>
                                Safe, hygienic and delicacy. The use of safe, natural and hygienic ingredients is Meri’s top priority. The perfect taste of the drinks is the next important goal we want to address.
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="featurebox">
                                <h2><i class="fa fa-bullhorn"></i> Trust Brands </h2>
                                Based on two core foundations, Quality and Service, Gong Cha consistently strives to build and maintain a reliable brand image in the eyes of customers.
                            </div>
                        </div>

                        <div class="clear">
                        </div>
                        <div class="divider1">
                        </div>
                        <div class="clear text-center sectionbestseller">
                            <h2 class="maintitle">BEST SELLER</h2>
                            <div class="separatr">
                                <span style="font-size: 0.77em;text-transform:uppercase;"><i class="fa fa-star"></i>&nbsp; OUR BUYERS FAVOURITES &nbsp; <i class="fa fa-star"></i></span>
                            </div>
                        </div>
                        <div class="wowitemboxlist sectionbestseller clear">

                            <%
                                List<TeaDTO> listBestSellers = (List<TeaDTO>) request.getAttribute("LIST_BEST_SELLERS");
                                if (listBestSellers != null && listBestSellers.size() > 0) {
                                    for (TeaDTO tea : listBestSellers) {
                            %>

                            <div class="wowitembox">
                                <div class="wowitemboxinner">
                                    <div class="imagearea">
                                        <img width="555" height="370" src="<%=tea.getProductIMG()%>" class="attachment-post-thumbnail wp-post-image" alt="5_1"/>
                                        <div class="caption">
                                            <div class="blur">
                                            </div>
                                            <div class="caption-text">
                                                <div class="captionbuttons">
                                                    <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>" class="captiondetails"><i class="fa fa-link"></i> VIEW DETAILS</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="notesarea"style="height: 120px">
                                        <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>">
                                            <h2><%=tea.getName()%></h2>
                                        </a>
                                        <div class="notesbottom"style="position: absolute;bottom: 0;margin-bottom: 12px;margin-left: 15px;">
                                            <div class="price fleft" style="margin-right: 50px">
                                                <%=tea.getPrice()%> $
                                            </div>
                                            <div class="cart fright">
                                                <button type="submit" class="button_cart" data-toggle="modal" data-target="#<%=tea.getProductID()%>"><i class="fa fa-shopping-cart" style="color: red"></i> Add to Cart</button><br/>
                                                <!-- Modal -->
                                                <div class="modal fade" id="<%=tea.getProductID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">×</button>                                                              
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="MainController">
                                                                    <div class="row">

                                                                        <div class="col-md-6">
                                                                            <img src="<%=tea.getProductIMG()%>"/>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <p style="font-size: 25px; color: forestgreen"><%=tea.getName()%></p>

                                                                            <label style="font-weight:bold;">Quantity</label><br/>
                                                                            <input type="number" name="quantity" min="1" value="1" required="" max="<%=tea.getQuantity()%>"/>

                                                                            <label style="font-weight:bold;">Price</label>
                                                                            <p style="color: #47a447"><%=tea.getPrice()%> $</p>

                                                                            <input type="hidden" name="productID" value="<%=tea.getProductID()%>"
                                                                                   <!--BUY-->
                                                                                   <input class="buy" type="submit" name="action" value="Buy" style="color: #47a447; background-color: white; padding: 5px 20px"/>
                                                                            <!--close-->
                                                                            <button type="button" class="modal-close" data-dismiss="modal" style="margin-left: 10px">Close</button>
                                                                        </div>

                                                                    </div>


                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- .wowitemboxinner-->
                            </div>
                            <!-- .wowitembox-->

                            <%
                                    }
                                }
                            %>


                        </div>
                        <!-- .wowitemboxlist-->
                    </div>
                </div>
            </div>
            <!-- MAIN CONTENT ENDS -->

            <!--Modal-->
            <%
                String Success = (String) request.getAttribute("SUCCESS");
                String paypal = "1";
                if (Success != null) {
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
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <h2><i class="fa fa-check-circle" style="color: #47a447"></i></h2>
                            <p>Thank you!</p>
                            <p>Have a nice day!!!</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Modal-->
            <jsp:include page="footer.jsp"></jsp:include>

            <!-- FOOTER
            ================================================== -->

            <!-- /footer -->
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
