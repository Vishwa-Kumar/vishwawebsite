package com.vishwa.dao;

import java.util.List;

import com.vishwa.model.ClientDetails;



public interface TodoDao {
    /**
     * @return A list of TodoItems
     */
    public List<ClientDetails> readTodoItems();

    /**
     * @param todoItem
     * @return whether the todoItem was persisted.
     */
    public ClientDetails createTodoItem(ClientDetails clientDetails);

    /**
     * @param id
     * @return the TodoItem
     */
    public ClientDetails readTodoItem(String id);

    /**
     * @param id
     * @return the TodoItem
     */
    public ClientDetails updateTodoItem(String id, boolean isComplete);

    /**
     *
     * @param id
     * @return whether the delete was successful.
     */
    public boolean deleteTodoItem(String id);
}