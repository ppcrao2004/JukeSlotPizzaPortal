package com.jukeslot.web.controller;

import com.jukeslot.web.model.*;
import com.jukeslot.web.service.GenericRestClient;
import com.jukeslot.web.service.RequestDetails;
import com.jukeslot.web.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class AjaxController {
	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);
	@RequestMapping(value = "/template/site", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public TemplateSiteListResponse getTemplateListSite() {
        RestTemplate restTemplate = new RestTemplate();
        TemplateSiteListResponse templateSiteListResponse = restTemplate.getForObject(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_LIST_URL, TemplateSiteListResponse.class);
        log.info("==== RESTful API Response Template Site START =======");
        log.info(templateSiteListResponse.toString());
        log.info("==== RESTful API Response Template Site END =======");
        return templateSiteListResponse;
    }

	@RequestMapping(value = "/template/site/configuration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
	public SiteConfigResponse getTemplateSiteConfig() throws  Exception{
        log.info("==== RESTful API Response Template Site Configuration START =======");
        SiteConfigResponse siteConfigurationRes= new GenericRestClient<String, SiteConfigResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_SITE_CONFIGURATION_URL, HttpMethod.GET), " ", SiteConfigResponse.class);
        log.info(siteConfigurationRes.toString());
		log.info("==== RESTful API Response Template Site Configuration END =======");
		return siteConfigurationRes;
	}

    @RequestMapping(value = "/template/homepage/{siteID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public HomePageResp getTemplateHomepage(@PathVariable String siteID) throws  Exception{
        log.info("==== RESTful API Response Template Homepage START =======");
        HomePageResp homePageResp= new GenericRestClient<String, HomePageResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_HOMEPAGE_URL+siteID, HttpMethod.GET), " ", HomePageResp.class);
        log.info(homePageResp.toString());
        log.info("==== RESTful API Response Template Homepage END =======");
        return homePageResp;
    }

    @RequestMapping(value = "/template/companyconfiguration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public CompanyConfigurationResponse getCompanyConfiguration() throws  Exception{
        log.info("==== RESTful API Response Template company configuration START =======");
        CompanyConfigurationResponse companyConfigurationResponse= new GenericRestClient<String, CompanyConfigurationResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_COMPANY_CONFIGURATION, HttpMethod.GET), " ", CompanyConfigurationResponse.class);
        log.info(companyConfigurationResponse.toString());
        log.info("==== RESTful API Response Template company configuration END =======");
        return companyConfigurationResponse;
    }


    @RequestMapping(value = "/template/menu/list/{siteID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public MenuResp getMenuList(@PathVariable String siteID) throws  Exception{
        log.info("==== RESTful API Response Template Menu List START =======");
        MenuResp menuResponse= new GenericRestClient<String, MenuResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_MENU_LIST_URL+siteID, HttpMethod.GET), " ", MenuResp.class);
        log.info(menuResponse.toString());
        log.info("==== RESTful API Response Template Menu List END =======");
        return menuResponse;
    }
    @RequestMapping(value = "/template/catetory/list", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public CategoryListResp getCategoryList() throws  Exception{
        log.info("==== RESTful API Response Template Category List START =======");
        CategoryListResp categoryListResp= new GenericRestClient<String, CategoryListResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_CATEGORY_LIST_URL, HttpMethod.GET), " ", CategoryListResp.class);
        log.info(categoryListResp.toString());
        log.info("==== RESTful API Response Template Category List END =======");
        return categoryListResp;
    }
}
