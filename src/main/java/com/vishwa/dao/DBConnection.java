package com.vishwa.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vishwa.model.Result;

public class DBConnection {

	private static Connection single_Db_instance = null;
	public static int dbConnectionObjectCount = 0;

	// private constructor restricted to this class itself
	private DBConnection() {

	}

	public boolean pingDB() {
		System.out.println("ping called");
		Connection conn = DBConnection.getInstance();
		Result result = new Result();
		String sqlSelectAllPersons = "SELECT 1 FROM DUAL;";
		int count = -1;
		try {
			System.out.println("conn  " + conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons);
			ResultSet rs = ps.executeQuery();
			System.out.println("waiting for resultset" + rs);
			while (rs.next()) {
				count = rs.getInt(1);
				System.out.println("ping status " + count);
				if (count != 1) {
					return false;
				}
			}

		}

		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
			result.setRes(false);
			result.setErrorMsg(e.getLocalizedMessage());
			;

		}
		return true;
	}

	public boolean closeDBConnection() {

		try {
			single_Db_instance.isValid(3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	// static method to create instance of Singleton class
	public static Connection getInstance() {
		DBConnection dBConnection = new DBConnection();

		// String connectionUrl =
		// "jdbc:mysql://vishwawebsitedb.ci2imxqem4ip.us-east-2.rds.amazonaws.com:3306/vishwaWebsite";
		String connectionUrl = "jdbc:mysql://localhost:3306/vishwablog";
		try

		{

			if (single_Db_instance == null) {

				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					single_Db_instance = DriverManager.getConnection(connectionUrl, "root", "root");
					dbConnectionObjectCount++;
					System.out.println("getInstance::connectin object count::" + dbConnectionObjectCount + " conn  "
							+ single_Db_instance.toString());
				}

			} else {
				if (single_Db_instance.isValid(5)) {
					return single_Db_instance;
				} else {
					single_Db_instance.close();
					single_Db_instance = null;
					Class.forName("com.mysql.cj.jdbc.Driver");
					single_Db_instance = DriverManager.getConnection(connectionUrl, "root", "root");
					dbConnectionObjectCount++;
					System.out.println("getInstance::connectin object count isvalid section::" + dbConnectionObjectCount
							+ " conn  " + single_Db_instance.toString());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return single_Db_instance;

	}

}
