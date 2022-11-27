<%-- 
    Document   : productSingle
    Created on : Jun 23, 2022, 9:24:03 PM
    Author     : DELL
--%>

<%@page import="sample.tea.Cart"%>
<%@page import="sample.tea.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Meri - Product</title>
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
        <style>

            .edd_purchase_submit_wrapper .button_cart{
                padding: 10px 0;
                width:30%;
                background-color:#25c5ed;
                color:#fff;
                border:1px solid rgba(0,0,0,0.1);
            }
            .edd_purchase_submit_wrapper .button_cart:hover{
                background-color:#333;
                color:#fff;
                border:1px solid rgba(0,0,0,0.1);
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
            <%
                String cateName = (String) request.getAttribute("CATEGORY_NAME");
                TeaDTO tea = (TeaDTO) request.getAttribute("TEA");
                if (cateName != null && tea != null) {
            %>

            <div class="singledownloadphp">

                <!-- TITLE BEGINS -->

                <div class="headerimage" style="background-image: url(http://www.themepush.com/demo-kailo/wp-content/uploads/sites/6/2015/03/header.jpg);">
                    <div class="headercontent">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="fleft">
                                        <h1><%=tea.getName()%></h1>
                                    </div>
                                    <div class="fright breadc">                                      
                                        <a href="MainController?action=Start"> Home </a> / <a href="MainController?action=Load">Shop</a><a href="MainController?action=Classify&categoryID=<%=tea.getCategoryID()%>">/<%=cateName%></a>/<%=tea.getName()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- TITLE ENDS -->

                <div class="container padtop50 padbot50">
                    <div class="row">

                        <!-- MAIN CONTENT BEGINS -->
                        <div class="col-md-9">
                            <div id="primary" class="content-area">
                                <main id="main" class="site-main" role="main">
                                    <article class="contentdownloadphp">

                                        <div class="row">
                                            <div class="col-md-3">
                                                <span class="entryitemname"><b>Item: </b><%=tea.getName()%><br/></span>
                                                <span class="entryprice"><b>Price:</b> <%=tea.getPrice()%>$<br/></span>
                                                <span class="entrysku"><b>SKU: </b> wow<br/></span>
                                                <span class="entrycategories">
                                                    <b>Categories:</b> <a href="MainController?action=Classify&categoryID=<%=tea.getCategoryID()%>"><%=cateName%></a><br/>
                                                    <!--                                                    <b>Tags:</b> <a href="#">sandy</a><br/><br/>-->
                                                </span>
                                            </div>
                                            <div class="col-md-9">
                                                <img width="555" height="370" src="<%=tea.getProductIMG()%>" class="attachment-post-thumbnail wp-post-image" alt="5_1"/>

                                                <p>
                                                    <%=tea.getDetail()%>
                                                </p>

                                                <div class="edd_purchase_submit_wrapper">
                                                    <button type="submit" class="button_cart" data-toggle="modal" data-target="#<%=tea.getProductID()%>"><i class="fa fa-shopping-cart" style="color: white"></i>Add to Cart</button><br/>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="<%=tea.getProductID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="MainController" method="POST">
                                                                        <div class="row">

                                                                            <div class="col-md-6">
                                                                                <img src="<%=tea.getProductIMG()%>"/>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <p style="font-size: 25px; color: forestgreen"><%=tea.getName()%></p>

                                                                                <label style="font-weight:bold;">Quantity</label><br/>
                                                                                <input type="number" name="quantity" min="1" value="1" required=""/>

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


                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-12 padtop10">
                                                <h5 class="section-title related-entries-title">YOU MAY ALSO LIKE</h5>
                                                <ul class="related-entries">
                                                    <%
                                                        List<TeaDTO> listBestSellers = (List<TeaDTO>) request.getAttribute("LIST_BEST_SELLERS");
                                                        if (listBestSellers != null && listBestSellers.size() > 0) {
                                                            for (TeaDTO teaDTO : listBestSellers) {
                                                    %>
                                                    <li style="width: 25%;">
                                                        <div class="relatedinner" style="height: 37vh;">
                                                            <a href="MainController?action=Show&productID=<%=teaDTO.getProductID()%>&categoryID=<%=teaDTO.getCategoryID()%>" title="Eyes Wide Shut" rel="bookmark" class="related-entry-thumb"><img width="555" height="370" src="<%=teaDTO.getProductIMG()%>" class="attachment-digitalstore_thumb_155x156 wp-post-image" alt="172_1" title="Eyes Wide Shut"/>
                                                                <div class="edd-the-price">
                                                                    <%=teaDTO.getPrice()%>$
                                                                </div>
                                                            </a>
                                                            <a href="MainController?action=Show&productID=<%=teaDTO.getProductID()%>&categoryID=<%=teaDTO.getCategoryID()%>" title="Eyes Wide Shut" rel="bookmark" class="related-entry-title"><%=teaDTO.getName()%></a>
                                                        </div>
                                                    </li>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </ul>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </main>
                            </div>
                        </div>
                        <!-- MAIN CONTENT ENDS -->

                        <!-- SIDEBAR BEGINS -->
                        <div class="col-md-3">
                            <div id="secondary" class="widget-area" role="complementary">
                                <aside id="text-4" class="widget widget_text">
                                    <h1 class="widget-title section-title"><span>Search in Shop</span></h1>
                                    <div class="textwidget">
                                        <form role="search" method="get" class="search-form" action="MainController">
                                            <input type="search" class="search-field" placeholder="Type and hit enter..." value="" name="get" title=""/>
                                            <input type="hidden" name="action" value="Get">
                                        </form>
                                    </div>
                                </aside><aside id="edd_categories_tags_widget-3" class="widget widget_edd_categories_tags_widget">
                                    <h1 class="widget-title section-title"><span>Categories</span></h1>
                                    <%
                                        List<CategoryDTO> listCate = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
                                        if (listCate != null && listCate.size() > 0) {
                                            for (CategoryDTO cate : listCate) {
                                    %>
                                    <ul class="edd-taxonomy-widget">

                                        <li class="cat-item"><a href="MainController?action=Classify&categoryID=<%=cate.getCategoryID()%>"><%=cate.getCategoryName()%></a></li>

                                    </ul>
                                    <%
                                            }
                                        }
                                    %>
                                </aside>
                                <%
                                    double total = 0;
                                    Cart cart = (Cart) session.getAttribute("CART");
                                    int size = 0;
                                    if (cart == null) {
                                        size = 0;
                                    } else {

                                    }
                                %>
                                <aside class="widget widget_edd_cart_widget">
                                    <h1 class="widget-title section-title"><span>My Cart</span></h1>
                                    <p class="edd-cart-number-of-items">
                                        Number of items in cart: <span class="edd-cart-quantity"><%=size%></span>
                                    </p>
                                    <ul class="edd-cart">
                                        <%

                                            if (cart != null && cart.getCart().size() > 0) {
                                                for (TeaDTO teaDTO : cart.getCart().values()) {
                                                    total += teaDTO.getPrice() * teaDTO.getQuantity();
                                        %>
                                        <li class="edd-cart-item">
                                            <span class="edd-cart-item-title"><%=teaDTO.getName()%></span>
                                            <span class="edd-cart-item-separator">-</span><span class="edd-cart-item-price">&nbsp;<%=teaDTO.getPrice()%>$&nbsp;</span><span class="edd-cart-item-separator">-</span>
                                            <a href="MainController?action=Remove&productID=<%=teaDTO.getProductID()%>" class="edd-remove-from-cart">remove</a>
                                        </li>
                                        <%
                                                }
                                            }
                                        %>
                                        <li class="cart_item edd_subtotal">Subtotal: <span class='subtotal'><%=total%>$</span></li>
                                        <li class="cart_item edd_checkout"><a href="checkout.html">Checkout</a></li>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                        <!-- SIDEBAR ENDS -->
                    </div>
                </div>
            </div>		

            <%
                }
            %>
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
