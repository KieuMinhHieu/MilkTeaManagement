<%-- 
    Document   : productManagement.jsp
    Created on : Jun 24, 2022, 11:40:20 PM
    Author     : DELL
--%>

<%@page import="sample.tea.CategoryDTO"%>
<%@page import="sample.tea.TeaDAO"%>
<%@page import="sample.tea.TeaDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Product Management</title>
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
        <!--                css style-->
        <style>/*Modal*/
            .modal-delete{
                border: 1px solid black;
                padding: 12px 20px 12px 20px;
                border-radius: 10px;
                color: white;
                background-color: red;
                margin-right: 10px;
                margin-left: 250px;
            }

            .modal-close{
                padding: 8px 25px 8px 25px;
                border-radius: 10px;
                margin-right: 10px;
            }
            .modal-update{
                border-radius: 10px;
                margin-right: 10px;
            }
            .button.addproduct {
                margin-top:30px;
                display:block;
                background-color:#f46b35;
                border:0;
                color:#fff;
                padding:15px 13px;
                border:1px solid rgba(0,0,0,0.1);
                text-align:center;
            }
            .button.addproduct:hover {
                background-color:#333;
                color:#fff;
                text-decoration:none;
                padding-left:30px;
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
                                            <h1>Product</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / Product Management
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TITLE ENDS -->
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String search = request.getParameter("search");
                    if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                        response.sendRedirect("myAccount.jsp");
                        return;
                    }
                    if (search == null) {
                        search = "";
                    }
                %>

                <div class="container padtop40 padbot50">
                    <div class="row">
                        <div class="col-md-12">
                            <span class="smalltitle">Product Editor</span>
                            <form id="edd_profile_editor_form" class="edd_form" action="MainController" method="get">
                                <fieldset>
                                    <p id="edd_profile_name_wrap">
                                        <label for="edd_first_name">Search Product</label>
                                        <input name="search" id="edd_first_name" class="text edd-input" type="text" placeholder="Enter Name" value="<%=search%>"/>
                                        <input type="submit" name="action" value="SearchProduct">
                                    </p>
                                </fieldset>
                            </form>


                            <div style="margin-top: 10px;">
                                <%
                                    List<TeaDTO> listTea = (List<TeaDTO>) request.getAttribute("LIST_TEA");
                                    if (listTea != null && listTea.size() > 0) {
                                %>

                                <table id="edd_user_history">
                                    <thead>
                                        <tr class="edd_purchase_row">
                                            <th class="edd_purchase_id">
                                                No
                                            </th>
                                            <th class="edd_purchase_date">
                                                ID
                                            </th>
                                            <th class="edd_purchase_amount">
                                                Name
                                            </th>
                                            <th class="edd_purchase_details">
                                                Image
                                            </th>
                                            <th class="edd_purchase_d">
                                                Price
                                            </th>
                                            <th class="edd_purchase_details">
                                                Actions
                                            </th>                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int count = 1;
                                            for (TeaDTO tea : listTea) {

                                        %>

                                        <tr class="edd_purchase_row">
                                            <td class="edd_purchase_id">
                                                <%=count++%> 
                                            </td>
                                            <td class="edd_purchase_date">
                                                <%=tea.getProductID()%>
                                            </td>
                                            <td class="edd_purchase_amount">
                                                <%=tea.getName()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <img width="100" src="<%=tea.getProductIMG()%>" class="attachment-post-thumbnail wp-post-image" alt="163_1"/>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=tea.getPrice()%> VNĐ
                                            </td>

                                            <td>
                                                <a href="MainController?action=DeleteProduct&productID=<%=tea.getProductID()%>&search=<%=search%>"><i class="fa  fa-trash-o" style="color: red;font-size: 25px"></i></a>
                                                <button type="submit" class="" style="background-color: white;border: none" data-toggle="modal" data-target="#<%=tea.getProductID()%>"><i class="fa fa-edit" style="color: seagreen;font-size: 25px"></i></button><br/>
                                                <p style="color: red"></p>
                                                <!-- Modal -->
                                                <div class="modal fade" id="<%=tea.getProductID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Product Editor</h5>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="MainController" method="POST">

                                                                    <label style="font-weight:bold;">Product ID</label>
                                                                    <input type="text" name="productID" value="<%=tea.getProductID()%>" readonly=""/>

                                                                    <label style="font-weight:bold;">Name</label>
                                                                    <input type="text" name="productName" value="<%=tea.getName()%>"/><br/>

                                                                    <label style="font-weight:bold;">Product Image</label>
                                                                    <input type="text" name="productIMG" value="<%=tea.getProductIMG()%>" />

                                                                    <label style="font-weight:bold;">Price</label>
                                                                    <input type="number" name="price" value="<%=tea.getPrice()%>" min="1"/>

                                                                    <label style="font-weight:bold;">Category</label>
                                                                    <select name="categoryID">
                                                                        <%
                                                                            String select = "";
                                                                            List<CategoryDTO> listCategory = (List<CategoryDTO>) request.getAttribute("LIST_CATE");
                                                                            if (listCategory != null) {
                                                                                for (CategoryDTO cate : listCategory) {
                                                                                    if (Integer.parseInt(tea.getCategoryID()) == cate.getCategoryID()) {
                                                                                        select = "selected";
                                                                                    } else {
                                                                                        select = "";
                                                                                    }
                                                                        %>

                                                                        <option value="<%=cate.getCategoryID()%>" <%=select%> ><%=cate.getCategoryName()%></option>

                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </select>

                                                                    <label style="font-weight:bold;">Quantity</label>
                                                                    <input type="number" name="quantiry" value="<%=tea.getQuantity()%>" min="1"/>

                                                                    <label style="font-weight:bold;">Details</label>
                                                                    <input type="text" name="detail" value="<%=tea.getDetail()%>" />

                                                                    <!--Update-->
                                                                    <input class="modal-update" type="submit" name="action" value="UpdateProduct" style="background-color: green"/>
                                                                    <input type="hidden" name="search" value="<%=search%>"/>
                                                                    <!--close-->
                                                                    <button type="button" class="modal-close" data-dismiss="modal" >Close</button>

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>  

                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table> 

                                <%
                                    }
                                %>

                            </div>
                            <%
                                String error = (String) request.getAttribute("ERROR");
                                String message = (String) request.getAttribute("MESSAGE");
                                if (error == null) {
                                    error = "";
                                }
                                if (message == null) {
                                    message = "";
                                }
                            %>
                            <h4 style="color: red"><%=error%></h4>
                            <h4 style="color: green"><%=message%></h4>
                            <!-- Add product-->
                            <button type="submit" class="button addproduct" data-toggle="modal" data-target="#addProduct"><i class="fa fa-plus" style="color: white"></i>Add More Product</button><br/>
                            <!--Modal-->
                            <div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                            <h5 class="modal-title" id="exampleModalLongTitle">Adding Product</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form action="MainController">

                                                <label style="font-weight:bold;">Name</label>
                                                <input type="text" name="productName" required=""/><br/>

                                                <label style="font-weight:bold;">Product Image</label>
                                                <input type="text" name="productIMG" required="" />

                                                <label style="font-weight:bold;">Price</label>
                                                <input type="number" name="price" required="" min="1"/>

                                                <label style="font-weight:bold;">Category</label>
                                                <select name="categoryID">

                                                    <%                                                        List<CategoryDTO> listCategory = (List<CategoryDTO>) request.getAttribute("LIST_CATE");
                                                        if (listCategory != null) {
                                                            for (CategoryDTO cate : listCategory) {
                                                    %>

                                                    <option value="<%=cate.getCategoryID()%>" selected ><%=cate.getCategoryName()%></option>

                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </select>

                                                <label style="font-weight:bold;">Quantity</label>
                                                <input type="number" name="quantiry" required="" min="1"/>

                                                <label style="font-weight:bold;">Details</label>
                                                <input type="text" name="detail" required="" />

                                                <!--Update-->
                                                <input class="modal-update" type="submit" name="action" value="Add Product" style="background-color: green"/>
                                                <input type="hidden" name="search" value="<%=search%>"/>
                                                <!--close-->
                                                <button type="button" class="modal-close" data-dismiss="modal" >Close</button>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
