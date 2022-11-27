<%-- 
    Document   : header
    Created on : Jun 9, 2022, 7:15:55 AM
    Author     : DELL
--%>

<%@page import="sample.tea.Cart"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav id="wow-menu" class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='MainController?action=Start'>
                <img alt="Meri" src="assets/img/logoMilkTea.png"/>
            </a>
        </div>
        <!-- Menu -->
        <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER"); %>
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <ul id="menu-top" class="nav navbar-nav navbar-right">
                <li class=""><a href="MainController?action=Start">Home</a></li>
                <li><a href="MainController?action=Load">Shop</a></li>
                <%
                    if (loginUser == null) {
                %>
                    <li><a href="myAccount.jsp">My Account</a></li>
                <%
                    }
                %>

                <%
                    if (loginUser != null && loginUser.getRoleID().equals("AD")) {
                %>
                    <li class="dropdown"><a>Admin Account</a>
                        <ul class="dropdown-menu">																
                            <li><a href="productManagement.jsp">Product Management</a></li>
                            <li><a href="adminAccount.jsp">User Management</a></li>
                        </ul>
                    </li>
                
                    
                <%
                    }
                %>
                    
                <%
                    if (loginUser != null && loginUser.getRoleID().equals("US")) {
                %>
                
                    <li><a href="userAccount.jsp">User Account</a></li>
                <%
                    }
                %>
                <li><a href="checkout.jsp">Checkout</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li class="dropdown"><a>Pages</a>
                    <ul class="dropdown-menu">																
                        <li><a href="purchaseconfirmation.jsp">Purchase Confirmation</a></li>

                    </ul>
                </li>
                <%
                    int size=0;
                    Cart cart=(Cart) session.getAttribute("CART");
                    if(cart!=null){
                        size=cart.getSize();
                    }
                %>
                <li><a href="checkout.jsp"><i class="fa fa-shopping-cart"></i> Cart (<%=size%>)</a></li>
            </ul>
        </div>
    </div>
</nav>