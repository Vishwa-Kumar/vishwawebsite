package com.vishwa.dao;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.vishwa.model.ClientDetails;

public class MockDao implements TodoDao{
	 private final Map<String, ClientDetails> todoItemMap;
	 
	 public MockDao()
	 {
		 todoItemMap=new HashMap<String, ClientDetails>();
	 }

	@Override
	public List<ClientDetails> readTodoItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClientDetails createTodoItem(ClientDetails clientDetails) {
		if (StringUtils.isEmpty(clientDetails.getId())) {
			clientDetails.setId(generateId());
        }
        todoItemMap.put(clientDetails.getId(), clientDetails);
        return clientDetails;
		
	}

	@Override
	public ClientDetails readTodoItem(String id) {
		  return todoItemMap.get(id);
	}

	@Override
	public ClientDetails updateTodoItem(String id, boolean isComplete) {
		//todoItemMap.get(id).setComplete(isComplete);
        return todoItemMap.get(id);
	}

	@Override
	public boolean deleteTodoItem(String id) {
		 todoItemMap.remove(id);
	        return true;
	}
	
	private String generateId() {
        return new Integer(todoItemMap.size()).toString();
    }

}
