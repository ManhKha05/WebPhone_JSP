/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class CartItem {
    private int product_id;
    private String img_url;
    private String name;
    private int price;
    private int quantity;

    public CartItem(int product_id, String img_url, String name, int quantity, int price) {
	this.product_id = product_id;
	this.img_url = img_url;
	this.name = name;
	this.quantity = quantity;
	this.price = price;
    }

    public int getProduct_id() {
	return product_id;
    }

    public void setProduct_id(int product_id) {
	this.product_id = product_id;
    }

    public String getImg_url() {
	return img_url;
    }

    public void setImg_url(String img_url) {
	this.img_url = img_url;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public int getQuantity() {
	return quantity;
    }

    public void setQuantity(int quantity) {
	this.quantity = quantity;
    }

    public int getPrice() {
	return price;
    }

    public void setPrice(int price) {
	this.price = price;
    }
    
}
