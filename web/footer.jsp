<%-- 
    Document   : footer
    Created on : Jun 9, 2022, 3:29:31 PM
    Author     : DELL
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="themefooter section medium-padding bg-graphite">
    <div class="container">
        <div class="section-inner row">
            <div class="column column-1 col-md-4 rightbd">
                <div class="widgets">
                    <div class="widget widget_text">
                        <div class="widget-content">
                            <h3 class="widget-title">About &nbsp; &#8220;Meri&#8221;</h3>
                            <div class="textwidget">
                                Taiwanese milk tea for Vietnamese people, with Vietnamese soul and spirit creating Vietnamese youth style. – That is the task that MERI always wants to complete and must be successful with the chosen path.
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /footer-a -->
            <div class="column column-1 col-md-4 rightbd">
                <div class="widgets">
                    <div class="widget widget_wysija">
                        <div class="widget-content">
                            <h3 class="widget-title">Subscribe to our Newsletter</h3>
                            <div class="widget_wysija_cont">
                                <form class="widget_wysija">
                                    Subscribe to our newsletter and join our 1374 subscribers.
                                    <p class="wysija-paragraph">
                                        <label>Email <span class="wysija-required">*</span></label>
                                        <input type="text" name="" class="wysija-input validate[required,custom[email]]" title="Email" value=""/>
                                    </p>
                                    <input class="wysija-submit wysija-submit-field" type="submit" value="Subscribe!"/>
                                </form>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /footer-b -->
            <div class="column column-1 col-md-4">
                <div class="widgets">
                    <div class="widget widget_edd_categories_tags_widget">
                        <div class="widget-content">
                            <h3 class="widget-title">Shop Categories</h3>
                            <ul class="edd-taxonomy-widget">
                                <li><a href="MainController?action=Classify&categoryID=1">LATTE SERIES</a></li>
                                <li><a href="MainController?action=Classify&categoryID=2">SPECIAL MILK FOAM</a></li>
                                <li><a href="MainController?action=Classify&categoryID=3">MILK TEA</a></li>
                                <li><a href="MainController?action=Classify&categoryID=4">BREWED TEA SERIES</a></li>
                                <li><a href="MainController?action=Classify&categoryID=5">CREATIVE MIX</a></li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /footer-c -->
            <div class="clear">
            </div>
        </div>
        <!-- /footer-inner -->
    </div>
    <!-- /grid -->
    <div class="sectioncredits">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <span class="credits-left fleft">
                        2022 &copy; All Rights Reserved, Meri_Sweet World </span>

                    <ul class="footermenu fright">
                        <li><a href="MainController?action=Start">Home</a></li>
                        <li><a href="MainController?action=Load">Shop</a></li>
                            <%
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser != null && loginUser.getRoleID().equals("US")) {
                            %>
                        <li><a href="userAccount">User Account</a></li>
                            <%    } else if (loginUser != null && loginUser.getRoleID().equals("AD")) {

                            %>
                        <li><a href="adminAccount.jsp">Admin Account</a></li>

                        <%    } else {
                        %>
                        <li><a href="myAccount.jsp">My Account</a></li>
                        <%
                            }
                        %>
                        
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <!-- /grid -->
    </div>
    <!-- /sectioncredits -->
</footer>
