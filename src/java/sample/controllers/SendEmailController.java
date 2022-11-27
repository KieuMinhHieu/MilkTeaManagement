/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.email.Email;
import sample.order.OrderDAO;
import sample.tea.Cart;
import sample.tea.TeaDAO;
import sample.user.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SendEmailController", urlPatterns = {"/SendEmailController"})
public class SendEmailController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "StartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //            Lấy tham số
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = firstName+ " "+ request.getParameter("lastName");
            //            Lấy session
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            //            Dao
            Email e = new Email();
            OrderDAO orderDao = new OrderDAO();
            TeaDAO teaDao = new TeaDAO();
            //            Insert vô bảng order
            boolean check1 = orderDao.insertTblOder(loginUser.getUserID(), cart.getTotal());
            System.out.println("Check 1:" + check1);
            //            Insert vô bảng orderDetail
            boolean check2 = orderDao.insertTblOrderDetail(cart);
            System.out.println("Check 2:" + check2);
            //Check & send mail
            if (check1 == true && check2 == true) {
                if (teaDao.updateQuantity(cart)) {
                    boolean check = e.sendEmail(email, lastName, cart);
                    System.out.println("Check Send: " + check);
                    if (check) {
                        session.removeAttribute("CART");
                        request.setAttribute("SUCCESS", "Success");
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("ERROR", "Can not purchase! Please try again!!!");
                }
            } else {
                request.setAttribute("ERROR", "Can not purchase! Please try again!");
            }
        } catch (Exception e) {
            log("Error at SendEmailController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
