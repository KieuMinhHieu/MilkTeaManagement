<%-- 
    Document   : shop
    Created on : Jun 20, 2022, 10:10:05 PM
    Author     : DELL
--%>

<%@page import="sample.tea.Cart"%>
<%@page import="sample.tea.CategoryDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Shop-Meri</title>
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
        <!--STYLE
        ==================================================-->
        <style>
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
                <div class="shoppage">

                    <!-- TITLE BEGINS -->
                    <div class="headerimage" style="background-image: url(http://www.themepush.com/demo-kailo/wp-content/uploads/sites/6/2015/03/header.jpg);">
                        <div class="headercontent">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="fleft">
                                            <h1>Shop</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / Shop
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TITLE ENDS -->

                    <div class="container padbot30">
                        <div class="row padtop30 padbot20">
                            <div class="col-md-12">
                            <%
                                String get = (String) request.getParameter("get");
                                if (get != null) {
                            %>
                            <span class="pagesit fleft">
                                <a href="MainController?action=Load"style="color: #8dbcd9; font-weight: 400; font-size: 17px">Shop/</a>Search "<%=get%>" 

                            </span>
                            <%
                                } else {
                                    get = "";
                                }
                            %>

                            <%
                                String cateName = (String) request.getAttribute("CATEGORY_NAME");
                                if (cateName != null) {
                            %>

                            <span class="pagesit fleft">
                                <a href="MainController?action=Load"style="color: #8dbcd9; font-weight: 400; font-size: 17px">Shop/</a><%=cateName%>			
                            </span>

                            <%
                                }
                            %>



                            <div class="sortitemsarea fright">    
                                <form method="GET" action="#" class="wowsortitems">    
                                    <select name="data" id="data" onchange='this.form.submit()'>
                                        <option value="1">Sort by newest</option>
                                        <option value="2">Sort by price: low to high</option>
                                        <option value="3">Sort by price: high to low</option>
                                        <option value="4">Sort by popularity</option>
                                        <option value="5">Sort by oldest</option>
                                        <option value="6">Sort by comments</option>
                                        <option value="7">Sort alphabetically</option>
                                    </select>
                                    <noscript>
                                    <input type="submit" value="Submit">
                                    </noscript>
                                </form>
                            </div> 
                        </div>
                    </div>

                    <div class="row">
                        <!-- MAIN CONTENT BEGINS -->
                        <div class="col-md-9">
                            <div class="wowitemboxlist">
                                <%
                                    String error=(String)request.getAttribute("ERROR");
                                    if(error==null){
                                        error="";
                                    }
                                %>
                                <h2 style="color: #a94442"><%=error%></h2>
                                <!-- .wowitembox-->
                                <%
                                    List<TeaDTO> listTea = (List<TeaDTO>) request.getAttribute("LIST_TEA");
                                    if (listTea != null && listTea.size() > 0) {
                                        for (TeaDTO tea : listTea) {
                                %>
                                <div class="wowitembox">
                                    <div class="wowitemboxinner">
                                        <div class="imagearea">
                                            <img width="555" height="370" src="<%=tea.getProductIMG()%>" class="attachment-post-thumbnail wp-post-image" alt="181_1"/>
                                            <div class="caption">
                                                <div class="blur">
                                                </div>
                                                <div class="caption-text">
                                                    <div class="captionbuttons">
                                                        <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>" class="captiondetails"><i class="fa fa-link"></i> View Details</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="notesarea" style="height: 120px">
                                            <a href="MainController?action=Show&productID=<%=tea.getProductID()%>&categoryID=<%=tea.getCategoryID()%>" title="Old Game">
                                                <h2><%=tea.getName()%></h2>
                                            </a>
                                            <div class="notesbottom" style="position: absolute; bottom: 0; margin-bottom: 15px; margin-left: 10px;">
                                                <div class="price fleft" style="margin-right: 50px">
                                                    <%=tea.getPrice()%>$
                                                </div>
                                                <div class="cart fright" >
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
                                                                                <p style="color: #47a447"><%=tea.getPrice()%>$</p>

                                                                                <input type="hidden" name="productID" value="<%=tea.getProductID()%>"/>
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
                                <%
                                        }
                                    }
                                %>

                                <!-- .wowitembox-->
                            </div>
                            <div class="clear">
                            </div>
                            <!--                            <div class='pagination'>
                                                            <span class='current'>1</span><a href='#' class='inactive'>2</a>
                                                        </div>-->
                            <div class="clear">
                            </div>
                        </div>				
                        <!-- MAIN CONTENT ENDS -->

                        <!-- SIDEBAR BEGINS -->
                        <div class="col-md-3">
                            <div id="secondary" class="widget-area" role="complementary">
                                <aside id="text-4" class="widget widget_text">
                                    <h1 class="widget-title section-title"><span>Search in Shop</span></h1>
                                    <div class="textwidget">
                                        <form method="get" class="search-form" action="MainController">
                                            <input type="search" class="search-field" placeholder="Type and hit enter..." value="<%=get%>" name="get" title=""/>
                                            <input type="hidden" name="action" value="Get">
                                        </form>
                                    </div>
                                </aside>
                                <!--Category-->
                                <aside id="edd_categories_tags_widget-3" class="widget widget_edd_categories_tags_widget">
                                    <h1 class="widget-title section-title"><span>Categories</span></h1>
                                    <ul class="edd-taxonomy-widget">                                      
                                        <%
                                            List<CategoryDTO> listCate = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
                                            if (listCate != null && listCate.size() > 0) {
                                                for (CategoryDTO cate : listCate) {
                                        %>

                                        <li class="cat-item"><a href="MainController?action=Classify&categoryID=<%=cate.getCategoryID()%>"><%=cate.getCategoryName()%></a></li>

                                        <%
                                                }
                                            }
                                        %>

                                    </ul>
                                </aside>
                                <!--End Category-->
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
                                <aside class="widget widget_edd_cart_widget">
                                    <h1 class="widget-title section-title"><span>My Cart</span></h1>
                                    <p class="edd-cart-number-of-items">
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
                                            <span class="edd-cart-item-separator">-</span><span class="edd-cart-item-price">&nbsp;<%=tea.getPrice()%>$&nbsp;</span><span class="edd-cart-item-separator">-</span>
                                            <a href="MainController?action=Remove&productID=<%=tea.getProductID()%>" class="edd-remove-from-cart">remove</a>
                                        </li>
                                        <%
                                                }
                                            }
                                        %>
                                        <li class="cart_item edd_subtotal">Subtotal: <span class='subtotal'><%=total%>$</span></li>
                                        <li class="cart_item edd_checkout"><a href="checkout.jsp">Checkout</a></li>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                        <!-- SIDEBAR ENDS -->

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
