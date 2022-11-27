/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tea;

/**
 *
 * @author DELL
 */
public class TeaDTO {
    private String productID;
    private String name;
    private double price;
    private int quantity;
    private String categoryID;
    private String productIMG;
    private String detail;
    
    public TeaDTO() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.categoryID = "";
        this.productIMG = "";
        this.detail = "";
    }

    public TeaDTO(String productID, String name, double price, int quantity, String categoryID, String productIMG, String detail) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.productIMG = productIMG;
        this.detail = detail;
    }

    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductIMG() {
        return productIMG;
    }

    public void setProductIMG(String productIMG) {
        this.productIMG = productIMG;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "TeaDTO{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", categoryID=" + categoryID + ", productIMG=" + productIMG + ", detail=" + detail + '}';
    }
    
    
}
