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
@WebServlet(name = "GetController", urlPatterns = {"/GetController"})
public class GetController extends HttpServlet {

    private static final String ERROR="shop.jsp";
    private static final String SUCCESS="shop.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String get=request.getParameter("get");
            TeaDAO dao=new TeaDAO();
            List<TeaDTO> listTea=dao.getListTea(get); 
            System.out.println(listTea);
            List<CategoryDTO> listCategory=dao.getListCategory();
            request.setAttribute("LIST_CATEGORY", listCategory);
            if(listTea.size()>0 && listTea!=null){
                request.setAttribute("LIST_TEA", listTea);
                url=SUCCESS;
            }else{
                request.setAttribute("ERROR", "No item match! ! !");
            }
            System.out.println("URL: "+url);
        } catch (Exception e) {
            log("ERROR at GetController: "+e.toString());
        }finally{
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
