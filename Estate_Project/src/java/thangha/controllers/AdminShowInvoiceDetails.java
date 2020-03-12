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
import thangha.daos.InvoiceDAO;
import thangha.daos.InvoiceDetailsDAO;
import thangha.dtos.InvoiceDetailsDTO;

/**
 *
 * @author Admin
 */
public class AdminShowInvoiceDetails extends HttpServlet {

    private final String SUCCESS = "admin_invoice_details.jsp";

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
            String strInvoiceID = request.getParameter("invoiceDetails");
            int invoiceID = Integer.parseInt(strInvoiceID);
            InvoiceDAO invoiceDAO = new InvoiceDAO();
            String userID = invoiceDAO.getUserIDByInvoiceID(invoiceID);
            String date = invoiceDAO.getDateByInvoiceID(invoiceID);
            double total = invoiceDAO.getTotalByInvoiceID(invoiceID);
            InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
            List<InvoiceDetailsDTO> invoiceDetails = invoiceDetailsDAO.getListDetailsByInvoiceID(invoiceID);
            request.setAttribute("USERID", userID);
            request.setAttribute("DATE", date);
            request.setAttribute("TOTAL", total);
            request.setAttribute("INVOICE_DETAILS", invoiceDetails);
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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
