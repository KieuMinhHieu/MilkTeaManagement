/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.tea.CategoryDTO;
import sample.tea.TeaDAO;
import sample.tea.TeaDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ShowController", urlPatterns = {"/ShowController"})
public class ShowController extends HttpServlet {

    private static final String ERROR="error.jsp";
    private static final String SUCCESS="productSingle.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String productID=request.getParameter("productID");
            String categoryID=request.getParameter("categoryID");
            String categoryName="";
            TeaDAO dao=new TeaDAO();
            TeaDTO tea=dao.getTea(productID);
            System.out.println(tea);
            request.setAttribute("TEA", tea);
            
            List<CategoryDTO> listCategory=dao.getListCategory();
            request.setAttribute("LIST_CATEGORY", listCategory);
            
            List<TeaDTO> listBestSellers = dao.getListBestSellers();
            request.setAttribute("LIST_BEST_SELLERS", listBestSellers);
            for (CategoryDTO categoryDTO : listCategory) {
                if(Integer.parseInt(categoryID)==categoryDTO.getCategoryID()){
                    categoryName=categoryDTO.getCategoryName();
                }
            }
            request.setAttribute("CATEGORY_NAME", categoryName);
            if(tea!=null && listCategory!=null && listBestSellers!=null){
                url=SUCCESS;
            }
        } catch (Exception e) {
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
