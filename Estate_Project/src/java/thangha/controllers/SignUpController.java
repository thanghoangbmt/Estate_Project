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
import javax.servlet.http.HttpSession;
import thangha.daos.UserDAO;
import thangha.dtos.UserDTO;
import thangha.dtos.UserError;

/**
 *
 * @author Admin
 */
public class SignUpController extends HttpServlet {

    private final String SUCCESS = "LoginController";
    private final String ERROR = "register.jsp";
    
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
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String userName = request.getParameter("userName");
            String gender = request.getParameter("gender");
            String roleID = "Customer";
            boolean valid = true;
            UserDAO dao = new UserDAO();
            UserError error = null;
            if (dao.checkExistID(userID)) {
                if (error == null)
                    error = new UserError();
                error.setUserIDError("User ID is exist!");
                valid = false;
            }
            if (!password.equals(confirmPassword)) {
                if (error == null)
                    error = new UserError();
                error.setConfirmPasswordError("Password and confirm password is not equal!");
                valid = false;
            }
            HttpSession session = request.getSession();
            if (valid) {
                UserDTO dto = new UserDTO(userID, password, roleID, userName, gender, true);
                boolean result = dao.registerUser(dto);
                if (result) {
                    url = SUCCESS + "?userID=" + userID + "&password=" + password;
                }
            } else {
               session.setAttribute("REGISTERERROR", error);
            }
        } catch (Exception e) {
            log("Error at SignUpController: " + e.toString());
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
