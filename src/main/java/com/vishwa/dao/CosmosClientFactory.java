package com.vishwa.dao;

import com.azure.cosmos.ConnectionPolicy;
import com.azure.cosmos.ConsistencyLevel;
import com.azure.cosmos.CosmosClient;
import com.azure.cosmos.CosmosClientBuilder;

public class CosmosClientFactory {
    private static final String HOST = "https://vishwatest.documents.azure.com:443/";
    private static final String MASTER_KEY = "NBn2UPPmZT1DrJ4SUabD154uIHmxLq7Hm8b9VsGTwvF51W4kaxP1ZpKylNNhPp2bQZ6YBjAVkshGxI5iT3iu8Q==";

    private static CosmosClient cosmosClient = new CosmosClientBuilder()
            .setEndpoint(HOST)
            .setKey(MASTER_KEY)
            .setConnectionPolicy(ConnectionPolicy.getDefaultPolicy())
            .setConsistencyLevel(ConsistencyLevel.EVENTUAL)
            .buildClient();

    public static CosmosClient getCosmosClient() {
        return cosmosClient;
    }

}
