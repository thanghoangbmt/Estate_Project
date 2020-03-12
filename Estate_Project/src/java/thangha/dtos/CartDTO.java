/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CartDTO {
    private String customerName;
    private Map<Integer, PropertyDTO> cart;

    public CartDTO() {
    }

    public CartDTO(String customerName, Map<Integer, PropertyDTO> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Map<Integer, PropertyDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, PropertyDTO> cart) {
        this.cart = cart;
    }
    
    public boolean add (PropertyDTO propertyDTO) {
        boolean result = false;
        if (this.cart == null) 
            this.cart = new HashMap<>();
        
        if (!this.cart.containsKey(propertyDTO.getPropertyID())) {
            cart.put(propertyDTO.getPropertyID(), propertyDTO);
            result = true;
        }
        return result;
    }
    
    public void delete(int propertyID) {
        if (this.cart == null) 
            return;
        
        if (this.cart.containsKey(propertyID)) 
            this.cart.remove(propertyID);
    }
    
    public double getTotalPrice() {
        double total = 0;
        for (Map.Entry<Integer, PropertyDTO> entry : cart.entrySet()) {
            double temp = entry.getValue().getSalePrice();
            total = total + temp;
        }
        return total;
    }
}
