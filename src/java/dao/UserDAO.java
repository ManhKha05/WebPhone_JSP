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
import model.User;

public class UserDAO {
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
    public static User checkLogin(String username, String password){
	try(Connection c = getConnection()){
	    String sql = "SELECT * FROM users u WHERE u.username = ? AND u.password = ?";
	    PreparedStatement ps = c.prepareStatement(sql);
	    ps.setString(1, username);
	    ps.setString(2, password);
	    ResultSet rs = ps.executeQuery();
	    
	    if(rs.next()){
		return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
				rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
				rs.getString("gender"));
	    }
	}
	catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static User findUserByUsername(String username){
	try(Connection c = getConnection()){
	    String sql = String.format("SELECT * FROM users u WHERE u.username = '%s'", username);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    if(rs.next()){
		return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
				rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
				rs.getString("gender"));
	    }
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static User findUserByEmail(String email){
	try(Connection c = getConnection()){
	    String sql = String.format("SELECT * FROM users u WHERE u.email = '%s'", email);
	    PreparedStatement ps = c.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    if(rs.next()){
		return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
				rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
				rs.getString("gender"));
	    }
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return null;
    }
    public static boolean resetPassword(String userId, String password){
	try(Connection c = getConnection()){
	    String sql = String.format("UPDATE users u SET u.password = '%s' WHERE u.id = %s ", password, userId);
	    PreparedStatement ps = c.prepareStatement(sql);
	    int tmp = ps.executeUpdate();
	    if(tmp > 0){
		return true;
	    }
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return false;
    } 
    public static boolean addUser(String firstName, String lastName, String username, String email, String password, String gender){
	try(Connection c = getConnection()){
	    String sql = "INSERT INTO users(first_name, last_name, username, email, password, gender) VALUE(?, ?, ?, ?, ?, ?) ";
	    PreparedStatement ps = c.prepareStatement(sql);
	    ps.setString(1, firstName);
	    ps.setString(2, lastName);
	    ps.setString(3, username);
	    ps.setString(4, email);
	    ps.setString(5, password);
	    ps.setString(6, gender);
	    int tmp = ps.executeUpdate();
	    return tmp > 0;
	}catch(SQLException ex){
	    ex.printStackTrace();
	}
	return false;
    }
}
