/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
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
public class LoginController extends HttpServlet {

    private static final String ERROR="myAccount.jsp";
    private static final String ADMIN_PAGE="adminAccount.jsp";
    private static final String AD="AD";
    private static final String USER_PAGE="userAccount.jsp";
    private static final String US="US";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
            String userName=request.getParameter("userName");
            String password=request.getParameter("password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            UserDAO dao=new UserDAO();
            UserDTO loginUser=dao.checkLogin(userName, password);
            boolean verify = dao.verifyCaptcha(gRecaptchaResponse);
            if(loginUser!=null && verify){
                HttpSession session=request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                String roleID=loginUser.getRoleID();
                if(US.equals(roleID)){
                    url=USER_PAGE;
                }
                else if(AD.equals(roleID)){
                    url=ADMIN_PAGE;
                }
                else{
                    request.setAttribute("ERROR", "Your code is not support!");
                }
            }else{
                //request.setAttribute("ERROR", "Incorect UserID or Password");
                if(verify){
                    request.setAttribute("ERROR", "Incorect UserID or Password");
                }
                else{
                    request.setAttribute("ERROR", "You missed the Captcha.");
                }
            }
        }
        catch(Exception e){
            log("Error at Login Controller: "+e.toString());
        }
        finally{
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
