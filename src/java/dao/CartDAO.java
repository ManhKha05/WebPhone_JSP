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
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Product;

public class CartDAO {
    public static Connection getConnection(){
	Connection cnn = null;
	try{
	    Class.forName(DBConfig.driver);
	    cnn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
	    System.out.println("cartDAO Connect Successful");
	}catch(Exception ex){
	    ex.printStackTrace();
	}
	return cnn;
    }
    public static int existInCart(int product_id, int user_id){
	try(Connection c = getConnection()){
	    String sql = String.format("SELECT * FROM cart c WHERE c.product_id = %d AND c.user_id = %d", product_id, user_id);
	    System.out.println(sql);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    if(rs.next()){
		return rs.getInt("quantity");
	    }
	    else{
		return 0;
	    }
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return 0;
    }
    public static void addToCart(int product_id, int user_id){
	try(Connection c = getConnection()){
	    int oldQuantity = existInCart(product_id, user_id);
	    String sql = "";
	    if(oldQuantity == 0){
		sql = String.format("INSERT INTO cart(product_id, user_id, quantity) VALUE(%d, %d, %d)", product_id, user_id, 1);
	    }
	    else{
		sql = String.format("UPDATE cart c SET quantity = %d WHERE c.product_id = %d AND c.user_id = %d", oldQuantity + 1, product_id, user_id);
	    }
	    System.out.println(sql);
	    PreparedStatement ps = c.prepareStatement(sql);
	    int tmp = ps.executeUpdate();
	    
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
    }
    public static ArrayList<CartItem> getCart(int user_id){
	try(Connection c = getConnection()){
	    String sql = String.format("SELECT * FROM cart c WHERE c.user_id = %d", user_id);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    ArrayList<CartItem> items = new ArrayList<>();
	    System.out.println(sql);
	    while(rs.next()){
		Product p = ProductDAO.getProductById(rs.getString("product_id"));
		items.add(new CartItem(rs.getInt("product_id"), p.getImages().get(0), p.getName(), rs.getInt("quantity"), p.getPromo_price() * rs.getInt("quantity")));
	    }
	    return items;
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static void removeFromCart(int product_id, int user_id){
	try(Connection c = getConnection()){
	    String sql = String.format("DELETE FROM cart c WHERE c.product_id = %d AND c.user_id = %d", product_id, user_id);
	    PreparedStatement ps = c.prepareStatement(sql);
	    int tmp = ps.executeUpdate();
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
    }
    public static void removeCart(int user_id){
	try(Connection c = getConnection()){
	    String sql = String.format("DELETE FROM cart c WHERE c.user_id = %d", user_id);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ps.executeUpdate();
	    System.out.println(sql);
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
    }
}
