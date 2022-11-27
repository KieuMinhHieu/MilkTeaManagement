<%-- 
    Document   : adminAccount
    Created on : Jun 9, 2022, 3:50:13 PM
    Author     : DELL
--%>


<%@page import="sample.user.UserError"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon" href="assets/img/favicon.ico"/>
        <title>Admin Page</title>
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
                                            <h1>Admin Account</h1>
                                        </div>
                                        <div class="fright breadc">
                                            <a href="MainController?action=Start">Home</a> / Admin Account
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
                            <span class="smalltitle">Profile Editor</span>
                            <form id="edd_profile_editor_form" class="edd_form" action="MainController" method="POST">
                                <fieldset>
                                    <p id="edd_profile_name_wrap">
                                        <label for="edd_first_name">Search User</label>
                                        <input name="search" id="edd_first_name" class="text edd-input" type="text" placeholder="Enter Name" value="<%=search%>"/>
                                        <input type="submit" name="action" value="Search">
                                    </p>
                                </fieldset>
                            </form>
                            <div style="margin-top: 10px;">
                                <%
                                    String error = (String) request.getAttribute("ERROR");
                                    if (error == null) {
                                        error = "";
                                    }
                                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                    if (userError == null) {
                                        userError = new UserError();
                                    }
                                %>
                                <p style="color: red"><%=error%></p>
                                <p style="color: red"><%=userError.getUserName()%></p>
                                <p style="color: red"><%=userError.getEmail()%></p>
                                
                                <%
                                    List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                                    if (listUser != null && listUser.size() > 0) {
                                %>
                                <table id="edd_user_history">
                                    <thead>
                                        <tr class="edd_purchase_row">
                                            <th class="edd_purchase_id">
                                                No
                                            </th>
                                            <th class="edd_purchase_date">
                                                User ID
                                            </th>
                                            <th class="edd_purchase_amount">
                                                User Name
                                            </th>
                                            <th class="edd_purchase_details">
                                                Gender
                                            </th>
                                            <th class="edd_purchase_d">
                                                Birthday
                                            </th>
                                            <th class="edd_purchase_details">
                                                Email
                                            </th>
                                            <th class="edd_purchase_details">
                                                Address
                                            </th>
                                            <th class="edd_purchase_details">
                                                Password
                                            </th>
                                            <th class="edd_purchase_details">
                                                Role ID
                                            </th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int count = 1;

                                            for (UserDTO user : listUser) {

                                        %>

                                        <tr class="edd_purchase_row">
                                            <td class="edd_purchase_id">
                                                <%=count++%>
                                            </td>
                                            <td class="edd_purchase_date">
                                                <%=user.getUserID()%>
                                            </td>
                                            <td class="edd_purchase_amount">
                                                <%=user.getUserName()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getGender()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getBirthdate()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getEmail()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getAddress()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getPassword()%>
                                            </td>
                                            <td class="edd_purchase_details">
                                                <%=user.getRoleID()%>
                                            </td>
                                            <td>
                                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#<%=user.getUserID()%>">Edit</button><br/>

                                                <!-- Modal -->
                                                <div class="modal fade" id="<%=user.getUserID()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Profile Editor</h5>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="MainController" method="POST">

                                                                    <label style="font-weight:bold;">User ID</label>
                                                                    <input type="text" name="userID" value="<%=user.getUserID()%>" readonly=""/>

                                                                    <label style="font-weight:bold;">User Name</label>
                                                                    <input type="text" name="userName" value="<%=user.getUserName()%>"/><br/>

                                                                    <label style="font-weight:bold;">Gender</label><br/>
                                                                    <select name="gender">     
                                                                        <option value="male" <%=user.getGender().equals("male") == true ? "selected" : ""%> >Male</option>
                                                                        <option value="female" <%=user.getGender().equals("female") == true ? "selected" : ""%> >Female</option>
                                                                    </select>

                                                                    <label style="font-weight:bold;">Birthday</label>
                                                                    <input type="date" name="birthday" value="<%=user.getBirthdate()%>" style="padding: 3px"/>

                                                                    <label style="font-weight:bold;">Email</label>
                                                                    <input type="email" name="email" value="<%=user.getEmail()%>" />

                                                                    <label style="font-weight:bold;">Address</label>
                                                                    <input type="text" name="address" value="<%=user.getAddress()%>" />

                                                                    <label style="font-weight:bold;">Role ID</label><br/>
                                                                    <select name="roleID">     
                                                                        <option value="AD" <%=user.getRoleID().equals("AD") == true ? "selected" : ""%> >ADMIN</option>
                                                                        <option value="US" <%=user.getRoleID().equals("US") == true ? "selected" : ""%>>USER</option>
                                                                    </select>

                                                                    <!--Delete-->
                                                                    <a href="MainController?search=<%=search%>&action=Delete&userID=<%=user.getUserID()%>" class="modal-delete" >Delete</a>
                                                                    <!--Update-->
                                                                    <input class="modal-update" type="submit" name="action" value="Update"/>
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
