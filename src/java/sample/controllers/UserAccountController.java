/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UserAccountController", urlPatterns = {"/UserAccountController"})
public class UserAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userAccount.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session= request.getSession();
            UserDTO user= (UserDTO) request.getAttribute("LOGIN_USER");
            UserDAO dao=new UserDAO();
            boolean checkDuplicate=dao.checkDuplicate(user.getUserName(), user.getEmail());
            System.out.println("Check: "+checkDuplicate);
            if(checkDuplicate==true){
                boolean create=dao.createUser(user);
                System.out.println("Create: "+create);
                if(create){
                    UserDTO loginUser=dao.getUser(user.getUserName(), user.getEmail());
                    session.setAttribute("LOGIN_USER", loginUser);
                    url=SUCCESS;
                }
            }else{
                UserDTO loginUser=dao.getUser(user.getUserName(), user.getEmail());
                System.out.println(loginUser);
                if(loginUser!=null){
                    session.setAttribute("LOGIN_USER", loginUser);
                    url=SUCCESS;
                }
            }
            request.setAttribute("GMAIL", "You are loging by gmail!");
        } catch (Exception e) {
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
