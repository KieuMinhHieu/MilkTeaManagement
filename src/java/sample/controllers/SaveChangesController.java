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
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SaveChangesController", urlPatterns = {"/SaveChangesController"})
public class SaveChangesController extends HttpServlet {

    private static final String ERROR = "userAccount.jsp";
    private static final String SUCCESS = "userAccount.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String birthdate = request.getParameter("birthdate");
            String address = request.getParameter("address");
            String newPassword = request.getParameter("newPassword");
            String confirm = request.getParameter("confirm");
            HttpSession session = request.getSession();
            boolean checkValidation = true;
            UserDAO dao = new UserDAO();
            UserError userError = new UserError();
            if (userName.length() > 50 || userName.length() < 2) {
                userError.setUserName("Length must be in [2,50]");
                checkValidation = false;
            }
            if (!newPassword.equals(confirm)) {
                userError.setPassword("Password must be same");
                checkValidation = false;
            }
            if (email.length() <= 0) {
                userError.setEmail("Email is empty!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, userName, gender, email, address, newPassword, "US", birthdate);
                boolean check = dao.update(user);
                if (check) {
                    session.setAttribute("LOGIN_USER", user);
                    request.setAttribute("MESSAGE", "Change successfully!");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at SaveChangesController: " + e.toString());
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
