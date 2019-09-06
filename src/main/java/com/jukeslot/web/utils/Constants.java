package com.jukeslot.web.utils;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Crazy 08/25/2019
 */
public class Constants {
    public final static String SITE_ID = "SoupDive-0001";

    public final static String LOG_TAG = "CustomProject";

   // public final static long SPLASH_DURATION = 1 * DateUtils.SECOND_IN_MILLIS;

    public final static String ENCRYPT_KEY = "N6PRz7RQ9qqWO06IjUnR";

    public final static String IMAGE_ADDRESS_PREFIX = "http://104.239.141.95:4869/";

    // public final static String WEB_SERVICE_URL = "http://50.56.214.164:8080/";
    public final static String WEB_SERVICE_URL = "http://104.239.141.95:8081/";
    public final static String TEMPLATE_LIST_URL= "api/template/list/"+SITE_ID;
    public final static String TEMPLATE_SITE_CONFIGURATION_URL = "api/template/site_configuration/"+SITE_ID;
    public final static String TEMPLATE_HOMEPAGE_URL ="api/template/home_page/"+SITE_ID;
    public final static String TEMPLATE_COMPANY_CONFIGURATION="api/template/company_configuration/Jukeslot";
    public final static String TEMPLATE_MENU_LIST_URL = "api/template/menu/list/"+SITE_ID;
    public final static String TEMPLATE_CATEGORY_LIST_URL = "api/template/menu/list/"+SITE_ID;


    public final static String OVERVIEW_URL = "http://devpadshop.luyishifu.com/maininfo";

    public final static int PASSWORD_MIN_LENGTH = 6; //TODO

    public final static int PASSWORD_MAX_LENGTH = 16;

    public final static String DATABASE_NAME = "database.sqlite";

    public final static int DATABASE_VERSION = 1;

    public final static int PRICE_SCALE = 0;

    public final static int PRICE_ROUNDING_MODE = BigDecimal.ROUND_HALF_UP;

    public final static float ALPHA_OF_OUT_STOCK = 0.3f;
    public final static float ALPHA_OF_HAS_STOCK = 1f;


    public final static Date TEMP_DATE = new Date();

    public final static long DATA_SYNC_INTERVAL = 60000;

    public final static int DEFAULT_PAGE_COUNT = 20;

    public final static int MAX_APPOINT_DATE_COUNT = 7;
    public final static int MAX_CHECK_CAR_PHOTOS = 6;

    private static String APP_EXTERNAL_DIRECTORY_NAME = "BeefOBradays";
//    private static File APP_EXTERNAL_DIRECTORY = new File(Environment.getExternalStorageDirectory
//            (), APP_EXTERNAL_DIRECTORY_NAME);
    private static String EXTERNAL_TEMP_DIRECTORY_NAME = "temp";
//    private static File EXTERNAL_TEMP_DIRECTORY = new File(APP_EXTERNAL_DIRECTORY,
//            EXTERNAL_TEMP_DIRECTORY_NAME);

    private static String INTERNAL_TEMP_DIRECTORY_NAME = "temp";


//    public static File getExternalTempFile(String name) {
//        File tempFile = new File(EXTERNAL_TEMP_DIRECTORY, name);
//        return tempFile;
//    }

//    public static File getInternalTempFile(Context context, String name) {
//        if (null != context) {
//            return new File(context.getDir(INTERNAL_TEMP_DIRECTORY_NAME, Context.MODE_PRIVATE),
//                    name);
//        }
//        return null;
//    }

//    static {
//        FileUtils.createIfNotExist(APP_EXTERNAL_DIRECTORY);
//        FileUtils.createIfNotExist(EXTERNAL_TEMP_DIRECTORY);
//    }

    public static final String CREDIT = "Credit";
    public static final String CASH = "Cash";
    public static final String DINE_IN = "DineIn";
    public static final String CARRY_OUT = "CarrayOut";
    public static final int CHECK_OUT_QUICK = 1;
    public static final int CHECK_OUT_OPEN_TAB = 2;
    public static final int PAY_WAY_ONLY_CREDIT = 1;
    public static final int PAY_WAY_CASH_CREDIT = 2;

    //food menu
    public static final String PAGE_INDEX = "pageIndex";
    public static final int FOOD_FRAGMENT = 1;
    public static final int PIZZA_PAGE = 0;
    public static final int BURGER_PAGE = 1;
    public static final int WINGS_PAGE = 2;
    public static final int TACOS_PAGE = 3;
    public static final int SOUP_PAGE = 4;
    public static final int BASKETS_PAGE = 5;
    public static final int SALAD_PAGE = 6;
    public static final int ENTREE_PAGE = 7;

    public static final int CLEAR_TIME = 180;

    public static final String GAME_TYPE = "game";

    public static final String GAME1_PACKAGE = "com.dumadugames.basketball";//"br.com.eggstudio.sdk.plot";
    public static final String GAME1_APK_NAME = "Basketball3D.apk";
    public static final String GAME2_PACKAGE = "com.dumadugames.baseballmaniaderby";
    public static final String GAME2_APK_NAME = "BaseballManiaDerbySlugfest_Custom.apk";

    public static final String GAME11_PACKAGE = "br.com.eggstudio.sdk.plot";//"br.com.eggstudio.sdk.plot";
    public static final String GAME11_APK_NAME = "SuecaABrazilianDrinkingGame_2.apk";
    public static final String GAME12_PACKAGE = "com.plotstudios.sorisos";
    public static final String GAME12_APK_NAME = "SuperSmileHeroes_2.apk";

    public static final String GAME3_PACKAGE = "com.dumadugames.DoodleCar";//"br.com.eggstudio.sdk.plot";
    public static final String GAME3_APK_NAME = "Doodlecarracing.apk";
    public static final String GAME4_PACKAGE = "com.dumadugames.footballkickflick";
    public static final String GAME4_APK_NAME = "FootballKickFlick_Custom.apk";

    public static final String GAME5_PACKAGE = "com.dumadugames.twitty";//"br.com.eggstudio.sdk.plot";
    public static final String GAME5_APK_NAME = "Twitty.apk";
    public static final String GAME6_PACKAGE = "com.dumadugames.basketballstreethero";
    public static final String GAME6_APK_NAME = "BasketBallStreetHero_Custom.apk";

    public static final String GAME7_PACKAGE = "com.dumadugames.darkrunner";//"br.com.eggstudio.sdk.plot";
    public static final String GAME7_APK_NAME = "DarkRunner.apk";
    public static final String GAME8_PACKAGE = "com.dumadugames.dreamrun";
    public static final String GAME8_APK_NAME = "DreamRun_Custom.apk";

    public static final String GAME9_PACKAGE = "com.dumadugames.pocketbowling";//"br.com.eggstudio.sdk.plot";
    public static final String GAME9_APK_NAME = "Pocketbowling3D_Custom.apk";
    public static final String GAME10_PACKAGE = "com.subbareddy.untangle";
    public static final String GAME10_APK_NAME = "Untangled.apk";


    public static final String GAME13_PACKAGE = "com.world3dgames.atvMaxSpeed";//"br.com.eggstudio.sdk.plot";
    public static final String GAME13_APK_NAME = "ATVMaxSpeed_12.apk";
    public static final String GAME14_PACKAGE = "com.BitofGame.MiniGolfRetro";
    public static final String GAME14_APK_NAME = "MiniGolfRetro_1.5.apk";

    public static final String GAME15_PACKAGE = "com.BitofGame.CuteCatParking";//"br.com.eggstudio.sdk.plot";
    public static final String GAME15_APK_NAME = "CuteCatParking_1.1.apk";
    public static final String GAME16_PACKAGE = "com.world3dgames.riversand.excavator";
    public static final String GAME16_APK_NAME = "RiverSandExcavatorSimulator_3.apk";

    public static final String GAME17_PACKAGE = "com.BitofGame.DroneFlyingSim";//"br.com.eggstudio.sdk.plot";
    public static final String GAME17_APK_NAME = "DroneFlyingSim_1.5.apk";
    public static final String GAME18_PACKAGE = "com.world3dgames.rushKartRacing";
    public static final String GAME18_APK_NAME = "RushKartRacing_6.apk";

    public static final String GAME20_PACKAGE = "com.BitofGame.BikeTricksHawaiiTrails";//"br.com.eggstudio.sdk.plot";
    public static final String GAME20_APK_NAME = "K_BikeTricksHawaiiTrails_1.3.apk";
//    public static final String GAME20_PACKAGE = "com.dumadugames.baseballmaniaderby";//"br.com.eggstudio.sdk.plot";
//    public static final String GAME20_APK_NAME = "BaseballManiaDerbySlugfest_Custom_withBacktoMainmenu.apk";


    public static final String GAME19_PACKAGE = "com.bitofgame.minigolffantasy";//"br.com.eggstudio.sdk.plot";
    public static final String GAME19_APK_NAME = "minigolf_putter_standard.apk";
    public static final String GAME21_PACKAGE = "com.bitofgame.masterofarcher3d";
    public static final String GAME21_APK_NAME = "master_archery_standard.apk";


    public static final String GAME22_PACKAGE = "com.bitofgame.trialanderror";
    public static final String GAME22_APK_NAME = "trial_and_error1.apk";

    public static final String GAME23_PACKAGE = "com.dumadugames.baccarat";
    public static final String GAME23_APK_NAME = "Baccarat_Custom_Backtomainmenu.apk";
    public static final String GAME24_PACKAGE = "com.dumadugames.craps";
    public static final String GAME24_APK_NAME = "Craps_Custom_withBacktomainmenu.apk";
    public static final String GAME25_PACKAGE = "com.arjun.coindozer";
    public static final String GAME25_APK_NAME = "CoinDozer_Custom_Backtomainmenu.apk";
    public static final String GAME26_PACKAGE = "com.imobile.gp.beerpongtrick";
    public static final String GAME26_APK_NAME = "BeerPong_Custom_Backtomainmenu.apk";
    public static final String GAME27_PACKAGE = "com.imobile.paperflick";
    public static final String GAME27_APK_NAME = "PaperTrash_Custom_Backtomainmenu.apk";
    public static final String GAME28_PACKAGE = "com.augmentedreality.gp.horseracing";
    public static final String GAME28_APK_NAME = "HorseRacingSimulator_Custom_withBacktomainmenu.apk";
    public static final String GAME29_PACKAGE = "com.ramakrishna.popstar";
    public static final String GAME29_APK_NAME = "PopStarHeart_custom_Backtomainmenu.apk";


    public static final String GAME1_NAME = "BasketBall 3D";//"br.com.eggstudio.sdk.plot";
    public static final String GAME2_NAME = "Baseball";
    public static final String GAME3_NAME = "Doodle Car Racing";
    public static final String GAME4_NAME = "Football Kick Flick";
    public static final String GAME5_NAME = "Twitty";//"br.com.eggstudio.sdk.plot";
    public static final String GAME6_NAME = "Basketball";
    public static final String GAME7_NAME = "Dark Runner";
    public static final String GAME8_NAME = "Dream Run";
    public static final String GAME9_NAME = "Pocket Bowling";//"br.com.eggstudio.sdk.plot";
    public static final String GAME10_NAME = "Untangled";
    public static final String GAME11_NAME = "Drinking";
    public static final String GAME12_NAME = "Super Smile Heroes";

    public static final String GAME13_NAME = "ATV Max Speed";
    public static final String GAME14_NAME = "Mini Golf Retro";
    public static final String GAME15_NAME = "Cute Cat Parking";//"br.com.eggstudio.sdk.plot";
    public static final String GAME16_NAME = "River Sand Excavator";
    public static final String GAME17_NAME = "Drone Flying Sim";
    public static final String GAME18_NAME = "Rush Kart Racing";
    public static final String GAME19_NAME = "Mini Golf Putter";//"br.com.eggstudio.sdk.plot";
    public static final String GAME20_NAME = "Bike Tricks";
    public static final String GAME21_NAME = "Master of Archery";
    public static final String GAME22_NAME = "Trial & Error";

    public static final String GAME23_NAME = "Baccarat";
    public static final String GAME24_NAME = "Craps";
    public static final String GAME25_NAME = "Coin Dozer";//"br.com.eggstudio.sdk.plot";
    public static final String GAME26_NAME = "Beer Pong";
    public static final String GAME27_NAME = "PaperFlick";
    public static final String GAME28_NAME = "Bet on Horse: Racing Simulator";
    public static final String GAME29_NAME = "Pop Star Heart";

    public static final int TEST_INT = 0b11;


    public static final String QUICK_CHECK_OUT = "QuickServiceCheckout";
    public static final String PAY_WAY_CREDIT_CASH = "CreditAndCash";
    public static final String PAY_WAY_CREDIT_ONLY = "Credit";
    public static final String PAY_WAY_CASH_ONLY = "Cash";
    public static final int  CREDIT_CASH = 2;
    public static final int  CREDIT_ONLY = 1;
    public static final int  CASH_ONLY = 0;

    public static final String ORDER_TYPE_TAB_OPEN = "TAB_OPEN";
    public static final String ORDER_TYPE_QUICK = "QUICK";

}
