/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class Product {
    private int id;
    private String name;
    private ArrayList<String> images = new ArrayList<>();
    private Map<String, String> specs = new LinkedHashMap<>();
    private int promo_price, original_price, sale_rate;

    public Product(int id, String name, int promo_price, int original_price, ArrayList<String> images) {
	this.id = id;
	this.name = name;
	this.promo_price = promo_price;
	this.original_price = original_price;
	this.sale_rate = (int)(1.0 * (original_price - promo_price) / original_price * 100);
	this.images = images;
    }
    public Product(int id, String name, int promo_price, ArrayList<String> images, Map<String, String> specs){
	this.id = id;
	this.name = name;
	this.promo_price = promo_price;
	this.images = images;
	this.specs = specs;
    }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public int getPromo_price() {
	return promo_price;
    }

    public void setPromo_price(int promo_price) {
	this.promo_price = promo_price;
    }

    public int getOriginal_price() {
	return original_price;
    }

    public void setOriginal_price(int original_price) {
	this.original_price = original_price;
    }

    public int getSale_rate() {
	return sale_rate;
    }

    public void setSale_rate(int sale_rate) {
	this.sale_rate = sale_rate;
    }

    public ArrayList<String> getImages() {
	return images;
    }

    public void setImages(ArrayList<String> images) {
	this.images = images;
    }

    public Map<String, String> getSpecs() {
	return specs;
    }

    public void setSpecs(Map<String, String> specs) {
	this.specs = specs;
    }
    
}
