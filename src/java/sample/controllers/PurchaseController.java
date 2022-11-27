/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.order.OrderDAO;
import sample.tea.Cart;
import sample.tea.TeaDAO;
import sample.tea.TeaDTO;
import sample.user.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "PurchaseController", urlPatterns = {"/PurchaseController"})
public class PurchaseController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "SendEmailController";
    private static final String CHECKOUT="checkout.jsp";
    private static final String DIRECT = "Direct";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String method = request.getParameter("method");
            TeaDAO teaDao = new TeaDAO();
            OrderDAO orderDao = new OrderDAO();
            HttpSession session = request.getSession();
            List<TeaDTO> listError = null;
            if (session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser != null && loginUser.getRoleID().equals("US")) {
                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        listError = teaDao.checkQuantity(cart);
                        if (listError.size() < 1) {
                            if (DIRECT.equals(method)) {
                                url = SUCCESS;
                            } else {
                                request.setAttribute("PAYPAL", "PayPal");
                                url=CHECKOUT;
                            }
                        } else {
                            request.setAttribute("LIST_ERROR", listError);
                        }
                    } else {
                        request.setAttribute("ERROR", "Your cart is empty!");
                    }
                } else {
                    request.setAttribute("ERROR", "Please! Login before Purchase.");
                }
            }
        } catch (Exception e) {
            log("ERROR at PurchaseController: " + e.toString());
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
