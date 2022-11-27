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
import sample.tea.TeaDAO;
import sample.tea.TeaDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

    private static final String ERROR = "productManagement.jsp";
    private static final String SUCCESS = "SearchProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            TeaDAO dao = new TeaDAO();
            String error = "";
            String productName = request.getParameter("productName");
            String productIMG = request.getParameter("productIMG");
            String price = request.getParameter("price");
            String categoryID = request.getParameter("categoryID");
            String quantity = request.getParameter("quantiry");
            String detail = request.getParameter("detail");
            boolean checkValidation = true;

            if (checkValidation) {
                String checkDup = dao.checkDuplicate(productName, productIMG);
                if (checkDup.isEmpty()) {
                    TeaDTO tea = new TeaDTO("", productName, Double.parseDouble(price), Integer.parseInt(quantity), categoryID, productIMG, detail);
                    boolean checkAdd = dao.addProduct(tea);
                    if (checkAdd) {
                        request.setAttribute("MESSAGE", "Adding successfully!!!");
                        url = SUCCESS;
                    }else{
                        request.setAttribute("ERROR", "Adding fail!!!");
                    }
                }else{
                    request.setAttribute("ERROR", "Item have been existed!!!");
                }
            }

        } catch (Exception e) {
            log("Error at AddProductController: " + e.toString());

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
