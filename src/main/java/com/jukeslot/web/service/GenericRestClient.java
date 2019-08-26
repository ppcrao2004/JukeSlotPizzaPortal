package com.jukeslot.web.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;

public class GenericRestClient<T, V> {

    private RestTemplate restTemplate = new RestTemplate();

    public V execute(RequestDetails requestDetails, T data, Class<V> genericClass) throws ResourceAccessException, Exception {

        restTemplate.setErrorHandler(getErrorHandler());
        HttpHeaders headers = new HttpHeaders();

        HttpEntity<T> entity = new HttpEntity<T>(data, headers);
        ResponseEntity<V> response = restTemplate.exchange(requestDetails.getUrl(), requestDetails.getRequestType(),
                entity, genericClass);
        return response.getBody();
    }

    private ResponseErrorHandler getErrorHandler(){
        return new ResponseErrorHandler() {
        @Override
        public boolean hasError(ClientHttpResponse response) throws IOException {

            if (response.getStatusCode() != HttpStatus.OK) {
                System.out.println(response.getStatusText());
            }
            return response.getStatusCode() == HttpStatus.OK ? false : true;
        }

        @Override
        public void handleError(ClientHttpResponse response) throws IOException {
            // TODO Auto-generated method stub

        }
    };
    }

}
