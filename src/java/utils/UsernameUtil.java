/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

public class UsernameUtil {
    public static boolean checkUsername(String s){
	for(char c : s.toCharArray()){
	    if(!(Character.isAlphabetic(c) || Character.isDigit(c))){
		return false;
	    }
	}
	return true;
    }
}
