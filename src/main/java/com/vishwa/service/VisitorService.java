package com.vishwa.service;

import com.vishwa.dao.MySQLDao;
import com.vishwa.model.ClientDetails;
import com.vishwa.model.Result;

public class VisitorService {

	
	
	MySQLDao mySQLDao=new MySQLDao();
	int lastVisitorCount=-1;
	public Result saveVisitorDetails(ClientDetails clientDetails)
	{
		Result res=null;
		int id=0;
		if (lastVisitorCount!=-1)
		{
			id=lastVisitorCount+1;
		}
		else
		{
			id=getVisitorCount()+1;
		}
		lastVisitorCount=id;
		res=mySQLDao.SaveVisitor(clientDetails,id);
		System.out.println("visitor saving result::"+res);
		res.setErrorCode(lastVisitorCount);
		return res;
		
	}
	
	
	public int getVisitorCount()
	{
		return mySQLDao.fetchVisitorCount();
		
	}

}
