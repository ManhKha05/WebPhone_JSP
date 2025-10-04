/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import model.CartItem;

/**
 *
 * @author Admin
 */
public class OrderDAO {
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
    
    public static void createOrderWithDetails(int userId, String receiverName, String phoneNumber, String address, String note, int totalPrice, List<CartItem> items){
	try(Connection c = getConnection()){
	    String sql = String.format("insert into orders(user_id, receiver_name, phone_number, ship_address, note, total_price) value(%d, '%s', '%s', '%s', '%s', %d)", 
					userId, receiverName, phoneNumber, address, note, totalPrice);
	    PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    System.out.println(sql);
	    int tmp = ps.executeUpdate();
	    int orderId = -1;
	    try(ResultSet rs = ps.getGeneratedKeys()){
		if(rs.next()){
		    orderId = rs.getInt(1);
		}
	    }
	    sql = "insert into order_details(order_id, product_id, quantity, price) value(?, ?, ?, ?)";
	    for(CartItem item : items){
		ps = c.prepareStatement(sql);
		ps.setInt(1, orderId);
		ps.setInt(2, item.getProduct_id());
		ps.setInt(3, item.getQuantity());
		ps.setInt(4, item.getPrice());
		
		ps.executeUpdate();
	    }
	}catch(Exception ex){
	    ex.printStackTrace();
	}
    }
}
