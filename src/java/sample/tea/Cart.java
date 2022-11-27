/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tea;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class Cart {

    private Map<String, TeaDTO> cart;

    public Cart() {

    }

    public Cart(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }

    public Map<String, TeaDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }

    public boolean add(TeaDTO tea) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }

        if (this.cart.containsKey(tea.getProductID())) {
            int currentQuantity = this.cart.get(tea.getProductID()).getQuantity();
            tea.setQuantity(currentQuantity + tea.getQuantity());
        }
        this.cart.put(tea.getProductID(), tea);
        check = true;
        return check;
    }

    public boolean remove(String productID) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(productID)) {
                this.cart.remove(productID);
                check = true;
            }
        }
        return check;
    }

    public boolean edit(String productID, TeaDTO tea) {
        boolean check = false;
        if (this.cart.containsKey(productID)) {
            this.cart.replace(productID, tea);
            check = true;
        }
        return check;
    }

    public int getSize() {
        int num = 0;
        if (this.cart != null) {
            num = this.cart.size();
        }
        return num;
    }

    public double getTotal() {
        double total = 0;
        for (TeaDTO tea : cart.values()) {
            total += tea.getPrice() * tea.getQuantity();
        }
        return total;
    }

}
