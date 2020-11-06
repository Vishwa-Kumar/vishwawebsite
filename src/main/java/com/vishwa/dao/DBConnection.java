package com.vishwa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {

	public static void main(String[] args) {
		DBConnection o=new DBConnection();
		o.getConnection();
	}
	
	
	public void getConnection()
	{
		System.out.println("calling db");
		String sqlSelectAllPersons = "SELECT * FROM visitor";
		String connectionUrl = "jdbc:mysql://vishwawebsitedb.ci2imxqem4ip.us-east-2.rds.amazonaws.com:3306/vishwaWebsite?serverTimezone=UTC";
		 
		try (Connection conn = DriverManager.getConnection(connectionUrl, "vishwa", "vishwakumardeepak"); 
		        PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
		        ResultSet rs = ps.executeQuery()) {
		 
		        while (rs.next()) {
		            long id = rs.getLong("idvisitor");
		            String country = rs.getString("country");
		           
		 System.out.println("id "+ id+" country "+country);
		            // do something with the extracted data...
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		    // handle the exception
		}
	}
}
