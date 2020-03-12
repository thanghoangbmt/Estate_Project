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
import thangha.daos.PropertyDAO;
import thangha.dtos.PropertyDTO;

/**
 *
 * @author Admin
 */
public class AdminSearchEstateController extends HttpServlet {

    private final String SUCCESS = "AdminIndexController";

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
            String strProvinceID = request.getParameter("provinces");
            String strCategoryID = request.getParameter("catagories");
            String strOwnerID = request.getParameter("owners");
            String strBedroom = request.getParameter("bedrooms");
            String strBathroom = request.getParameter("bathrooms");
            String strPrice = request.getParameter("price");
            String strSquare = request.getParameter("square");
            String strInterior = request.getParameter("InteriorChb");

            int provinceID;
            int categoryID;
            int ownerID;
            int bedroom;
            int bathroom;
            double price;
            double square;
            boolean interior = false;
            try {
                provinceID = Integer.parseInt(strProvinceID);
                categoryID = Integer.parseInt(strCategoryID);
                ownerID = Integer.parseInt(strOwnerID);
                bedroom = Integer.parseInt(strBedroom);
                bathroom = Integer.parseInt(strBathroom);
                price = Double.parseDouble(strPrice);
                square = Double.parseDouble(strSquare);
                if (strInterior != null) {
                    interior = true;
                    if (strInterior.equals("null")) {
                        interior = false;
                    }
                }
                PropertyDAO proDAO = new PropertyDAO();
                List<PropertyDTO> list = proDAO.searchEstateAdmin(provinceID, categoryID, ownerID, bedroom, bathroom, price, square, interior);
                request.setAttribute("LISTPROPERTY", list);

                request.setAttribute("searchProvince", strProvinceID);
                request.setAttribute("searchCategory", strCategoryID);
                request.setAttribute("searchOwner", strOwnerID);
                request.setAttribute("searchBedroom", strBedroom);
                request.setAttribute("searchBathroom", strBathroom);
                request.setAttribute("searchPrice", strPrice);
                request.setAttribute("searchSquare", strSquare);
                request.setAttribute("searchInterior", strInterior);

            } catch (Exception e) {
                log("Error at AdminSearchController: Failed in parsing String!");
            }
        } catch (Exception e) {
            log("Error at AdminSearchController: " + e.toString());
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
