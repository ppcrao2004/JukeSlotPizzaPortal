package com.jukeslot.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import com.jukeslot.web.model.*;
import com.jukeslot.web.service.GenericRestClient;
import com.jukeslot.web.service.RequestDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
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

	@RequestMapping(value = "/template/site", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public TemplateSiteListResponse getTemplateListSite() {
        RestTemplate restTemplate = new RestTemplate();
        TemplateSiteListResponse templateSiteListResponse = restTemplate.getForObject("http://104.239.141.95:8081/api/template/list/Jukeslot-USA-Northeast-NJ-SITE_1", TemplateSiteListResponse.class);
        log.info("==== RESTful API Response Template Site START =======");
        log.info(templateSiteListResponse.toString());
        log.info("==== RESTful API Response Template Site END =======");
        return templateSiteListResponse;
    }

	@RequestMapping(value = "/template/site/configuration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
	public SiteConfigResponse getTemplateSiteConfig() throws  Exception{
        log.info("==== RESTful API Response Template Site Configuration START =======");
        SiteConfigResponse siteConfigurationRes= new GenericRestClient<String, SiteConfigResponse>().execute(
                new RequestDetails("http://104.239.141.95:8081/api/template/site_configuration/Jukeslot-USA-Northeast-NJ-SITE_1", HttpMethod.GET), " ", SiteConfigResponse.class);
        log.info(siteConfigurationRes.toString());
		log.info("==== RESTful API Response Template Site Configuration END =======");
		return siteConfigurationRes;
	}

    @RequestMapping(value = "/template/homepage", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public HomePageResp getTemplateHomepage() throws  Exception{
        log.info("==== RESTful API Response Template Homepage START =======");
        HomePageResp homePageResp= new GenericRestClient<String, HomePageResp>().execute(
                new RequestDetails("http://104.239.141.95:8081/api/template/home_page/Jukeslot-USA-Northeast-NJ-SITE_1", HttpMethod.GET), " ", HomePageResp.class);
        log.info(homePageResp.toString());
        log.info("==== RESTful API Response Template Homepage END =======");
        return homePageResp;
    }

    @RequestMapping(value = "/template/companyconfiguration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public CompanyConfigurationResponse getCompanyConfiguration() throws  Exception{
        log.info("==== RESTful API Response Template company configuration START =======");
        CompanyConfigurationResponse companyConfigurationResponse= new GenericRestClient<String, CompanyConfigurationResponse>().execute(
                new RequestDetails("http://104.239.141.95:8081/api/template/company_configuration/Jukeslot", HttpMethod.GET), " ", CompanyConfigurationResponse.class);
        log.info(companyConfigurationResponse.toString());
        log.info("==== RESTful API Response Template company configuration END =======");
        return companyConfigurationResponse;
    }


    @RequestMapping(value = "/template/menu/list", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public MenuResp getMenuList() throws  Exception{
        log.info("==== RESTful API Response Template Menu List START =======");
        MenuResp menuResponse= new GenericRestClient<String, MenuResp>().execute(
                new RequestDetails("http://104.239.141.95:8081/api/template/menu/list/Jukeslot-USA-Northeast-NJ-SITE_1", HttpMethod.GET), " ", MenuResp.class);
        log.info(menuResponse.toString());
        log.info("==== RESTful API Response Template Menu List END =======");
        return menuResponse;
    }
}
