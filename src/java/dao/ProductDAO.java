/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    public static Connection getConnection(){
	Connection cnn = null;
	try{
	    Class.forName(DBConfig.driver);
	    cnn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
	    System.out.println("Connect Successful");
	}catch(Exception ex){
	    ex.printStackTrace();
	}
	return cnn;
    }
    public static ArrayList<Product> getProductList(String brandId, String sortFeild, String sortOrder, int page, int pageSize){
	if(brandId == null){
	    brandId = "1 = 1";
	}
	else{
	    brandId = "p.brand_id = " + brandId;
	}
	
	if(sortFeild == null){
	    sortFeild = "p.id";
	    sortOrder = "asc";
	}
	if(sortFeild.equals("sale-rate")){
	    sortFeild = "sale_rate";
	    sortOrder = "DESC";
	}
	
	int productStart = (page - 1) * pageSize;
	try(Connection c = getConnection()){
	    String sql = String.format("SELECT *, promo_price AS price, 1.0 * (original_price - promo_price) / original_price * 100 AS sale_rate FROM products p "
				     + "JOIN product_images i "
				     + "ON p.id = i.product_id "
				     + "WHERE i.is_main = 1 AND %s "
				     + "ORDER BY %s %s "
				     + "LIMIT %d, %d", brandId, sortFeild, sortOrder, productStart, pageSize);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    ArrayList<Product> list = new ArrayList<>();
	    while(rs.next()){
		ArrayList<String> images = new ArrayList<>();
		images.add(rs.getString("image_url"));
		Product product = new Product(rs.getInt("id"), rs.getString("name"),
			rs.getInt("promo_price"), rs.getInt("original_price"), images);
		list.add(product);
	    }
	    return list;
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static Product getProductById(String id){
	try(Connection c = getConnection()){
	    String sql = "SELECT * FROM products p WHERE p.id = " + id;
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next()){
		ArrayList<String> images = getImagesById(rs.getString("id"));
		Map<String, String> specs = getSpecById(rs.getString("id"));
		Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("promo_price") , images, specs);
		return product;
	    }
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static Map<String, String> getSpecById(String id){
	try(Connection c = getConnection()){
	    String sql = "SELECT * FROM product_spec p WHERE p.product_id = " + id;
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    Map<String, String> res = new LinkedHashMap<>();
	    while(rs.next()){
		res.put(rs.getString("spec_name"), rs.getString("spec_value"));
	    }
	    return res;
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static int getTotalProducts(String brandId){
	String filter = brandId != null ? "WHERE p.brand_id = " + brandId : "";
	String sql = "SELECT COUNT(*) AS sl FROM products p " + filter;
	try(Connection c = getConnection()){
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    if(rs.next()){
		return rs.getInt("sl");
	    }
	    
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return 0;
    }
    public static ArrayList<String> getImagesById(String id){
	String sql = "SELECT * FROM product_images p WHERE p.product_id = " + id;
	try(Connection c = getConnection()){
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    ArrayList<String> res = new ArrayList<>();
	    while(rs.next()){
		res.add(rs.getString("image_url"));
	    }
	    return res;
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
}
