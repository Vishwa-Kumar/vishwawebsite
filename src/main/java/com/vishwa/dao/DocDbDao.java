package com.vishwa.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.azure.cosmos.ConnectionPolicy;
import com.azure.cosmos.ConsistencyLevel;
import com.azure.cosmos.CosmosClient;
import com.azure.cosmos.CosmosClientBuilder;
import com.azure.cosmos.CosmosClientException;
import com.azure.cosmos.CosmosContainer;
import com.azure.cosmos.CosmosDatabase;
import com.azure.cosmos.implementation.Utils;
import com.azure.cosmos.models.CosmosContainerProperties;
import com.azure.cosmos.models.CosmosItemRequestOptions;
import com.azure.cosmos.models.CosmosItemResponse;
import com.azure.cosmos.models.FeedOptions;
import com.azure.cosmos.models.FeedResponse;
import com.azure.cosmos.models.PartitionKey;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import com.vishwa.model.ClientDetails;
public class DocDbDao implements TodoDao {

	private static final String DATABASE_ID = "vishwaWebsite";
	private static final String CONTAINER_ID = "visitorClientDetails";
	// We'll use Gson for POJO <=> JSON serialization for this example.
	private static Gson gson = new Gson();
	private static CosmosClient cosmosClient = CosmosClientFactory.getCosmosClient();
	// The Cosmos DB database
	private static CosmosDatabase cosmosDatabase = null;

	// The Cosmos DB container
	private static CosmosContainer cosmosContainer = null;

	// For POJO/JsonNode interconversion
	private static final ObjectMapper OBJECT_MAPPER = Utils.getSimpleObjectMapper();

	@Override
	public List<ClientDetails> readTodoItems() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClientDetails createTodoItem(ClientDetails clientDetails) {
		// Serialize the TodoItem as a JSON Document.
		System.out.println(" in DAO createTodoItem" + clientDetails);
		JsonNode clientDetailsJson = OBJECT_MAPPER.valueToTree(clientDetails);
		System.out.println("clientDetailsJson"+ clientDetailsJson.toPrettyString());
		
		
		//((ObjectNode) clientDetailsJson).put("id", new java.util.Date().toString().toString());

		System.out.println("clientDetailsJson" + clientDetailsJson.toString());
		

		try {
			// Persist the document using the DocumentClient.
			//clientDetailsJson = getContainerCreateResourcesIfNotExist().upsertItem(clientDetailsJson).getResource();
			 CosmosItemRequestOptions cosmosItemRequestOptions = new CosmosItemRequestOptions();
			 
			 CosmosItemResponse<ClientDetails> item = getContainerCreateResourcesIfNotExist().createItem( clientDetails, new PartitionKey(clientDetails.getVisitorId()), cosmosItemRequestOptions);
			 
			 System.out.println("CosmosItemResponse"+item.getResponseHeaders());
		} catch (CosmosClientException e) {
			System.out.println("Error creating TODO item.\n");
			e.printStackTrace();
			return null;
		}

		try {

			return OBJECT_MAPPER.treeToValue(clientDetailsJson, ClientDetails.class);
			// return todoItem;
		} catch (Exception e) {
			System.out.println("Error deserializing created TODO item.\n");
			e.printStackTrace();

			return null;
		}

	}

	@Override
	public ClientDetails readTodoItem(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClientDetails updateTodoItem(String id, boolean isComplete) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteTodoItem(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	private CosmosContainer getContainerCreateResourcesIfNotExist() {
		try {
			if (cosmosDatabase == null) {
				cosmosDatabase = cosmosClient.createDatabaseIfNotExists(DATABASE_ID).getDatabase();
			}
		} catch (CosmosClientException e) {
			// TODO: Something has gone terribly wrong - the app wasn't
			// able to query or create the collection.
			// Verify your connection, endpoint, and key.
			System.out
					.println("Something has gone terribly wrong - " + "the app wasn't able to create the Database.\n");
			e.printStackTrace();
		}
		try {
			if (cosmosContainer == null) {
				CosmosContainerProperties properties = new CosmosContainerProperties(CONTAINER_ID, "id");
				cosmosContainer = cosmosDatabase.createContainerIfNotExists(properties).getContainer();
				System.out.println("cosmosContainer" + cosmosContainer.toString());
			}

		} catch (CosmosClientException e) {
			// TODO: Something has gone terribly wrong - the app wasn't
			// able to query or create the collection.
			// Verify your connection, endpoint, and key.
			System.out
					.println("Something has gone terribly wrong - " + "the app wasn't able to create the Container.\n");
			e.printStackTrace();
		}
		System.out.println("container extracted successfully");
		return cosmosContainer;
	}

}
