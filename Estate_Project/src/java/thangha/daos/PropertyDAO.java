/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import thangha.dtos.PropertyDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class PropertyDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<PropertyDTO> getTopSixProperty() throws SQLException {
        List<PropertyDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT PropertyID, Address, SalePrice, Square, Description, "
                        + "NumberOfToilet, Images, Type, Name "
                        + "FROM Property p1, Province p2, Category c "
                        + "WHERE p1.Sold = ? AND p1.CategoryID = c.ID AND p1.ProvinceID = p2.ID;";
                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, false);
                rs = ps.executeQuery();
                int count = 0;
                while (rs.next()) {
                    if (count == 6) {
                        break;
                    }
                    int propertyID = rs.getInt("PropertyID");
                    String address = rs.getString("Address");
                    double salePrice = rs.getDouble("SalePrice");
                    double square = rs.getDouble("Square");
                    String description = rs.getString("Description");
                    int numberOfToilet = rs.getInt("NumberOfToilet");
                    String category = rs.getString("Type");
                    String province = rs.getString("Name");
                    String[] urlImages = rs.getString("Images").split(" ");
                    ArrayList<String> images = null;
                    for (int i = 0; i < urlImages.length; i++) {
                        if (images == null) {
                            images = new ArrayList<>();
                        }
                        images.add(urlImages[i]);
                    }

                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new PropertyDTO(propertyID, address, salePrice, square, description, numberOfToilet, images, category, province));
                    count++;
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<PropertyDTO> getAllProperty() throws SQLException {
        List<PropertyDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT p1.PropertyID, p1.Address, p1.SalePrice, "
                    + "p1.Square, p1.Interior, p1.Description, p1.NumberOfRoom, "
                    + "p1.NumberOfToilet, p1.Sold, c.Type, p2.Name AS ProvinceName, "
                    + "o1.name AS OwnerName "
                    + "FROM Property p1, Province p2, Owner o1, Category c "
                    + "WHERE p1.CategoryID = c.ID  AND p1.ProvinceID = p2.ID "
                    + "AND p1.OwnerID = o1.ID";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int propertyID = rs.getInt("PropertyID");
                String address = rs.getString("Address");
                double salePrice = rs.getDouble("SalePrice");
                double square = rs.getDouble("Square");
                boolean Interior = rs.getBoolean("Interior");
                String description = rs.getString("Description");
                int numberOfRoom = rs.getInt("NumberOfRoom");
                int numberOfToilet = rs.getInt("NumberOfToilet");
                boolean sold = rs.getBoolean("Sold");
                String category = rs.getString("Type");
                String province = rs.getString("ProvinceName");
                String owner = rs.getString("OwnerName");
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new PropertyDTO(propertyID, address, salePrice, square, Interior, description, numberOfRoom, numberOfToilet, sold, category, province, owner));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<PropertyDTO> searchEstateAdmin(int provinceID, int categoryID, int ownerID, int bedroom, int bathroom, double price, double square, boolean interior) throws SQLException {
        List<PropertyDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {

                String sql = "SELECT p1.PropertyID, p1.Address, p1.SalePrice, p1.Square, "
                        + "p1.Interior, p1.NumberOfRoom, p1.NumberOfToilet, p1.Sold, "
                        + "c2.Type AS Category, p2.Name AS Province, o1.Name AS Owner "
                        + "FROM Property p1, Province p2, Category c2, Owner o1 "
                        + "WHERE "
                        //                    + "//AND p1.NumberOfToilet = 2 "
                        //                    + "AND p1.Square BETWEEN 125 AND 135 "
                        //                    + "AND p1.SalePrice BETWEEN 100000 AND 1000000 "
                        //                    + "AND p1.Interior = 1 "
                        + "p1.ProvinceID = p2.ID "
                        + "AND p1.CategoryID = c2.ID "
                        + "AND p1.OwnerID = o1.ID ";
                //check bedroom
                if (bedroom != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (bedroom == 6) {
                        sql = sql + "p1.NumberOfRoom >= 6";
                    } else {
                        sql = sql + "p1.NumberOfRoom = " + bedroom;
                    }
                }

                if (bathroom != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (bathroom == 6) {
                        sql = sql + "p1.NumberOfToilet >= 6";
                    } else {
                        sql = sql + "p1.NumberOfToilet = " + bathroom;
                    }
                }

                if (square != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (square == 5) {
                        sql = sql + "p1.Square >= 500";
                    } else if (square == 1) {
                        sql = sql + "p1.Square BETWEEN 0 AND 50 ";
                    } else if (square == 2) {
                        sql = sql + "p1.Square BETWEEN 50 AND 100 ";
                    } else if (square == 3) {
                        sql = sql + "p1.Square BETWEEN 100 AND 200 ";
                    } else if (square == 4) {
                        sql = sql + "p1.Square BETWEEN 200 AND 500 ";
                    }
                }

                if (price != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (price == 5) {
                        sql = sql + "p1.Price >= 5000000";
                    } else if (price == 1) {
                        sql = sql + "p1.Price BETWEEN 0 AND 500000 ";
                    } else if (price == 2) {
                        sql = sql + "p1.Price BETWEEN 500000 AND 1000000 ";
                    } else if (price == 3) {
                        sql = sql + "p1.Price BETWEEN 1000000 AND 2000000 ";
                    } else if (price == 4) {
                        sql = sql + "p1.Price BETWEEN 2000000 AND 5000000 ";
                    }
                }

                if (interior) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.Interior = 1";
                }

                if (provinceID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.ProvinceID = " + provinceID + " ";
                }

                if (categoryID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.CategoryID = " + categoryID + " ";
                }

                if (ownerID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.OwnerID = " + ownerID + " ";
                }
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int propertyIDDTO = rs.getInt("PropertyID");
                    String addressDTO = rs.getString("Address");
                    double salePriceDTO = rs.getDouble("SalePrice");
                    double squareDTO = rs.getDouble("Square");
                    boolean interiorDTO = rs.getBoolean("Interior");
                    int numberOfRoomDTO = rs.getInt("NumberOfRoom");
                    int numberOfToiletDTO = rs.getInt("NumberOfToilet");
                    boolean soldDTO = rs.getBoolean("Sold");
                    String categoryDTO = rs.getString("Category");
                    String provinceDTO = rs.getString("Province");
                    String ownerDTO = rs.getString("Owner");
                    PropertyDTO proDTO = new PropertyDTO(propertyIDDTO, addressDTO, salePriceDTO, squareDTO, interiorDTO, numberOfRoomDTO, numberOfToiletDTO, soldDTO, categoryDTO, provinceDTO, ownerDTO);
                    list.add(proDTO);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<PropertyDTO> searchEstateCustomer(int provinceID, int categoryID, int ownerID, int bedroom, int bathroom, double price, double square, boolean interior) throws SQLException {
        List<PropertyDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {

                String sql = "SELECT p1.PropertyID, p1.Address, p1.SalePrice, p1.Square, "
                        + "p1.Interior, p1.NumberOfRoom, p1.NumberOfToilet, p1.Sold, "
                        + "c2.Type AS Category, p2.Name AS Province, o1.Name AS Owner, p1.Images "
                        + "FROM Property p1, Province p2, Category c2, Owner o1 "
                        + "WHERE "
                        + "p1.Sold = ? "
                        + "AND p1.ProvinceID = p2.ID "
                        + "AND p1.CategoryID = c2.ID "
                        + "AND p1.OwnerID = o1.ID ";
                //check bedroom
                if (bedroom != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (bedroom == 6) {
                        sql = sql + "p1.NumberOfRoom >= 6";
                    } else {
                        sql = sql + "p1.NumberOfRoom = " + bedroom;
                    }
                }

                if (bathroom != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (bathroom == 6) {
                        sql = sql + "p1.NumberOfToilet >= 6";
                    } else {
                        sql = sql + "p1.NumberOfToilet = " + bathroom;
                    }
                }

                if (square != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (square == 5) {
                        sql = sql + "p1.Square >= 500";
                    } else if (square == 1) {
                        sql = sql + "p1.Square BETWEEN 0 AND 50 ";
                    } else if (square == 2) {
                        sql = sql + "p1.Square BETWEEN 50 AND 100 ";
                    } else if (square == 3) {
                        sql = sql + "p1.Square BETWEEN 100 AND 200 ";
                    } else if (square == 4) {
                        sql = sql + "p1.Square BETWEEN 200 AND 500 ";
                    }
                }

                if (price != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    if (price == 5) {
                        sql = sql + "p1.Price >= 5000000";
                    } else if (price == 1) {
                        sql = sql + "p1.Price BETWEEN 0 AND 500000 ";
                    } else if (price == 2) {
                        sql = sql + "p1.Price BETWEEN 500000 AND 1000000 ";
                    } else if (price == 3) {
                        sql = sql + "p1.Price BETWEEN 1000000 AND 2000000 ";
                    } else if (price == 4) {
                        sql = sql + "p1.Price BETWEEN 2000000 AND 5000000 ";
                    }
                }

                if (interior) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.Interior = 1";
                }

                if (provinceID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.ProvinceID = " + provinceID + " ";
                }

                if (categoryID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.CategoryID = " + categoryID + " ";
                }

                if (ownerID != 0) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + "WHERE ";
                    } else {
                        sql = sql + "AND ";
                    }
                    sql = sql + "p1.OwnerID = " + ownerID + " ";
                }
                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, false);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    int propertyIDDTO = rs.getInt("PropertyID");
                    String addressDTO = rs.getString("Address");
                    double salePriceDTO = rs.getDouble("SalePrice");
                    double squareDTO = rs.getDouble("Square");
                    boolean interiorDTO = rs.getBoolean("Interior");
                    int numberOfRoomDTO = rs.getInt("NumberOfRoom");
                    int numberOfToiletDTO = rs.getInt("NumberOfToilet");
                    boolean soldDTO = rs.getBoolean("Sold");
                    String categoryDTO = rs.getString("Category");
                    String provinceDTO = rs.getString("Province");
                    String ownerDTO = rs.getString("Owner");
                    String[] strImages = rs.getString("Images").split(" ");
                    ArrayList<String> images = new ArrayList<>();
                    for (int i = 0; i < strImages.length; i++) {
                        images.add(strImages[i]);
                    }
                    PropertyDTO proDTO = new PropertyDTO(propertyIDDTO, addressDTO, salePriceDTO, squareDTO, interiorDTO, numberOfRoomDTO, numberOfToiletDTO, soldDTO, categoryDTO, provinceDTO, ownerDTO, images);
                    list.add(proDTO);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }

    public PropertyDTO getInfoForShowDetails(int propertyID) throws SQLException {
        PropertyDTO propertyDTO = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Address, SalePrice, Square, Interior, "
                    + "Description, NumberOfRoom, NumberOfToilet, Sold, Images, "
                    + "CategoryID, ProvinceID, OwnerID FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String address = rs.getString("Address");
                double salePrice = rs.getDouble("SalePrice");
                double square = rs.getDouble("Square");
                boolean interior = rs.getBoolean("Interior");
                String description = rs.getString("Description");
                int numberOfRoom = rs.getInt("NumberOfRoom");
                int numberOfToilet = rs.getInt("NumberOfToilet");
                boolean sold = rs.getBoolean("Sold");

                String[] strImages = rs.getString("Images").split(" ");
                ArrayList<String> images = new ArrayList<>();
                for (int i = 0; i < strImages.length; i++) {
                    images.add(strImages[i]);
                }
                int categoryID = rs.getInt("CategoryID");
                CategoryDAO cateDAO = new CategoryDAO();
                String category = cateDAO.getTypeCategoryByID(categoryID);
                int provinceID = rs.getInt("ProvinceID");
                ProvinceDAO provinceDAO = new ProvinceDAO();
                String province = provinceDAO.getProvinceNameByID(provinceID);
                int ownerID = rs.getInt("OwnerID");
                OwnerDAO ownerDAO = new OwnerDAO();
                String owner = ownerDAO.getOwnerNameByID(ownerID);

                propertyDTO = new PropertyDTO(propertyID, address, salePrice, square, interior, description, numberOfRoom, numberOfToilet, sold, images, category, province, owner);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return propertyDTO;
    }

    public boolean insertNewProperty(PropertyDTO dto) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "INSERT INTO Property(Address, SalePrice, Square, Interior, "
                    + "Description, NumberOfRoom, NumberOfToilet, Sold, Images, "
                    + "CategoryID, ProvinceID, OwnerID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getAddress());
            ps.setDouble(2, dto.getSalePrice());
            ps.setDouble(3, dto.getSquare());
            ps.setBoolean(4, dto.isInterior());
            ps.setString(5, dto.getDescription());
            ps.setInt(6, dto.getNumberOfRoom());
            ps.setInt(7, dto.getNumberOfToilet());
            ps.setBoolean(8, false);
            ps.setString(9, dto.getImages().get(0));
            ps.setString(10, dto.getCategory());
            ps.setString(11, dto.getProvince());

            OwnerDAO ownerDAO = new OwnerDAO();
            int ownerID = ownerDAO.getOwnerIDByName(dto.getOwner());
            ps.setInt(12, ownerID);

            result = (ps.executeUpdate() > 0);
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateProperty(PropertyDTO dto) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE Property SET Address = ?, SalePrice = ?, Square = ?, "
                        + "Interior = ?, Description = ?, NumberOfRoom = ?, NumberOfToilet = ?, "
                        + "Images = ?, CategoryID = ?, ProvinceID = ?, OwnerID = ? "
                        + "WHERE PropertyID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, dto.getAddress());
                ps.setDouble(2, dto.getSalePrice());
                ps.setDouble(3, dto.getSquare());
                ps.setBoolean(4, dto.isInterior());
                ps.setString(5, dto.getDescription());
                ps.setInt(6, dto.getNumberOfRoom());
                ps.setInt(7, dto.getNumberOfToilet());
                ps.setString(8, dto.getImages().get(0));
                ps.setString(9, dto.getCategory());
                ps.setString(10, dto.getProvince());

                OwnerDAO ownerDAO = new OwnerDAO();
                int ownerID = ownerDAO.getOwnerIDByName(dto.getOwner());
                ps.setInt(11, ownerID);
                ps.setInt(12, dto.getPropertyID());

                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteProperty(int propertyID) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "UPDATE Property SET Sold = 1 WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            result = (ps.executeUpdate() > 0);
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public double getHighestSquare() throws SQLException {
        double result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT DISTINCT Square FROM Property "
                    + "WHERE Square >=ALL (SELECT Square FROM Property)";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDouble("Square");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public double getHighestPrice() throws SQLException {
        double result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT DISTINCT SalePrice FROM Property "
                    + "WHERE SalePrice >=ALL (SELECT SalePrice FROM Property)";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDouble("SalePrice");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getCategoryID(int propertyID) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT CategoryID FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("CategoryID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getPropertyAddress(int propertyID) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT Address FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("Address");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getyProvinceID(int propertyID) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT ProvinceID FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("ProvinceID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getPropertyDescription(int propertyID) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT Description FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("Description");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public double getPropertyPrice(int propertyID) throws SQLException {
        double result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT SalePrice FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDouble("SalePrice");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public ArrayList<String> getImagesUrl(int propertyID) throws SQLException {
        ArrayList<String> images = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT Images FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String[] strImages = rs.getString("Images").split(" ");
                if (images == null) {
                    images = new ArrayList<>();
                }
                for (int i = 0; i < strImages.length; i++) {
                    images.add(strImages[i]);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return images;
    }

    public boolean checkAvailable(int propertyID) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "SElECT Sold FROM Property "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyID);
            rs = ps.executeQuery();
            if (rs.next()) {
                boolean sold = rs.getBoolean("Sold");
                if (!sold) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setSoldForProperty(int propertyID) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "UPDATE Property SET Sold = ? "
                    + "WHERE PropertyID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, propertyID);
            result = (ps.executeUpdate() > 0);
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
