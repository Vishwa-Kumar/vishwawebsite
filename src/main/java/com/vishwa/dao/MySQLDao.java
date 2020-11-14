package com.vishwa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.vishwa.model.ClientDetails;
import com.vishwa.model.Result;


public class MySQLDao {
	
	
	
	
	public int fetchVisitorCount()
	{
		Connection conn= DBConnection.getInstance();
		Result result=new Result();
		System.out.println("calling db");
		String sqlSelectAllPersons = "select idvisitor from visitor order by idvisitor desc limit 1;";
		int count=-1;
		try {
			System.out.println("conn  "+conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
			ResultSet rs = ps.executeQuery();
					while (rs.next()) 
					{ 
						 count = rs.getInt(1); 
					}
		      
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
        	result.setRes(false);
        	result.setErrorMsg(e.getLocalizedMessage());;
			
		}
		return count;
	}
	
	public Result SaveVisitor(ClientDetails visitor,int visitorId)
	{
		Connection conn= DBConnection.getInstance();
		
		Result result=new Result();
		String sqlSelectAllPersons = "INSERT INTO `vishwaWebsite`.`visitor`  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?);";
		try {
			
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
			ps.setInt(1, visitorId);
			ps.setString(2, visitor.getIp());
			ps.setString(3, visitor.getCountry());
			ps.setString(4, visitor.getCountryCode());
			ps.setString(5, visitor.getRegion());
			ps.setString(6, visitor.getRegionName());
			ps.setString(7, visitor.getCity());
			ps.setString(8, visitor.getZip());
			ps.setString(9, visitor.getLat());
			ps.setString(10, visitor.getLon());
			ps.setString(11, visitor.getTimezone());
			ps.setString(12, visitor.getIsp());
			ps.setString(13, visitor.getOrg());
			ps.setString(14, visitor.getAs());
			ps.setString(15, visitor.getQuery());
			ps.setString(16, visitor.getVisitorId());
			int rs = ps.executeUpdate();
			 if(rs==1)
		        {
		        	result.setErrorCode(0);
		        	result.setRes(true);
		        	result.setErrorMsg("success");;
		        }
		        System.out.println("rs "+rs);
		        
		        conn.close();
		        conn=null;
		      
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
        	result.setRes(false);
        	result.setErrorMsg(e.getLocalizedMessage());;
			
		}
		
		return result;
	}
	
	
	
	public Result addSubscriberToDB(String name, String email)
	{
		Connection conn= DBConnection.getInstance();
		Result result=new Result();
		System.out.println("calling db");
		String sqlSelectAllPersons = "INSERT INTO `vishwaWebsite`.`maduWeddingSubscriber`  VALUES (?, ?, ?)";
		try {
			System.out.println("conn  "+conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
			ps.setString(1, name+email);
			ps.setString(2, name);
			ps.setString(3, email);
			
	        int rs = ps.executeUpdate();
	        if(rs==1)
	        {
	        	result.setErrorCode(0);
	        	result.setRes(true);
	        	result.setErrorMsg("success");;
	        }
	        System.out.println("rs "+rs);
		      
		}catch(SQLIntegrityConstraintViolationException sicv)
		{
				sicv.printStackTrace();
	        	result.setErrorCode(sicv.getErrorCode());
	        	result.setRes(false);
	        	result.setErrorMsg(sicv.getLocalizedMessage());
	        
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
        	result.setRes(false);
        	result.setErrorMsg(e.getLocalizedMessage());;
			
		}
		return result;
	}
	
	/*
	 * public List<GuestObserver> fetchSubscriberToDB() { Connection conn=
	 * DBConnection.getInstance(); // List<GuestObserver> obsList=null;
	 * 
	 * System.out.println("calling db"); String sqlSelectAllPersons =
	 * "Select * from `vishwaWebsite`.`maduWeddingSubscriber`"; //EventBroadCaster s
	 * = new EventBroadCaster();
	 * 
	 * try { System.out.println("conn  "+conn); PreparedStatement ps =
	 * conn.prepareStatement(sqlSelectAllPersons); ResultSet rs = ps.executeQuery();
	 * //obsList=new ArrayList<GuestObserver>();
	 * 
	 * while (rs.next()) { String id = rs.getString("subscriberId"); String name =
	 * rs.getString("name"); String email = rs.getString("email"); //obsList.add(
	 * new GuestObserver(s, name, email));
	 * 
	 * System.out.println("name "+ name+" email "+email); // do something with the
	 * extracted data... }
	 * 
	 * }
	 * 
	 * catch (SQLException e) { e.printStackTrace();
	 * 
	 * } return obsList; }
	 */

}
