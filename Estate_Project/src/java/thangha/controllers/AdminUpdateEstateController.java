/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import thangha.daos.OwnerDAO;
import thangha.daos.PropertyDAO;
import thangha.dtos.PropertyDTO;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminUpdateEstateController extends HttpServlet {

    private final String SUCCESS = "AdminSearchEstateController";
    private final String ERROR = "admin_update_estate.jsp";
    private final String SAVE_DIRECTORY = "img";

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
            String strPropertyID = request.getParameter("propertyID");
            String address = request.getParameter("address");
            String strSalePrice = request.getParameter("price");
            String strSquare = request.getParameter("square");
            String strInterior = request.getParameter("interior");
            String description = request.getParameter("description");
            String strNumberOfRoom = request.getParameter("numberOfRoom");
            String strNumberOfToilet = request.getParameter("numberOfToilet");
            String category = request.getParameter("category");
            String province = request.getParameter("province");
            String owner = request.getParameter("owner");

            int propertyID = Integer.parseInt(strPropertyID);
            double salePrice = Double.parseDouble(strSalePrice);
            double square = Double.parseDouble(strSquare);
            boolean interior = false;
            if (strInterior != null) {
                interior = true;
                if (strInterior.isEmpty()) {
                    interior = false;
                }
            }

            int numberOfRoom = Integer.parseInt(strNumberOfRoom);
            int numberOfToilet = Integer.parseInt(strNumberOfToilet);
            boolean sold = false;

            String appPath = request.getServletContext().getRealPath("");
            appPath = appPath.replace('\\', '/');
            int indexOfBuild = appPath.indexOf("build");
            appPath = appPath.substring(0, indexOfBuild) + appPath.substring(indexOfBuild + 6);

            // Thư mục để save file tải lên.
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }
            // Tạo thư mục nếu nó không tồn tại.
            File fileSaveDir = new File(fullSavePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            // Luu file upload lên (Có thể là nhiều file).
            Part part = request.getPart("imagesInput");
            String fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                String filePath = fullSavePath + File.separator + fileName;
                System.out.println("Edit user - Write file to: " + filePath);

                // Ghi vào file.
                part.write(filePath);
            }
            // Upload thành công.

            OwnerDAO ownerDAO = new OwnerDAO();
            int ownerID = ownerDAO.getOwnerIDByName(owner);
            if (ownerID == -1) {
                ownerDAO.addNewOwner(owner);
            }

            ArrayList<String> images = new ArrayList();
            images.add("img/" + fileName);

            PropertyDTO proDTO = new PropertyDTO(propertyID, address, salePrice, square, interior, description, numberOfRoom, numberOfToilet, sold, images, category, province, owner);
            PropertyDAO proDAO = new PropertyDAO();
            boolean result = proDAO.updateProperty(proDTO);
            String searchProvince = request.getParameter("searchProvince");
            String searchCategory = request.getParameter("searchCategory");
            String searchOwner = request.getParameter("searchOwner");
            String searchBedroom = request.getParameter("searchBedroom");
            String searchBathroom = request.getParameter("searchBathroom");
            String searchPrice = request.getParameter("searchPrice");
            String searchSquare = request.getParameter("searchSquare");
            String searchInterior = request.getParameter("searchInterior");
            if (searchInterior.isEmpty()) {
                searchInterior = null;
            }
            if (result) {
                url = SUCCESS + "?provinces=" + searchProvince + "&catagories="
                        + searchCategory + "&owners=" + searchOwner + "&bedrooms=" + searchBedroom
                        + "&bathrooms=" + searchBathroom + "&price=" + searchPrice
                        + "&square=" + searchSquare + "&InteriorChb=" + searchInterior;
            }
        } catch (Exception e) {
            log("Error at AdminUpdateEstateController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
