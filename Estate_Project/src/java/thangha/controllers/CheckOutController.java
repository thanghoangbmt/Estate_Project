/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import thangha.daos.CategoryDAO;
import thangha.daos.InvoiceDAO;
import thangha.daos.InvoiceDetailsDAO;
import thangha.daos.PropertyDAO;
import thangha.daos.ProvinceDAO;
import thangha.dtos.CartDTO;
import thangha.dtos.InvoiceDTO;
import thangha.dtos.InvoiceDetailsDTO;
import thangha.dtos.UserDTO;

/**
 *
 * @author Admin
 */
public class CheckOutController extends HttpServlet {

    private final String SUCCESS = "viewCart.jsp";

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
            HttpSession session = request.getSession();
            UserDTO userDTO = (UserDTO) session.getAttribute("USER");
            String userID = userDTO.getUserID();
            CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
            if (cartDTO.getCustomerName().isEmpty()) {
                cartDTO.setCustomerName(userDTO.getUserName());
            }
            PropertyDAO propertyDAO = new PropertyDAO();
            List<Integer> listPropertyID = new ArrayList<>(cartDTO.getCart().keySet());
            int count = 0;
            String successMessage = "";
            String failedMessage = "";
            InvoiceDTO invoiceDTO = null;
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date dateFormats = new Date();
            String date = dateFormat.format(dateFormats);

            InvoiceDAO invoiceDAO = new InvoiceDAO();
            InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();

            for (int i = 0; i < listPropertyID.size(); i++) {
                boolean available = propertyDAO.checkAvailable(listPropertyID.get(i));
                ProvinceDAO provinceDAO = new ProvinceDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                String province = provinceDAO.getProvinceNameByID(listPropertyID.get(i));
                String category = categoryDAO.getTypeCategoryByID(listPropertyID.get(i));
                if (available) {
                    double price = propertyDAO.getPropertyPrice(listPropertyID.get(i));
                    InvoiceDetailsDTO invoiceDetailsDTO = new InvoiceDetailsDTO(listPropertyID.get(i), price, date);
                    if (invoiceDTO == null) {
                        invoiceDTO = new InvoiceDTO(date, userID);
                    }

                    if (invoiceDTO.getListDetailsDTO() == null) {
                        invoiceDTO.setListDetailsDTO(new ArrayList<>());
                    }

                    invoiceDTO.getListDetailsDTO().add(invoiceDetailsDTO);
                    successMessage = successMessage + category + " in " + province + " ";
                    count++;
                } else {
                    failedMessage = failedMessage + category + " in " + province + " ";
                }
            }

            if (invoiceDTO != null) {
                double total = invoiceDTO.getTotalPrice();
                boolean checkAddNewInvoice = invoiceDAO.addNewInvoice(date, userID, total);
                boolean updateInvoiceDetails = false;
                boolean updateProperty = false;

                int invoiceID = invoiceDAO.getInvoiceID(date, userID, total);
                if (checkAddNewInvoice) {
                    ArrayList<InvoiceDetailsDTO> listDetails = invoiceDTO.getListDetailsDTO();
                    for (int i = 0; i < listDetails.size(); i++) {
                        int highestInvoiceDetailsID = invoiceDetailsDAO.getHighestID();
                        int invoiceDetailsID = highestInvoiceDetailsID + 1;
                        listDetails.get(i).setInvoiceDetailsID(invoiceDetailsID);
                        listDetails.get(i).setInvoiceID(invoiceID);
                        updateInvoiceDetails = invoiceDetailsDAO.addNewInvoiceDetails(listDetails.get(i));
                        updateProperty = propertyDAO.setSoldForProperty(listDetails.get(i).getPropertyID());
                    }
                    if (updateInvoiceDetails && updateProperty) {
                        session.removeAttribute("CART");
                    }
                }
            }

            if (count == listPropertyID.size()) {
                successMessage = "Check out all property successfully!";
            }
            if (!successMessage.isEmpty()) {
                request.setAttribute("CHECKOUT_SUCCESSFULLY_MESSAGE", successMessage);
            }
            if (!failedMessage.isEmpty()) {
                request.setAttribute("CHECKOUT_FAILED_MESSAGE", failedMessage);
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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
