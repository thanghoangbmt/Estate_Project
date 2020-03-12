/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class PropertyDTO {

    private int propertyID;
    private String address;
    private double salePrice;
    private double square;
    private boolean interior;
    private String description;
    private int numberOfRoom;
    private int numberOfToilet;
    private boolean sold;
    private ArrayList<String> images;
    private String category;
    private String province;
    private String owner;

    public PropertyDTO() {
    }

    public PropertyDTO(int propertyID) {
        this.propertyID = propertyID;
    }

    public PropertyDTO(int propertyID, String address, double salePrice, double square, String description, int numberOfToilet, ArrayList<String> images, String category, String province) {
        this.propertyID = propertyID;
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.description = description;
        this.numberOfToilet = numberOfToilet;
        this.images = images;
        this.category = category;
        this.province = province;
    }

    public PropertyDTO(int propertyID, String address, double salePrice, double square, boolean interior, String description, int numberOfRoom, int numberOfToilet, boolean sold, String category, String province, String owner) {
        this.propertyID = propertyID;
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.interior = interior;
        this.description = description;
        this.numberOfRoom = numberOfRoom;
        this.numberOfToilet = numberOfToilet;
        this.sold = sold;
        this.category = category;
        this.province = province;
        this.owner = owner;
    }

    public PropertyDTO(int propertyID, String address, double salePrice, double square, boolean interior, String description, int numberOfRoom, int numberOfToilet, boolean sold, ArrayList<String> images, String category, String province, String owner) {
        this.propertyID = propertyID;
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.interior = interior;
        this.description = description;
        this.numberOfRoom = numberOfRoom;
        this.numberOfToilet = numberOfToilet;
        this.sold = sold;
        this.images = images;
        this.category = category;
        this.province = province;
        this.owner = owner;
    }

    public PropertyDTO(int propertyID, String address, double salePrice, double square, boolean interior, int numberOfRoom, int numberOfToilet, boolean sold, String category, String province, String owner) {
        this.propertyID = propertyID;
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.interior = interior;
        this.numberOfRoom = numberOfRoom;
        this.numberOfToilet = numberOfToilet;
        this.sold = sold;
        this.category = category;
        this.province = province;
        this.owner = owner;
    }
    
    public PropertyDTO(int propertyID, String address, double salePrice, double square, boolean interior, int numberOfRoom, int numberOfToilet, boolean sold, String category, String province, String owner, ArrayList<String> images) {
        this.propertyID = propertyID;
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.interior = interior;
        this.numberOfRoom = numberOfRoom;
        this.numberOfToilet = numberOfToilet;
        this.sold = sold;
        this.category = category;
        this.province = province;
        this.owner = owner;
        this.images = images;
    }

    public PropertyDTO(String address, double salePrice, double square, boolean interior, String description, int numberOfRoom, int numberOfToilet, boolean sold, ArrayList<String> images, String category, String province, String owner) {
        this.address = address;
        this.salePrice = salePrice;
        this.square = square;
        this.interior = interior;
        this.description = description;
        this.numberOfRoom = numberOfRoom;
        this.numberOfToilet = numberOfToilet;
        this.sold = sold;
        this.images = images;
        this.category = category;
        this.province = province;
        this.owner = owner;
    }
    
    public int getPropertyID() {
        return propertyID;
    }

    public void setPropertyID(int propertyID) {
        this.propertyID = propertyID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getSquare() {
        return square;
    }

    public void setSquare(double square) {
        this.square = square;
    }

    public boolean isInterior() {
        return interior;
    }

    public void setInterior(boolean interior) {
        this.interior = interior;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }

    public int getNumberOfToilet() {
        return numberOfToilet;
    }

    public void setNumberOfToilet(int numberOfToilet) {
        this.numberOfToilet = numberOfToilet;
    }

    public boolean isSold() {
        return sold;
    }

    public void setSold(boolean sold) {
        this.sold = sold;
    }

    public ArrayList<String> getImages() {
        return images;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
}
