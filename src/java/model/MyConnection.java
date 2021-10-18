/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author User
 */
import java.sql.*; 

public class MyConnection { 

	public static Connection getConnection() 
	{ 

		// As java.sql package classes 
		// contains Checked Exceptions, 
		// we have to surround it with 
		// Try/Catch Block. 
		try { 

			// We have to register the 
			// Driver class present in 
			// com.mysql.jdbc package. 
			DriverManager.registerDriver( 
				new com.mysql.jdbc.Driver()); 

			// To get the connection, 
			// 3 params need to be passed in 
			// DriverManager.getConnection() method. 

			Connection con 
				= DriverManager.getConnection( 
					"jdbc:mysql:// localhost:3306/"
						+ "carrental", 
					"root", "ROOT"); 

			

			return con; 
		} 
		catch (SQLException e) { 

			System.out.println(e.getMessage()); 
		} 
		return null; 
	} 
} 
