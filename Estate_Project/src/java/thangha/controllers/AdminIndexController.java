/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import thangha.daos.CategoryDAO;
import thangha.daos.OwnerDAO;
import thangha.daos.PropertyDAO;
import thangha.daos.ProvinceDAO;
import thangha.dtos.CategoryDTO;
import thangha.dtos.OwnerDTO;
import thangha.dtos.ProvinceDTO;

/**
 *
 * @author Admin
 */
public class AdminIndexController extends HttpServlet {

    private final String SUCCESS = "admin.jsp";

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
            ProvinceDAO provinceDAO = new ProvinceDAO();
            List<ProvinceDTO> provinces = provinceDAO.getListProvince();
            request.setAttribute("PROVINCES", provinces);
            
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> categories = categoryDAO.getListCategory();
            request.setAttribute("CATEGORIES", categories);
            
            OwnerDAO ownerDAO = new OwnerDAO();
            List<OwnerDTO> owners = ownerDAO.getListOwner();
            request.setAttribute("OWNERS", owners);
            
            PropertyDAO proDAO = new PropertyDAO();
            double highestSquare = proDAO.getHighestSquare();
            request.setAttribute("HIGHESTSQUARE", highestSquare);
            
            double highestPrice = proDAO.getHighestPrice();
            request.setAttribute("HIGHESTPRICE", highestPrice);
            
        } catch (Exception e) {
            log("Error at AdminIndexController: " + e.toString());
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
