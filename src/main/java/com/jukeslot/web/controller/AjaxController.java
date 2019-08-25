package com.jukeslot.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.xml.ws.ProtocolException;

import com.jukeslot.web.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;
import com.jukeslot.web.jsonview.Views;
import org.springframework.web.client.RestTemplate;

@RestController
public class AjaxController {

	List<User> users;
	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);

	// @ResponseBody, not necessary, since class is annotated with @RestController
	// @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
	// @JsonView(Views.Public.class) - Optional, limited the json data display to client.
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/search/api/getSearchResult")
	public AjaxResponseBody getSearchResultViaAjax(@RequestBody SearchCriteria search) {

		AjaxResponseBody result = new AjaxResponseBody();

		if (isValidSearchCriteria(search)) {
			List<User> users = findByUserNameOrEmail(search.getUsername(), search.getEmail());
//			try {
//
//				URL url = new URL("http://104.239.141.95:8081/api/template/list/Jukeslot-USA-Northeast-NJ-SITE_1");
//				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//				conn.setRequestMethod("GET");
//				conn.setRequestProperty("Accept", "application/json");
//
//				if (conn.getResponseCode() != 200) {
//					throw new RuntimeException("Failed : HTTP error code : "
//							+ conn.getResponseCode());
//				}
//
//				BufferedReader br = new BufferedReader(new InputStreamReader(
//						(conn.getInputStream())));
//
//				String output;
//				System.out.println("Output from Server .... \n");
//				while ((output = br.readLine()) != null) {
//					System.out.println(output);
//				}
//
//				conn.disconnect();
//
//			} catch (MalformedURLException e) {
//
//				e.printStackTrace();
//
//			} catch (IOException e) {
//
//				e.printStackTrace();
//
//			} catch (ProtocolException e) {
//				e.printStackTrace();
//			}

			RestTemplate restTemplate = new RestTemplate();
			RestResponse restResponse = restTemplate.getForObject( "http://104.239.141.95:8081/api/template/list/Jukeslot-USA-Northeast-NJ-SITE_1", RestResponse.class);
			log.info("==== RESTful API Response using Spring RESTTemplate START =======");
			log.info(restResponse.toString());
			log.info("==== RESTful API Response using Spring RESTTemplate END =======");

			if (users.size() > 0) {
				result.setCode("200");
				result.setMsg("");
				result.setResult(users);
			} else {
				result.setCode("204");
				result.setMsg("No user!");
			}

		} else {
			result.setCode("400");
			result.setMsg("Search criteria is empty!");
		}

		//AjaxResponseBody will be converted into json format and send back to client.
		return result;

	}

    @RequestMapping(value = "/template/site", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public RestResponse getSearchResultViaAjax() {
        RestTemplate restTemplate = new RestTemplate();
        RestResponse restResponse = restTemplate.getForObject("http://104.239.141.95:8081/api/template/list/Jukeslot-USA-Northeast-NJ-SITE_1", RestResponse.class);
        log.info("==== RESTful API Response using Spring RESTTemplate START =======");
        log.info(restResponse.toString());
        log.info("==== RESTful API Response using Spring RESTTemplate END =======");
        return restResponse;
    }
	private boolean isValidSearchCriteria(SearchCriteria search) {

		boolean valid = true;

		if (search == null) {
			valid = false;
		}

		if ((StringUtils.isEmpty(search.getUsername())) && (StringUtils.isEmpty(search.getEmail()))) {
			valid = false;
		}

		return valid;
	}

	// Init some users for testing
	@PostConstruct
	private void iniDataForTesting() {
		users = new ArrayList<User>();

		User user1 = new User("mkyong", "pass123", "mkyong@yahoo.com", "012-1234567", "address 123");
		User user2 = new User("yflow", "pass456", "yflow@yahoo.com", "016-7654321", "address 456");
		User user3 = new User("laplap", "pass789", "mkyong@yahoo.com", "012-111111", "address 789");
		users.add(user1);
		users.add(user2);
		users.add(user3);

	}

	// Simulate the search function
	private List<User> findByUserNameOrEmail(String username, String email) {

		List<User> result = new ArrayList<User>();

		for (User user : users) {

			if ((!StringUtils.isEmpty(username)) && (!StringUtils.isEmpty(email))) {

				if (username.equals(user.getUsername()) && email.equals(user.getEmail())) {
					result.add(user);
					continue;
				} else {
					continue;
				}

			}
			if (!StringUtils.isEmpty(username)) {
				if (username.equals(user.getUsername())) {
					result.add(user);
					continue;
				}
			}

			if (!StringUtils.isEmpty(email)) {
				if (email.equals(user.getEmail())) {
					result.add(user);
					continue;
				}
			}

		}

		return result;

	}
}
