package com.jukeslot.web.controller;

import com.jukeslot.web.model.*;
import com.jukeslot.web.model.request.OrderServiceRequest;
import com.jukeslot.web.service.GenericRestClient;
import com.jukeslot.web.service.RequestDetails;
import com.jukeslot.web.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
public class AjaxController {
	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);
	@RequestMapping(value = "/template/site", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public TemplateSiteListResponse getTemplateListSite() {
        RestTemplate restTemplate = new RestTemplate();
        TemplateSiteListResponse templateSiteListResponse = restTemplate.getForObject(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_LIST_URL, TemplateSiteListResponse.class);
        log.info("==== RESTful API Response Template Site START getTemplateListSite=======");
        log.info(templateSiteListResponse.toString());
        log.info("==== RESTful API Response Template Site END getTemplateListSite=======");
        return templateSiteListResponse;
    }

	@RequestMapping(value = "/template/site/configuration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
	public SiteConfigResponse getTemplateSiteConfig() throws  Exception{
        log.info("==== RESTful API Response Template Site Configuration START getTemplateSiteConfig=======");
        SiteConfigResponse siteConfigurationRes= new GenericRestClient<String, SiteConfigResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_SITE_CONFIGURATION_URL, HttpMethod.GET), " ", SiteConfigResponse.class);
        log.info(siteConfigurationRes.toString());
		log.info("==== RESTful API Response Template Site Configuration END getTemplateSiteConfig=======");
		return siteConfigurationRes;
	}

    @RequestMapping(value = "/template/homepage/{siteID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public HomePageResp getTemplateHomepage(@PathVariable String siteID) throws  Exception{
        log.info("==== RESTful API Response Template Homepage START getTemplateHomepage=======");
        HomePageResp homePageResp= new GenericRestClient<String, HomePageResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_HOMEPAGE_URL+siteID, HttpMethod.GET), " ", HomePageResp.class);
        log.info(homePageResp.toString());
        log.info("==== RESTful API Response Template Homepage END getTemplateHomepage=======");
        return homePageResp;
    }

    @RequestMapping(value = "/template/companyconfiguration", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public CompanyConfigurationResponse getCompanyConfiguration() throws  Exception{
        log.info("==== RESTful API Response Template company configuration START getCompanyConfiguration=======");
        CompanyConfigurationResponse companyConfigurationResponse= new GenericRestClient<String, CompanyConfigurationResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_COMPANY_CONFIGURATION, HttpMethod.GET), " ", CompanyConfigurationResponse.class);
        log.info(companyConfigurationResponse.toString());
        log.info("==== RESTful API Response Template company configuration END getCompanyConfiguration=======");
        return companyConfigurationResponse;
    }


    @RequestMapping(value = "/template/menu/list/{siteID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public MenuResp getMenuList(@PathVariable String siteID) throws  Exception{
        log.info("==== RESTful API Response Template Menu List START getMenuList=======");
        MenuResp menuResponse= new GenericRestClient<String, MenuResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_MENU_LIST_URL+siteID, HttpMethod.GET), " ", MenuResp.class);
        log.info(menuResponse.toString());
        log.info("==== RESTful API Response Template Menu List END getMenuList=======");
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
    @RequestMapping(value = "/template/category/list/{menuID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public CategoryListMenuIDResp getCategoryListforMenuID(@PathVariable String menuID) throws  Exception{
        log.info("==== RESTful API Response Template Category List START getCategoryListforMenuID=======");
        CategoryListMenuIDResp categoryListMenuIDResp= new GenericRestClient<String, CategoryListMenuIDResp>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_CATEGORY_LIST_MENUID_URL+menuID, HttpMethod.GET), " ", CategoryListMenuIDResp.class);
        log.info(categoryListMenuIDResp.toString());
        log.info("==== RESTful API Response Template Category List END getCategoryListforMenuID=======");
        return categoryListMenuIDResp;
    }
    @RequestMapping(value = "/template/item/list/{categoryID}", method = RequestMethod.GET, produces = { "application/json" }, consumes = { "application/json" })
    public ItemListCategoryIDResponse getItemListforCategoryID(@PathVariable String categoryID) throws  Exception{
        log.info("==== RESTful API Response Template Item List START  getItemListforCategoryID=======");
        ItemListCategoryIDResponse itemListCategoryIDResponse= new GenericRestClient<String, ItemListCategoryIDResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.TEMPLATE_ITEM_LIST_CATEGORY_ID_URL+categoryID, HttpMethod.GET), " ", ItemListCategoryIDResponse.class);
        log.info(itemListCategoryIDResponse.toString());
        log.info("==== RESTful API Response Template Item List END getItemListforCategoryID=======");
        return itemListCategoryIDResponse;
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST, produces = { "application/json" }, consumes = { "application/json" })
    public OrderServiceResponse placeOrder(@RequestBody OrderServiceRequest orderServiceRequest) throws  Exception{
        log.info("==== RESTful API Response Order Service START  placeOrder=======");
        OrderServiceResponse orderServiceResponse= new GenericRestClient<String, OrderServiceResponse>().execute(
                new RequestDetails(Constants.WEB_SERVICE_URL+Constants.ORDER_SERVICE, HttpMethod.POST), orderServiceRequest.toString(), OrderServiceResponse.class);
        log.info(orderServiceResponse.toString());
        log.info("==== RESTful API Response Order Service END placeOrder=======");
        return orderServiceResponse;
    }
}
