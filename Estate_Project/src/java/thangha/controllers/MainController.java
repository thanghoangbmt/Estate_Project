/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class MainController extends HttpServlet {
    
    private final String ACCOUNT = "account.jsp";
    private final String LOGIN = "LoginController";
    private final String LOGOUT = "LogoutController";
    private final String CUSTOMER_REGISTER = "register.jsp";
    private final String CUSTOMER_SEARCH_ESTATE = "CustomerSearchEstateController";
    
    
    private final String SIGNUP = "SignUpController";
    private final String ADMIN_SEARCH_ESTATE = "AdminSearchEstateController";
    private final String ADMIN_INDEX = "AdminIndexController";
    private final String ADMIN_INDEX_ACCOUNT = "AdminIndexAccountController";
    private final String ADMIN_INDEX_INVOICE = "AdminIndexInvoiceController";
    private final String ADMIN_SHOW_INVOICE_DETAILS = "AdminShowInvoiceDetails";
    
    private final String ADMIN_INSERT_NEW_ESTATE = "AdminInsertBufferController";
    private final String ADMIN_INSERT_ESTATE = "AdminInsertEstateController";
    private final String ADMIN_EDIT_ESTATE = "AdminEditEstateController";
    private final String ADMIN_UPDATE_ESTATE = "AdminUpdateEstateController";
    private final String ADMIN_DELETE_ESTATE = "AdminDeleteEstateController";
    private final String SHOWDETAILS_ESTATE = "ShowDetailsPropertyController";
    private final String ADMIN_INSERT_NEW_ACCOUNT = "admin_insert_account.jsp";
    private final String ADMIN_INSERT_ACCOUNT = "AdminInsertAccountController";
    private final String ADMIN_EDIT_ACCOUNT = "AdminEditAcccountController";
    private final String ADMIN_UPDATE_ACCOUNT = "AdminUpdateAcccountController";
    private final String ADMIN_DELETE_ACCOUNT = "AdminDeleteAcccountController";
    
    private final String ADDTOCART = "AddToCartController"; 
    private final String VIEWCART = "viewCart.jsp";
    private final String REMOVE_ESTATE_IN_CART = "RemoveEstateInCartController";
    private final String CHECK_OUT_CART = "CheckOutController";
    
    private final String VIEW_INVOICE_HISTORY = "ViewInvoiceHistoryController";
    private final String VIEW_INVOICE_HISTORY_DETAILS = "ViewInvoiceHistoryDetailsController";
    
    private final String ERROR = "login.jsp";
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
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("action");
            if (action.equals("Account")) {
                if (session.getAttribute("USER") != null)
                    url = ACCOUNT;
                else 
                    url = ERROR;
            } else if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Customer_Register")) {
                url = CUSTOMER_REGISTER;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Sign Up")) {
                url = SIGNUP;
            } else if (action.equals("AdminIndex")) {
                url = ADMIN_INDEX;
            } else if (action.equals("AdminIndexAccount")) {
                url = ADMIN_INDEX_ACCOUNT;
            } else if (action.equals("AdminIndexInvoice")) {
                url = ADMIN_INDEX_INVOICE;
            } else if (action.equals("Show_Invoice_Details")) {
                url = ADMIN_SHOW_INVOICE_DETAILS;
            } else if (action.equals("Admin_Search_Estate")) {
                url = ADMIN_SEARCH_ESTATE;
            } else if (action.equals("Admin_Insert_New_Estate")) {
                url = ADMIN_INSERT_NEW_ESTATE;
            } else if (action.equals("Admin_Insert_Estate")) {
                url = ADMIN_INSERT_ESTATE;
            } else if (action.equals("Admin_Delete_Estate")) {
                url = ADMIN_DELETE_ESTATE;
            } else if (action.equals("Admin_Edit_Estate")) {
                url = ADMIN_EDIT_ESTATE;
            } else if (action.equals("Admin_Update_Estate")) {
                url = ADMIN_UPDATE_ESTATE;
            } else if (action.equals("ShowDetails_Estate")) {
                url = SHOWDETAILS_ESTATE;
            } else if (action.equals("Admin_Insert_New_Account")) {
                url = ADMIN_INSERT_NEW_ACCOUNT;
            } else if (action.equals("Admin_Insert_Account")) {
                url = ADMIN_INSERT_ACCOUNT;
            } else if (action.equals("Admin_Edit_Account")) {
                url = ADMIN_EDIT_ACCOUNT;
            } else if (action.equals("Admin_Update_Account")) {
                url = ADMIN_UPDATE_ACCOUNT;
            } else if (action.equals("Admin_Delete_Account")) {
                url = ADMIN_DELETE_ACCOUNT;
            } else if (action.equals("Add_To_Cart")) {
                url = ADDTOCART;
            } else if (action.equals("ViewCart")) {
                url = VIEWCART;
            } else if (action.equals("Remove_Estate_In_Cart")) {
                url = REMOVE_ESTATE_IN_CART;
            } else if (action.equals("CheckOut_Cart")) {
                url = CHECK_OUT_CART;
            } else if (action.equals("Customer_Search_Estate")) {
                url = CUSTOMER_SEARCH_ESTATE;
            } else if (action.equals("ViewInvoiceHistory")) {
                url = VIEW_INVOICE_HISTORY;
            } else if (action.equals("Show_Invoice_History_Details")) {
                url = VIEW_INVOICE_HISTORY_DETAILS;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
