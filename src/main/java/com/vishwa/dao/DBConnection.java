package com.vishwa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static Connection single_Db_instance = null;
	public static int dbConnectionObjectCount = 0;

	// private constructor restricted to this class itself
	private DBConnection() {

	}

	// static method to create instance of Singleton class
	public static Connection getInstance()  {
		
		String connectionUrl = "jdbc:mysql://vishwawebsitedb.ci2imxqem4ip.us-east-2.rds.amazonaws.com:3306/vishwaWebsite?serverTimezone=UTC";
		if (single_Db_instance == null) {

			try

			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				single_Db_instance = DriverManager.getConnection(connectionUrl, "vishwa", "vishwakumardeepak");
				dbConnectionObjectCount++;
				System.out.println("connectin object count::" + dbConnectionObjectCount + " conn  "
						+ single_Db_instance.toString());
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					single_Db_instance.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				// handle the exception
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return single_Db_instance;
	}

}
