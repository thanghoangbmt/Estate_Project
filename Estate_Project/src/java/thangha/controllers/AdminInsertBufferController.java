/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AdminInsertBufferController extends HttpServlet {

    private final String SUCCESS = "admin_insert_estate.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String searchProvince = request.getParameter("searchProvince");
            String searchCategory = request.getParameter("searchCategory");
            String searchOwner = request.getParameter("searchOwner");
            String searchBedroom = request.getParameter("searchBedroom");
            String searchBathroom = request.getParameter("searchBathroom");
            String searchPrice = request.getParameter("searchPrice");
            String searchSquare = request.getParameter("searchSquare");
            String searchInterior = request.getParameter("searchInterior");

            request.setAttribute("searchProvince", searchProvince);
            request.setAttribute("searchCategory", searchCategory);
            request.setAttribute("searchOwner", searchOwner);
            request.setAttribute("searchBedroom", searchBedroom);
            request.setAttribute("searchBathroom", searchBathroom);
            request.setAttribute("searchPrice", searchPrice);
            request.setAttribute("searchSquare", searchSquare);
            request.setAttribute("searchInterior", searchInterior);
        } catch (Exception e) {
            log("Error at AdminInsertBufferController: " + e.toString());
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
