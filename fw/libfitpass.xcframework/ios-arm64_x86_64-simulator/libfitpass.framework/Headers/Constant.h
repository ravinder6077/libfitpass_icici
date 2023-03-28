//
//  Constant.h
//  FITPASS_v3
//
//  Created by Ravinder Singh on 14/07/17.
//  Copyright © 2017 Fitpass. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#import <CoreData/CoreData.h>

//define UIKeyboardFrameInfoKey UIKeyboardFrameBeginUserInfoKey
#define UIKeyboardFrameInfoKey UIKeyboardFrameEndUserInfoKey
#define NO_RESULT_VIEW_TAG    1111
#define wttttttt 7

#define MIN_HEIGHT   4
#define MAX_HEIGHT   8
#define MIN_HEIGHT_CM   100
#define MAX_HEIGHT_CM   200
#define MIN_WEIGHT   30
#define MAX_WEIGHT   200

#define IS_IOS11orHIGHER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define IS_IOS12orHIGHER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0)

//#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?(([[UIScreen mainScreen] bounds].size.height-896)?NO:YES):YES)

//#define iPhoneHasNotch  (([[UIScreen mainScreen] bounds].size.height-812)?(([[UIScreen mainScreen] bounds].size.height-896)?NO:YES):YES)
//#define topNotch  [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.top

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
/*
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-640)?NO:YES)
 #define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
 #define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
 #define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
 #define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
*/

#define MAX_RECENT_PLACES   5

#define  APP_STORE_ID                       @"1049745078"
#define  APP_BUNDLE_ID                      @"com.fitpassBusinessVenture.fitpass"
#define  APPSFLYER_ID                       @"NskBiwzwvkfFMXjNo5ZJzR"

#define  App_Store_Url                      @"https://itunes.apple.com/nz/app/fitpass/id1049745078?mt=8"
#define  APP_UPDATE_POPUP_COUNT             @"APP_UPDATE_POPUP_COUNT"
#define  APP_UPDATE_COUNT_LIMIT             5

#define EVENT_MEAL_LOG                      @"ADD MEAL LOG"
#define EVENT_WORKOUTS_ATTENDED_FP          @"ATTENDED WORKOUTS"


#define EVENT_AFTER_PAYMENT_GYM             @"COMPLETE GYMMEMBERSHIP ORDERS"
#define EVENT_AFTER_PAYMENT_NUTRITION       @"COMPLETE FITFEAST ORDERS"
#define EVENT_AFTER_PAYMENT_FITCHOACH       @"COMPLETE FITCOACH ORDERS"
#define EVENT_AFTER_PAYMENT_FITSHOP         @"COMPLETE FITSHOP ORDERS"

#define EVENT_PENDING_PAYMEENT_GYM          @"PENDING GYMMEMBERSHIP ORDERS"
#define EVENT_PENDING_PAYMEENT_NUTRITION    @"PENDING FITFEAST ORDERS"
#define EVENT_PENDING_PAYMEENT_FITCOACH     @"PENDING FITCOACH ORDERS"
#define EVENT_PENDING_PAYMEENT_FITSHOP      @"PENDING FITSHOP ORDERS"

#define EVENT_SCHEDULE_CALL                 @"SCHEDULE CALL"
#define EVENT_CANCEL_CALL                   @"CANCEL CALL"

//#define EVENT_BLOG_DETAIL                   @"BLOG DETAIL"//blog_detail"
//#define EVENT_BLOG_DETAIL_HOME              @"HOME BLOG"//home_blog"
//#define EVENT_FITSHOP_DEAL_HOME             @"FITSHOP DEAL"//fitshop_deal"
#define EVENT_FITSHOP_DETAIL                @"FITSHOP DETAIL"//fitshop_detail"

#define EVENT_WORKOUT_LISTING               @"WORKOUT LIST"//workout_list"


#define EVENT_FITSHOP_LISTING               @"FITSHOP LISTING"//fitshop_listing"
//#define EVENT_GYM_DETAIL                    @"GYM DETAIL"//gym_detail"
//#define EVENT_GYM_LISTING                   @"GYM LISTING"//gym_listing"


//#define EVENT_GYM_RENEW_BUY                   @"GYMMEMBERSHIP EXPIRY REMINDER"
//#define EVENT_GYM_RENEW_VALUE                 @"EVENT_GYM_RENEW_VALUE"
//#define EVENT_NEW_USER                        @"EVENT_NEW_USER"
//
//#define EVENT_DIET_RENEW_BUY                  @"FITFEAST EXPIRY REMINDER"
//#define EVENT_DIET_RENEW_VALUE                @"EVENT_DIET_RENEW_VALUE"
//
//#define EVENT_FITCOACH_RENEW_BUY              @"FITCOACH EXPIRY REMINDER"
//#define EVENT_FITCOACH_RENEW_VALUE            @"EVENT_FITCOACH_RENEW_VALUE"
//
//
//#define EVENT_RENEW_FITPASS                   @"RENEW FITPASS"
//#define EVENT_RENEW_FITFEAST                  @"RENEW FITFEAST"
//#define EVENT_RENEW_FITCOACH                  @"RENEW FITCOACH"
//
//
//#define EVENT_COUPON_APPLIED                  @"COUPON APPLIED"
//#define EVENT_SIGNED_UP                       @"SIGNED UP"
//#define EVENT_APP_LAUNCH                      @"APP LAUNCH"
//
//#define NEW_USER                     @"NEW USER"
//#define EXISTING_USER                @"EXISTING USER"
#define DOWN_TIME_DETAILS            @"down_time_details"

#define REFRESH_DASHBOARD                @"REFRESH DASHBOARD"

#define EVENT_SOCIAL_CONNECT                       @"VIEW SOCIAL CONNECT"
#define EVENT_SOCIAL_CONNECT_GOOGLE                @"CONNECTED GOOGLE"
#define EVENT_SOCIAL_CONNECT_FB                    @"CONNECTED FACEBOOK"
#define EVENT_SOCIAL_CONNECT_TWITTER               @"CONNECTED TWITTER"

//#define heightArrayConstant @[@"5'", @"5'1\"", @"5'2\"", @"5'3\"", @"5'4\"", @"5'5\"", @"5'6\"", @"5'7\"", @"5'8\"", @"5'9\"", @"5'10\"", @"5'11\"", @"6'"]
//#define weightArrayConstant @[@"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", @"60", @"61"]

//#define kArray @[@"item1", @"item2"]
//#define NEARBYARRAY                             @"nearbyArray"

//#define USER_APP_KEY_DEFAULT                   @"rcmroes1UWF2GIcBBQ5jghe6xpwoQ4vqDqoIIcBTbZEE6"
//#define USER_AUTH_KEY_DEFAULT                  @"dgfJlO10QAoZzaiT8FXrF8bgBBQ5jghe7FNrd9t8D0u"

#define USER_APP_KEY_DEFAULT                   @"OEkOOL6bmRU5cz0zRlDqEiVpM6162LDNxXmKneAc"
#define USER_AUTH_KEY_DEFAULT                  @"mLmBSuC2RLTsU7UUgI9A2lqtSXeUkG8wZ2ELkAT3"

#define EVENT_OPENED_PROMO_HOME_FOR_APP_RUN        @"EVENT_OPENED_PROMO_HOME_FOR_APP_RUN"
#define EVENT_OPENED_PROMO_HOME                    @"EVENT_OPENED_PROMO_HOME"
#define EVENT_OPENED_PROMO_LIST                    @"EVENT_OPENED_PROMO_LIST"
#define EVENT_OPENED_PROMO_DETAIL                  @"EVENT_OPENED_PROMO_DETAIL"


#define INTEGRATION_DONE_FOR_CALORIES_BURN       @"INTEGRATION_DONE_FOR_CALORIES_BURN"
#define INTEGRATION_DONE_FOR_STEPS               @"INTEGRATION_DONE_FOR_STEPS"
#define INTEGRATION_DONE                         @"INTEGRATION_DONE"
#define INTEGRATION_CALORIES                     @"CALORIES"
#define INTEGRATION_HEARTRATE                    @"HEART RATE"
#define INTEGRATION_WEIGHT                       @"WEIGHT"
#define INTEGRATION_STEPS                        @"STEPS"

#define USER_STATUS_ACTIVE                        @"Active"
#define USER_STATUS_INACTIVE                      @"Inactive"
#define USER_STATUS_RENEW                         @"Renew"
#define USER_STATUS_EXTEND                        @"Extend"
#define USER_STATUS_EXPIRY                        @"Expired"

#define APP_SHARE_LINK                          @"https://fitpass.co.in/app"

#define USER_ID_PREVIOUS                        @"USER_ID_PREVIOUS"

#define CHANNEL_NAME                            @"CHANNEL_NAME"
#define CORPORATE_ID                            @"CORPORATE_ID"

#define JOURNEY_DATA                            @"JOURNEY_DATA"
#define JOURNEY_LINK                            @"JOURNEY_LINK"
#define JOURNEY_SOURCE                          @"JOURNEY_SOURCE"

#define USER_APP_KEY                            @"app_key"

//#define USER_ID                                 @"user_id"
//#define USER_AGE_GROUP                          @"age_group"
//#define USER_DIET_PLAN_CYCLE_END                @"diet_end_of_cycle"
//#define USER_EMAID_ID                           @"email_address"
//#define USER_FIRST_NAME                         @"first_name"
//#define USER_GST_ALL_PRODUCT                    @"gst_all_product"

//#define Social_ID                               @"Social_ID"
//#define Social_URL                              @"Social_URL"
//#define Social_Type                             @"Social_Type"
//#define Social_Type_Facebook                    @"Facebook"
//#define Social_Type_Twitter                     @"Twitter"
//#define Social_Type_Instagram                   @"Instagram"
//#define Social_Type_Google                      @"Google"

//#define FITCARD_EOC                             @"insure_card_EOC"
//#define FITCARD_NUMBER                          @"insure_card_number"
//
//#define GST_FITSHOP                             @"gst_fitshop"
//#define GST_FITCARD                             @"gst_fitcard"
//#define GST_DESCRIPTION                         @"gst_description"
//#define REFERRAL_DESCRIPTION                    @"referral_description"
//#define OTHER_SERVICES                          @"other_services"

//#define DELIVERY_CHARGE                         @"shipping_charge"
//#define DELIVERY_CHARGE_ON_MINIMUM_ORDER        @"minimum_order_amount"
//#define FITSHOP_DISCOUNT_FOR_FITPRIME_USER      @"fitshop_fitprime_discount"
//
//#define FITSHOP_FITPRIME_CROSS                  @"FITSHOP_FITPRIME_CROSS"
//
//#define FITPASS_CORPORATES                      @"fitpass_corporates"
//#define FITPASS_AMEX_USERS                      @"amex_users"
//#define FITPASS_AVAILABLE_IN_CITY               @"fitpass_available_in_city"
//#define USER_CANNOT_RESERVE_WORKOUT             @"user_cannot_reserve_workouts"
//#define USER_CANNOT_RESERVE_WORKOUT_DATE        @"USER_CANNOT_RESERVE_WORKOUT_DATE"
//#define USER_CANNOT_RESERVE_WORKOUT_MESSAGE     @"USER_CANNOT_RESERVE_WORKOUT_MESSAGE"
//#define FITPASS_CURRENT_CITY_ID                 @"FITPASS_CURRENT_CITY_ID"


//#define PROMO_IMAGE                             @"image_banner"
//#define PROMO_COUPON                            @"coupon_code"
//#define PROMO_DISPLAY                           @"offer_display"
//#define OFFER_BAKGROUND_DISPLAY                 @"background_display"
//#define PROMO_CONTENT_TITLE                     @"content_title"
//#define PROMO_CONTENT_DESCRIPTION               @"content_description"
//#define PROMO_BTN_TEXT                          @"btn_text"
//#define PROMO_BTN_DETAIL                        @"cta_btn_details"
//#define PROMO_CAMPAIGN_NAME                     @"campaign_name"
//#define PROMO_TYPE_ID                           @"type_id"
//#define TYPE_ID_BRANCH                          @"type_id_branch"
//
//#define USER_CYCLE_FITFEAST                     @"FITFEAST CYCLE"
//#define USER_CYCLE_FITPASS                      @"FITPASS CYCLE"
//#define USER_CYCLE_FITCOACH                     @"FITCOACH CYCLE"
//
//#define USER_FIT_PRIME_END_OF_CYCLE             @"fit_prime_end_of_cycle"
//#define USER_GYM_END_OF_CYCLE                   @"gym_end_of_cycle"
//#define USER_GYM_END_OF_CYCLE_DATE              @"USER_GYM_END_OF_CYCLE_DATE"
//#define EVENT_USER_GYM_MEMBERSHIP_EXPIRY        @"EVENT_USER_GYM_MEMBERSHIP_EXPIRY"
//#define USER_GYM_MEMBERSHIP_ACTIVE_TYPE         @"gym_membership_active_type"

//#define USER_MEMBERSHIP_TYPE_FC                 @"user_membership_type"
//#define FC_DYNAMIC_CONTENT                      @"fitcoach_dynamic_content"
//#define FC_DYNAMIC_CONTENT_TRIAL                @"trial_workout"
//#define FC_DYNAMIC_CONTENT_BACK_FROM_PAYMENT    @"back_from_payment_screen"
//#define FC_DYNAMIC_CONTENT_RECOMMENDED          @"recommended_workout"
//#define FC_DYNAMIC_CONTENT_CUSTOMISE            @"customise_workout"
//#define FC_DYNAMIC_CONTENT_FEEDBACK             @"workoutfeedback"
//#define FC_DYNAMIC_CONTENT_THANKYOU             @"thankyouscreen"
//
//#define USER_MEMBERSHIP_TYPE_FC_ACTIVE          1
//#define USER_MEMBERSHIP_TYPE_FC_TRIAL           2
//#define USER_MEMBERSHIP_TYPE_FC_EXPIRED         3
//#define USER_MEMBERSHIP_TYPE_FC_TRIAL_EXPIRED   4
//
//#define FITCOACH_WARMUP       @"FITCOACH_WARMUP"
//#define FITCOACH_COOLDOWN     @"FITCOACH_COOLDOWN"
//
//#define USER_FITCOACH_END_OF_CYCLE              @"fitcoach_end_of_cycle"
//#define USER_PRODUCT_DETAIL                     @"product_details"
//#define USER_RECENTLY_EXPIRING                  @"recently_expiring"
//
//
//#define USER_GYM_MEMBERSHIP_PLAN                @"gym_membership_plan"
//#define USER_MAX_REDEEM_LIMIT_ALL_PRODUCT       @"max_redeem_limit"
//#define USER_MAX_REDEEM_LIMIT_FITSHOP           @"max_redeem_limit_fitshop"
//#define USER_MEMBERSHIP_PLAN                    @"membership_plan"
//#define USER_MEMBERSHIP_ID                      @"membership_id"
//#define USER_MOBILE_NUMBER                      @"mobile_no"
//#define USER_REFERRAL_CODE                      @"my_referral_code"
//#define USER_REFERRAL_CREDIT                    @"referral_credit"
//#define USER_REFERRAL_USED                      @"referral_used"
//#define USER_REMAINING_WORKOUTS                 @"remaining_workouts"
//#define USER_USED_WORKOUTS                      @"total_used_workouts"
//
//#define USER_PHOTO                              @"user_photo"
//#define USER_GENDER                             @"gender"
//#define USER_HEIGHT                             @"height"
//#define USER_WEIGHT                             @"weight"
//#define USER_WAIST                              @"waist"
//#define USER_AGE                                @"age"
//#define USER_HEIGHT_TYPE                        @"height_type"
//#define USER_WEIGHT_TYPE                        @"weight_type"
//#define USER_WAIST_TYPE                         @"waist_type"
//
//#define USER_HEIGHT_TYPE_FEET_INCH              @"ft/in"
//#define USER_HEIGHT_TYPE_CM                     @"cm"
//#define USER_WEIGHT_TYPE_KG                     @"kg"
//#define USER_WEIGHT_TYPE_LBS                    @"lbs"
//#define USER_WAIST_TYPE_INCH                    @"inch"
//#define USER_WAIST_TYPE_CM                      @"cm"
//
//
//#define USER_DOB                                @"user_date_of_birth"
//#define PREFERRED_LOCATION                      @"preferred_location"
//#define USER_REGISTER_DATE                      @"user_register_date"
//#define USER_CAN_EDIT_PROFILE                   @"user_can_edit_profile"
//
//#define USER_ONBOARD_DIET                       @"diet_onboard"
//#define USER_ONBOARD_FITCOACH                   @"fitcoach_onboard"
//#define USER_HRA_COMPLETED                      @"hra_completed"
//#define USER_HAS_VIEWED_FC_INTRO                @"hasViewedFCIntro"
//#define FITCOACH_SHARE_WORKOUT                  @"share_visit"
//
//#define USER_RECENT_LOCATION_ARRAY              @"USER_RECENT_LOCATION_ARRAY"
//#define USER_RECENT_SEARCH_FITSHOP              @"USER_RECENT_SEARCH_FITSHOP"
//#define USER_RECENT_SEARCH_BLOG                 @"USER_RECENT_SEARCH_BLOG"
//#define USER_SAVED_LOCATION_ARRAY               @"user_places"
//
//
//#define  FITPASS_USER_ID                        [[NSUserDefaults standardUserDefaults]objectForKey:USER_ID]
//#define  FITPASS_USER_ID_PREVIOUS               [[NSUserDefaults standardUserDefaults]objectForKey:USER_ID_PREVIOUS]
//
//
//#define USER_LOCATION_STUDIO                    @"USER_LOCATION_STUDIO"
//#define USER_LOCATION_STUDIO_SUB_LOCALITY       @"USER_LOCATION_STUDIO_SUB_LOCALITY"
//#define USER_LOCATION_STUDIO_LOCALITY           @"USER_LOCATION_STUDIO_LOCALITY"
//
//#define USER_CONFIRM_WORKOUT_LOCATION           @"USER_CURRENT_LOCATION"
//#define USER_LOCATION_CURRENT                   @"USER_LOCATION_CURRENT"
//#define USER_LOCATION_PREVIOUS                  @"USER_LOCATION_PREVIOUS"
//
//#define USER_LOCATION_SUB_LOCALITY                   @"USER_LOCATION_SUB_LOCALITY"
//#define USER_LOCATION_LOCALITY                   @"USER_LOCATION_LOCALITY"
//
//
//#define RATING_QUESTION_ARRAY                   @"ratingQuestionArray"
//#define DIET_PLAN                               @"getDietPlans"
//#define USER_MEMBERSHIP_PLAN_DETAILS            @"membership_plans_details"
//#define USER_FIT_PRIME                          @"fit_prime"
//#define SCAN_CONFIRMED                          @"SCAN_CONFIRMED"
//#define USER_FITPASS_PLAN                       @"fitpass_plan"
//#define User_Details                            @"user_details"
//#define Old_Membership_Plan                     @"old-membership_plan"
//#define FP_Membership_Plan                      @"fitpass-membership_plan"
//#define Product_Plan                            @"product_plan"
//#define fitpass_City_Array                      @"fitpass_city"
//#define FC_PLAN                                 @"getCoachPlans"
//
//
//#define FITCARD_PLAN                            @"getFitCardPlans"
//#define METHOD_FITCARD_COUPON                   @"fitcard/coupon"
//
//#define STUDIO_TYPE                             @"studio_category_in_city"
//
////FITGIFT
//#define FITCASH_AMOUNT                           @"FITCASH_AMOUNT"//bool value
//
//#define METHOD_FITGIFT_PRODUCT                   @"customer/getgiftproduct"
//#define METHOD_FITGIFT_PRODUCT_DETAIL            @"customer/getgiftproductdetails"
//#define METHOD_FITGIFT_PENDING_ORDER             @"transaction/fitgiftpendingorder"
//#define METHOD_FITCASH                           @"customer/getfitcash"
//#define METHOD_REDEEM_VOUCHER                    @"customer/getevocuherproviderdetails"
////FITGIFT
//
//#define METHOD_MEMBERSHIP                        @"customer/membership"
//#define METHOD_MEMBERSHIP_PLAN                   @"customer/getgymmbershipplan"
//#define METHOD_SUBSCRIPTION_PLAN                 @"customer/getsubscriptionplan"
//#define METHOD_SUBSCRIPTION_PLAN_NEW             @"subscription/getplan"
//#define METHOD_SUBSCRIPTION_DETAILS              @"subscription/getcustomerplandetails"
//#define METHOD_SUBSCRIPTION_UPDATE               @"subscription/update"
//#define METHOD_SUBSCRIPTION_CANCEL               @"subscription/cancelrequest"
//#define METHOD_FITPRIME_PLAN                     @"customer/getfitprimedata"
//
//#define METHOD_MUTUAL_FRIENDS_WORKOUT            @"customer/getmutualfriendsworkouts"
//
//#define METHOD_CORPORATE_VALIDATE_USER           @"customer/corporatedetails/validate-corporate-users"
//#define METHOD_BANK_LANDING_DETAIL               @"customer/corporatedetails/getdetails"
//#define METHOD_CORPORATE_COUPON                  @"customer/corporateapplycoupon"
//#define METHOD_CORPORATE_ACTIVATE                @"customer/activtecorporateusers"
//#define METHOD_CORPORATE_PLANS                   @"customer/getcorporatemembershipplan"
//#define METHOD_REQUEST_CALLBACK                  @"customer/callbackrequest"
//
//#define METHOD_UPDATE_STUDIO_LAT_LONG            @"customer/updatestudiolatlong"
//
//#define METHOD_FTV_PASTWORKOUT                   @"customer/ftv/pastworkouts"
//#define METHOD_FTV_WORKOUT_DETAIL                @"customer/ftv/workout_details"
//#define METHOD_FTV_WORKOUT_JOIN                  @"customer/ftv/joinworkouts"
//#define METHOD_FTV_WORKOUT_CANCEL                @"customer/ftv/cancelworkout"
//#define METHOD_FTV_SCHEDULE                      @"customer/ftv/schedules"
//#define METHOD_FTV_MY_SCHEDULE                   @"customer/ftv/myschedules"
//#define METHOD_FTV_ADD_COMMENT                   @"customer/ftv/addcomments"
//#define METHOD_FTV_ADD_FAVORITE                  @"customer/ftv/favoriteworkouts"
//#define METHOD_FTV_WORKOUT_LIVE_VIEWS            @"partner/v3/events/customerliveviews"
//#define METHOD_FTV_RATING                        @"customer/ftv/trainer-rating"
//
//#define METHOD_FTV_WORKOUT_SCHEDULE              @"fptv_2/trainers/getschedules"
//#define METHOD_FTV_WORKOUT_DETAIL_NEW            @"fptv_2/trainers/workout_details"
//#define METHOD_FTV_UPDATE_WORKOUT_STATUS         @"fptv_2/trainers/updateworkoutstatus"
//#define METHOD_FTV_GET_COMMENTS                  @"fptv_2/trainers/get-trainer-comments"
//#define METHOD_FTV_POST_COMMENTS                 @"fptv_2/trainers/addcomments"
//#define METHOD_FTV_GET_BROADCAST_DETAIL          @"fptv_2/trainers/get-today-workout-broadcast-url"
//#define METHOD_FTV_CUSTOMER_LIVE_VIEWS           @"fptv_2/trainers/customer-live-views"
//
//#define FTV_CALENDAR_LIST                        @"FTV_CALENDAR_LIST"
//
////FITCOACH 2
//#define METHOD_FC_QUESTION_LIST                  @"fitcoach-v2/questionlist"
//#define METHOD_FC_WORKOUTS_PLAN                  @"fitcoach-v2/workoutlist"
//#define METHOD_FC_WORKOUTS_LOG_UPDATE            @"fitcoach-v2/updatecustomerworkoutlog"
//#define METHOD_FC_WORKOUTS_FEEDBACK              @"fitcoach-v2/customer-workout-feedback"
//#define METHOD_FC_SEARCH_EXERCISE                @"fitcoach-v2/exercises"
//#define METHOD_FC_CREATE_CUSTOM_PLAN             @"fitcoach-v2/createcustomplan"
//#define METHOD_FC_ONBOARD_USER                   @"fitcoach-v2/coachuseronboard"
//#define METHOD_FC_PLANS                          @"fitcoach-v2/plans"
//#define METHOD_FC_WORKOUT_DETAIL                 @"fitcoach-v2/workoutdetails"
//#define METHOD_FC_WORKOUT_RECOMMENDATION         @"fitcoach-v2/recommended-workout"
//#define METHOD_FC_WORKOUT_UPDATE                 @"fitcoach-v2/updateworkout"
//
////PT
//#define METHOD_PT_HOME_PLAN                      @"personal-training/home"//NA
//#define METHOD_PT_TRAINER_LIST                   @"personal-training/list"//NA
//#define METHOD_PT_TRAINER_DETAIL                 @"personal-training/trainerdetails"//NA
//#define METHOD_PT_TRAINER_REVIEWS                @"personal-training/trainerreviews"//NA
//#define METHOD_PT_TRAINER_PLANS                  @"personal-training/plans"//NA
//#define METHOD_PT_RESERVE_SESSION                @"personal-training/session-reservation"//NA
//#define METHOD_PT_CANCEL_SESSION                 @"personal-training/cancel-session"//NA
//
////Marketting
//#define METHOD_MARKETING_USER_STATUS            @"marketing/registers/check-user-status"
//#define METHOD_MARKETING_USER_REGISTRATION      @"marketing/registers/user"
//#define METHOD_MARKETING_ACTIVATE_OFFER         @"marketing/registers/activate-offer"

////Amway
//#define AMWAY_SELECETD_CHALLENGE_TYPE            @"AMWAY_SELECETD_CHALLENGE_TYPE"
//
//#define AMWAY_ABO_USER_ID                         @"abo_user_id"
//#define REFERRAL_USER_ID                          @"referral_user_id"
//
//#define METHOD_USER_REMINDER_GET                  @"customer/user-notification-settings/getnotficationsettings"
//#define METHOD_USER_REMINDER_SET                  @"customer/user-notification-settings/updatesetting"
//#define METHOD_USER_REMINDER_OFF                  @"customer/user-notification-settings/turnoffnotficationsettings"
//#define METHOD_USER_HEART_HISTORY                 @"customer/user-activity-tracking/heart-log-history"
//#define METHOD_USER_WATER_HISTORY                 @"customer/user-activity-tracking/water-log-history"
//#define METHOD_USER_WEIGHT_HISTORY                @"customer/user-activity-tracking/weight-log-history"
//#define METHOD_USER_STEPS_HISTORY                 @"customer/user-activity-tracking/steps-log-history"
//#define METHOD_USER_SET_GOAL                      @"customer/user-activity-tracking/set-user-fitness-goal"
//#define METHOD_USER_LOG_WATER                     @"customer/user-activity-tracking/waterlog"
//#define METHOD_USER_LOG_STEPS                     @"customer/user-activity-tracking/update-steps"
//#define METHOD_USER_LOG_WEIGHT                    @"customer/user-activity-tracking/weight-log"
//#define METHOD_USER_LOG_HEARTRATE                 @"customer/user-activity-tracking/heartrate-log"
//#define METHOD_USER_FEED                          @"customer/amway-feed/get-feed"
//#define METHOD_USER_FEED_UPDATE_STATUS            @"customer/amway-feed/update-feed-favourite"
//#define METHOD_USER_FEED_LIKE_LIST                @"customer/amway-feed/get-feed-likes"
//#define METHOD_USER_FEED_PUBLISH                  @"customer/amway-feed/publish-feed"
//#define METHOD_USER_GET_CHALLENGE                 @"customer/amway-challenges/get-challenge"
//#define METHOD_USER_GET_CHALLENGE_DETAIL          @"customer/amway-challenges/get-challenge-details"
//#define METHOD_USER_DELETE_CHALLENGE              @"customer/amway-challenges/delete-challenge"
//#define METHOD_USER_UPDATE_CHALLENGE              @"customer/amway-challenges/update-challenge"
//#define METHOD_USER_CREATE_CHALLENGE              @"customer/amway-challenges/create-challenge"
//#define METHOD_USER_CHALLENGE_ADD_MEMBER          @"customer/amway-users/add-member"
//#define METHOD_USER_CHALLENGE_INVITE_MEMBER       @"customer/amway-challenge-invitation/invite-for-challenge"
//#define METHOD_USER_CHALLENGE_INVITE_MEMBERS_M    @"customer/amway-challenge-invitation/invite-challenge-for-multiple-users"
//#define METHOD_USER_CHALLENGE_GET_MEMBER_DETAIL   @"customer/amway-users/get-user-details"
//#define METHOD_USER_CHALLENGE_GET_MEMBER          @"customer/amway-users/get-members"
//#define METHOD_USER_CHALLENGE_GET_INVITATION      @"customer/amway-users/get-challenge-invitation"
//#define METHOD_USER_CHALLENGE_GET_REQUEST         @"customer/amway-users/get-challenge-request"
//#define METHOD_USER_CHALLENGE_GET_NOTIFICATION    @"customer/amway-user-notification/get-notifcation"
//#define METHOD_USER_CHALLENGE_REVOKE              @"customer/amway-users/revoke-users"
//#define METHOD_USER_CHALLENGE_RESEND              @"customer/amway-users/resend-inviteto-users"
//#define METHOD_USER_CHALLENGE_STATUS              @"customer/amway-challenge-invitation/update-status"
//#define METHOD_USER_FEED_POST_COMMENTS            @"customer/amway-feed/postcomments"
//#define METHOD_USER_FEED_GET_COMMENTS             @"customer/amway-feed/getcomments"
//#define METHOD_USER_FEED_REPORT_FEED              @"customer/amway-feed/flagfeedpost"
//#define METHOD_USER_FEED_DELETE_FEED              @"customer/amway-feed/deletefeed"
//
//#define REFRESH_CHALLENGE                @"REFRESH_CHALLENGE"
//Amway

//#define REMINDER_SUB_TYPE_DAILY                   @"in_day"
//#define REMINDER_SUB_TYPE_HOURLY                  @"hour-between"
//#define REMINDER_SUB_TYPE_TIMES                   @"number_of_times_between"
//#define REMINDER_SUB_TYPE_CUSTOM_DAYS             @"custom_days"
//#define REMINDER_SUB_TYPE_MONTHOLY                @"in_month"
//#define REMINDER_SUB_TYPE_CUSTOM                  @"custom"
//
//
//#define PT_HOME_REFRESH                          @"PT_HOME_REFRESH"
//
//
//#define  COLOR_ACTIVITY_1_1              UIColorFromRGB(0x80db7e)
//#define  COLOR_ACTIVITY_1_2              [UIColor colorWithRed:153.0/255.0 green:128.0/255.0  blue:70.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_1_3              [UIColor colorWithRed:135.0/255.0 green:154.0/255.0  blue:254.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_1_4              [UIColor colorWithRed:245.0/255.0 green:191.0/255.0  blue:64.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_1_5              UIColorFromRGB(0xf5908c)
//#define  COLOR_ACTIVITY_1_6              UIColorFromRGB(0x9f6edc)
//#define  COLOR_ACTIVITY_1_7              UIColorFromRGB(0xef78ba)
//#define  COLOR_ACTIVITY_1_8              UIColorFromRGB(0xebe382)
//#define  COLOR_ACTIVITY_1_9              UIColorFromRGB(0x5feae5)
//#define  COLOR_ACTIVITY_1_10             UIColorFromRGB(0xe981fb)
//#define  COLOR_ACTIVITY_1_11             UIColorFromRGB(0xb47df1)
//#define  COLOR_ACTIVITY_1_12             UIColorFromRGB(0xa85d4a)
//#define  COLOR_ACTIVITY_1_13             UIColorFromRGB(0x675ea4)
//#define  COLOR_ACTIVITY_1_14             UIColorFromRGB(0x10bddb)
//#define  COLOR_ACTIVITY_1_15             UIColorFromRGB(0xad68b7)
//
//#define  COLOR_ACTIVITY_1_16             UIColorFromRGB(0xf5908c)
//
//#define  COLOR_ACTIVITY_2_1              UIColorFromRGB(0x4dc349)
//#define  COLOR_ACTIVITY_2_2              [UIColor colorWithRed:129.0/255.0 green:94.0/255.0  blue:13.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_2_3              [UIColor colorWithRed:94.0/255.0 green:140.0/255.0  blue:235.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_2_4              [UIColor colorWithRed:251.0/255.0 green:187.0/255.0  blue:116.0/255.0  alpha:1.0]
//#define  COLOR_ACTIVITY_2_5              UIColorFromRGB(0xd04a31)
//#define  COLOR_ACTIVITY_2_6              UIColorFromRGB(0x6345c6)
//#define  COLOR_ACTIVITY_2_7              UIColorFromRGB(0xda4361)
//#define  COLOR_ACTIVITY_2_8              UIColorFromRGB(0xeac644)
//#define  COLOR_ACTIVITY_2_9              UIColorFromRGB(0x41ccc6)
//#define  COLOR_ACTIVITY_2_10             UIColorFromRGB(0xc734e0)
//#define  COLOR_ACTIVITY_2_11             UIColorFromRGB(0x8f40e6)
//#define  COLOR_ACTIVITY_2_12             UIColorFromRGB(0x8a2e14)
//#define  COLOR_ACTIVITY_2_13             UIColorFromRGB(0x1c1162)
//#define  COLOR_ACTIVITY_2_14             UIColorFromRGB(0x59b1d7)
//#define  COLOR_ACTIVITY_2_15             UIColorFromRGB(0x6e1f7a)
//
//#define  COLOR_ACTIVITY_2_16             UIColorFromRGB(0xd04a31)
//
//
//#define activity1   @{@"color1" : COLOR_ACTIVITY_1_1, @"color2" : COLOR_ACTIVITY_2_1, @"activity_name" : @"Abs1"}
//#define activity2   @{@"color1" : COLOR_ACTIVITY_1_2, @"color2" : COLOR_ACTIVITY_2_2, @"activity_name" : @"Abs2"}
//#define activity3   @{@"color1" : COLOR_ACTIVITY_1_3, @"color2" : COLOR_ACTIVITY_2_3, @"activity_name" : @"Abs3"}
//#define activity4   @{@"color1" : COLOR_ACTIVITY_1_4, @"color2" : COLOR_ACTIVITY_2_4, @"activity_name" : @"Abs4"}
//#define activity5   @{@"color1" : COLOR_ACTIVITY_1_5, @"color2" : COLOR_ACTIVITY_2_5, @"activity_name" : @"Abs5"}
//#define activity6   @{@"color1" : COLOR_ACTIVITY_1_6, @"color2" : COLOR_ACTIVITY_2_6, @"activity_name" : @"Abs6"}
//#define activity7   @{@"color1" : COLOR_ACTIVITY_1_7, @"color2" : COLOR_ACTIVITY_2_7, @"activity_name" : @"Abs7"}
//#define activity8   @{@"color1" : COLOR_ACTIVITY_1_8, @"color2" : COLOR_ACTIVITY_2_8, @"activity_name" : @"Abs8"}
//#define activity9   @{@"color1" : COLOR_ACTIVITY_1_9, @"color2" : COLOR_ACTIVITY_2_9, @"activity_name" : @"Abs9"}
//#define activity10  @{@"color1" : COLOR_ACTIVITY_1_10, @"color2" : COLOR_ACTIVITY_2_10, @"activity_name" : @"Abs10"}
//#define activity11  @{@"color1" : COLOR_ACTIVITY_1_11, @"color2" : COLOR_ACTIVITY_2_11, @"activity_name" : @"Abs11"}
//#define activity12  @{@"color1" : COLOR_ACTIVITY_1_12, @"color2" : COLOR_ACTIVITY_2_12, @"activity_name" : @"Abs12"}
//#define activity13  @{@"color1" : COLOR_ACTIVITY_1_13, @"color2" : COLOR_ACTIVITY_2_13, @"activity_name" : @"Abs13"}
//#define activity14  @{@"color1" : COLOR_ACTIVITY_1_14, @"color2" : COLOR_ACTIVITY_2_14, @"activity_name" : @"Abs14"}
//#define activity15  @{@"color1" : COLOR_ACTIVITY_1_15, @"color2" : COLOR_ACTIVITY_2_15, @"activity_name" : @"Abs15"}
//#define activity16  @{@"color1" : COLOR_ACTIVITY_1_16, @"color2" : COLOR_ACTIVITY_2_16, @"activity_name" : @"Abs16"}
//#define activity17  @{@"color1" : COLOR_ACTIVITY_1_7, @"color2" : COLOR_ACTIVITY_2_7, @"activity_name" : @"Abs16"}
//#define activity18  @{@"color1" : COLOR_ACTIVITY_1_8, @"color2" : COLOR_ACTIVITY_2_8, @"activity_name" : @"Abs16"}
//#define activity19  @{@"color1" : COLOR_ACTIVITY_1_9, @"color2" : COLOR_ACTIVITY_2_9, @"activity_name" : @"Abs16"}
//
////#define activityDict @{@"1" : activity1, @"2" : activity2, @"3" : activity3, @"4" : activity4, @"5" : activity5, @"6" : activity6, @"7" : activity7, @"8" : activity8, @"9" : activity9, @"10" : activity10, @"11" : activity11, @"12" : activity12, @"13" : activity13, @"14" : activity14, @"15" : activity15, @"16" : activity16 }
//
//#define activityDict @{@"1" : activity1, @"2" : activity2, @"3" : activity3, @"4" : activity4, @"5" : activity5, @"6" : activity6, @"7" : activity7, @"8" : activity8, @"9" : activity9, @"10" : activity10, @"11" : activity11, @"12" : activity12, @"13" : activity13, @"14" : activity14, @"15" : activity15, @"16" : activity16, @"17" : activity17, @"18" : activity18, @"19" : activity19 }
//
//
////#define PayU_S_URL      @"http://apiv3.fitpass.co.in/customer/success"
////#define PayU_F_URL      @"http://apiv3.fitpass.co.in/customer/failure"
//#define PayU_S_URL      @"https://api-fitpass.in/customer/success"
//#define PayU_F_URL      @"https://api-fitpass.in/customer/failure"
//
//
//#define FREECHARGE_Channel  @"IOS"
//#define METHOD_FREECHARGE_CHECKSUM    @"customer/freecharge/checksum"
//
//#define CO_CONFIG_FILE_NAME @"checkout_config.properties"
//#define CO_REQUEST_JSON @"co_request_json"
//#define CO_REQUEST_ENCODING @"UTF-8"
//#define PRODUCTION_CO_URL_PAY_INIT @"https://checkout.freecharge.in/api/v1/co/pay/init"
//#define CO_URL_PAY_INIT @"https://checkout-sandbox.freecharge.in/api/v1/co/pay/init"
//#define PRODUCTION_HOST @"checkout.freecharge.in"
//#define SANDBOX_HOST @"checkout-sandbox.freecharge.in"
//#define ALGO @"SHA-256"
//#define ENCODING @"UTF-8"
//#define ENV @"env"
//#define BUILD @"Debug"
//#define RELEASE @"Release"
//#define FB_AUTH_COMPLETE @"m.facebook.com/v2.2/dialog/oauth?"
//#define GOOGLE_AUTH_COMPLETE @"accounts.google.com/o/oauth2/approval"
////#define MERCHANT_ID @"merchant.id"
////#define MERCHANT_KEY @"merchant.key"
////#define FURL @"merchant.furl"
////#define SURL @"merchant.surl"
////#define CHANNEL @"merchant.channel"
//
//
//#define PAYTM_BASE_URL_VERSION                  @"v1"
//
//#define METHOD_PAYTM_INITIATE_TRANSACTION       @"initiateTransaction"
//#define METHOD_PAYTM_FETCH_PAYMENT_OPTIONS      @"fetchPaymentOptions"
//#define METHOD_PAYTM_LOGIN_SEND_OTP             @"login/sendOtp"
//#define METHOD_PAYTM_LOGIN_VALIDATE_OTP         @"login/validateOtp"
//#define METHOD_PAYTM_FETCH_BALANCE_INFO         @"fetchBalanceInfo"
//#define METHOD_PAYTM_FETCH_BIN_DETAIL           @"fetchBinDetail"
//#define METHOD_PAYTM_PROCESS_TRANSACTION        @"processTransaction"
//
//#define RAZOR_PAY_URL                           @"https://api.razorpay.com/v1/"
//#define METHOD_RAZOR_PAY_SUBSCRIPTION           @"subscriptions"
//#define METHOD_RAZOR_PAY_SUBSCRIPTION_CANCEL    @"/cancel"
//#define METHOD_RAZOR_PAY_SUBSCRIPTION_UPDATE    @"update"
//#define CUSTOMER_NOTIFY_BY_FITPASS              @"0"
//#define CUSTOMER_NOTIFY_BY_RAZORPAY             @"1"
//
//#define SCHEDULE_CHANGE_AT_CYCLE_END            @"cycle_end"
//#define SCHEDULE_CHANGE_AT_NOW                  @"now"
//
//#define ACTIVITY_LIST                   @"ACTIVITY_LIST"
//#define ACTIVITY_LIST_SAVE_TIME         @"ACTIVITY_LIST_SAVE_TIME"
//
//
//#define TIME_KEY_1                   @"Early Morning"
//#define TIME_KEY_2                   @"Morning"
//#define TIME_KEY_3                   @"Mid Day"
//#define TIME_KEY_4                   @"Evening"
//#define TIME_KEY_5                   @"Night"
//#define TIME_KEY_6                   @"Late Night"
//
//#define TIME_VALUE_1                   @"05:00 - 07:59"
//#define TIME_VALUE_2                   @"08:00 - 11:59"
//#define TIME_VALUE_3                   @"12:00 - 15:59"
//#define TIME_VALUE_4                   @"16:00 - 19:59"
//#define TIME_VALUE_5                   @"20:00 - 23:59"
//#define TIME_VALUE_6                   @"00:00 - 04:59"
//
//
//#define activityTime1   @{@"key" : TIME_KEY_1, @"value" : TIME_VALUE_1}
//#define activityTime2   @{@"key" : TIME_KEY_2, @"value" : TIME_VALUE_2}
//#define activityTime3   @{@"key" : TIME_KEY_3, @"value" : TIME_VALUE_3}
//#define activityTime4   @{@"key" : TIME_KEY_4, @"value" : TIME_VALUE_4}
//#define activityTime5   @{@"key" : TIME_KEY_5, @"value" : TIME_VALUE_5}
//#define activityTime6   @{@"key" : TIME_KEY_6, @"value" : TIME_VALUE_6}
//
//#define activityTimeArray @[activityTime1, activityTime2, activityTime3, activityTime4, activityTime5, activityTime6]


//#define  NOINTERNET                 @"Please ensure that you are connected to the internet"
////#define  kVALIDUSERNAME             @"Name length should be between 4-75 characters"
//#define  kVALIDUSERNAME             @"Please enter your full name"
//#define  kVALIDEMAILID              @"Please enter a valid email id"
//#define  kVALIDPASSWORDLENGTH       @"Password length should be between 6-16 characters"
//#define  kVALIDMOBILENUMBER         @"Please enter a valid 10 digit mobile number"
//#define  kVALIDPINCODE              @"Please enter a valid 6 digit pincode"
//#define  kAGREETERMS                @"Please agree to the terms & conditions to proceed"
//#define  ERROR_MAIL                 @"Email can't be empty"
//#define  ERROR_PASSWORD             @"Password can't be blank"
//#define  kVALIDCOUPONCODE           @"Please enter a valid coupon code"
//#define  kVALIDOTP                  @"Please enter a valid OTP"
//#define  kVALIDRECIPIENTNAME        @"Please enter a valid name"
//
//#define  TRY_AGAIN                  @"Please try again"

//#define  SUCCESS_CODE               200
//#define  SUCCESS_SHOW_CORPORATE     202
//#define  SUCCESS_SHOW_FEEDBACK_FOR_UNATTENDED_WORKOUT     203
//#define  SUCCESS_BUT_CORPORATE_EXPIRED                    204
//#define  SUCCESS_BUT_CORPORATE_IS_ACTIVE                  205
//#define  SUCCESS_SHOW_SINGLE_CORPORATE_PLAN               206
//#define  SUCCESS_SHOW_CORPORATE_DETAIL_TNC                207
//#define  SUCCESS_SHOW_SINGLE_CORPORATE_PLAN_2             208
//#define  ERROR_CODE_405             405
//#define  ERROR_CODE_406             406
//#define  ERROR_CODE_407             407
//#define  ERROR_CODE_409             409
//#define  ERROR_CODE_412             412
//#define  ERROR_CODE_414             414//same user

//#define TEXTAC                             @"AC"
//#define TEXTWIFI                           @"WiFi"
//#define TEXTPARKING                        @"Parking"
//
//
//// Time
//
//#define hrs24       60*60*24

//#define iOSDeviceHeight                   [[UIScreen mainScreen] bounds].size.height
//#define iOSDeviceWidth                    [[UIScreen mainScreen] bounds].size.width
//
//#define  COLOR_BLURR               UIColorFromRGB(0x1D1D1D)
//
//#define  COLOR_TEXT_BLUE           [UIColor colorWithRed:15.0/255.0 green:31.0/255.0  blue:46.0/255.0  alpha:1.0]
//#define  COLOR_BLUE_2              [UIColor colorWithRed:44.0/255.0 green:61.0/255.0  blue:82.0/255.0  alpha:1.0]
//#define  COLOR_CHERRY              [UIColor colorWithRed:48.0/255.0 green:44.0/255.0  blue:87.0/255.0  alpha:1.0]
//#define  COLOR_CHERRY_LIGHT        [UIColor colorWithRed:141.0/255.0 green:77.0/255.0  blue:170.0/255.0  alpha:1.0]
//
//
//#define  COLOR_GREEN_1             [UIColor colorWithRed:33.0/255.0 green:211.0/255.0  blue:108.0/255.0  alpha:1.0]
//#define  COLOR_GREEN_2             [UIColor colorWithRed:72.0/255.0 green:230.0/255.0  blue:138.0/255.0  alpha:1.0]
//#define  COLOR_GREEN_3             [UIColor colorWithRed:30.0/255.0 green:202.0/255.0  blue:103.0/255.0  alpha:1.0]
//
//#define  COLOR_GRAY_1              [UIColor colorWithRed:235.0/255.0 green:235.0/255.0  blue:235.0/255.0  alpha:1.0]
//#define  COLOR_GRAY_2              [UIColor colorWithRed:178.0/255.0 green:186.0/255.0  blue:204.0/255.0  alpha:1.0]
//#define  COLOR_GRAY_BUTTON         [UIColor colorWithRed:151.0/255.0 green:151.0/255.0  blue:151.0/255.0  alpha:1.0]
//
//#define  COLOR_GRAY_TEXT           [UIColor colorWithRed:216.0/255.0 green:216.0/255.0  blue:216.0/255.0  alpha:1.0]
//#define  COLOR_GRAY_BORDER1        [UIColor colorWithRed:229.0/255.0 green:229.0/255.0  blue:229.0/255.0  alpha:1.0]
//
//#define  COLOR_GRAY_GRADIENT_1              [UIColor colorWithRed:172.0/255.0 green:172.0/255.0  blue:172.0/255.0  alpha:1.0]
//#define  COLOR_GRAY_GRADIENT_2              [UIColor colorWithRed:110.0/255.0 green:110.0/255.0  blue:110.0/255.0  alpha:1.0]
//
//#define  COLOR_TEXT_RED            [UIColor colorWithRed:239.0/255.0 green:75.0/255.0  blue:83.0/255.0  alpha:1.0]
//
//#define  COLOR_PREMIUM_1            [UIColor colorWithRed:241.0/255.0 green:101.0/255.0 blue:75.0/255.0 alpha:1.0]
//#define  COLOR_PREMIUM_2            [UIColor colorWithRed:147.0/255.0 green:36.0/255.0 blue:15.0/255.0 alpha:1.0]
//
//
//#define  UIColorFromRGB(rgbValue) [UIColor \
//colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
//green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
//blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//
//#define MEAL_NAMES                     @[@"EARLY MORNING", @"BREAK FAST", @"MID MORNING", @"LUNCH", @"TEA TIME", @"DINNER", @"POST DINNER"]
//#define MEAL_IDS                      @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"]
//
//#define WT_NUMBER_OF_GLASSES_TOTAL                  @"WT_NUMBER_OF_GLASSES_TOTAL"
//#define WT_NUMBER_OF_GLASSES_INTAKE                 @"WT_NUMBER_OF_GLASSES_INTAKE"
//#define WT_DATE_LAST                                @"WT_DATE_LAST"
//
//#define WT_START_TIME                               @"WT_START_TIME"
//#define WT_END_TIME                                 @"WT_END_TIME"
//#define WT_INTAKE_ARRAY                             @"WT_INTAKE_ARRAY"
//
//#define MinInHr    60
//
//#define DISPLAY_FITHEAL                          @"fpcare_display"
//
//#define REMINDER_TYPE_MEAL                      @"1"
//#define REMINDER_TYPE_WATER                     @"2"
//#define REMINDER_TYPE_WALK                      @"3"
//#define REMINDER_TYPE_WEIGHT                    @"4"
//#define REMINDER_TYPE_WORKOUT                   @"5"
//#define REMINDER_TYPE_HEART                     @"6"
//
//#define CHALLENGE_TYPE_PUSHUP                   @"1"
//#define CHALLENGE_TYPE_SQUATS                   @"2"
//#define CHALLENGE_TYPE_PLANK                    @"3"
//#define CHALLENGE_TYPE_MEALS                    @"4"
//#define CHALLENGE_TYPE_HEART                    @"5"
//#define CHALLENGE_TYPE_STEPS                    @"6"
//#define CHALLENGE_TYPE_RUNNING                  @"7"
//#define CHALLENGE_TYPE_DAILY                    @"8"
//
//#define DIET_PAYMENT_STATUS                    @"DIET_PAYMENT_STATUS"
//#define DIET_STATUS_PAID                       @"DIET_STATUS_PAID"
//#define DIET_STATUS_UNPAID                     @"DIET_STATUS_UNPAID"
//#define DIET_STATUS_CONVERTED                  @"DIET_STATUS_CONVERTED"
//
//#define FACEBOOK_APP_ID                        @"1834349830112146"
//#define FACEBOOK_USER_ID                       @"FACEBOOK_USER_ID"
//#define TWITTER_USER_ID                        @"TWITTER_USER_ID"
//#define GOOGLE_USER_ID                         @"GOOGLE_USER_ID"
//
//#define FITPASS_FACEBOOK_USER_ID                       @"facebook_user_id"
//#define FITPASS_TWITTER_USER_ID                        @"twitter_user_id"
//#define FITPASS_GOOGLE_USER_ID                         @"google_user_id"
//
//#define USER_WORKOUT_VIDEO_CATEGORY_ID                 @"workout_video_category_id"
//#define USER_WORKOUT_CATEGORY_CHANGEED_COUNT           @"USER_WORKOUT_CATEGORY_CHANGEED_COUNT"
//
//#define FITPASS_DESCRIPTION                            @"Get. Set. Sweat."


////STAGING
//#define FITPASS_API                             @"DEV"
//#define SERVER_URL_SECURE                       @"https://api.fitpass.dev/"
//#define SERVER_URL                              @"https://api.fitpass.dev/customer/"
//#define SERVER_URL_MAIN                         @"https://api.fitpass.dev/"
//#define SERVER_URL_MAIN_GO                      @"https://customer-api.fitpass.dev/"
//#define SERVER_URL_TRANSACTION                  @"https://events.fitpass.dev/"
//#define SUBSCRIPTION_TERMS_AND_CONDITION        @"https://fitpass.dev/subscription?is_app=true"
//#define BAMBUSER_APP_ID                         @"wRvFQjdaKxAHvNXe15YFIw"
//
//#define PAYU_ENVIRONMENT                                  @"Test"
//
//#define PAYTM_WEBSITE                           @"APPSTAGING"
//#define PAYTM_INDUSTRY_ID                       @"Retail"
//#define PAYTM_CHANNEL_ID                        @"WAP"
//#define PAYTM_BASE_URL                          @"https://securegw-stage.paytm.in/theia/api/"
//#define PAYTM_CALLBACK_URL                      @"https://securegw-stage.paytm.in/theia/paytmCallback"
//#define PAYTM_GENERATE_CHECKSUM_URL             @"https://api.fitpass.dev/customer/paytm/validatechecksum"
//#define PAYTM_TRANSACTION_STATUS                @"https://securegw-stage.paytm.in/merchant-status/getTxnStatus"
//
//#define FREECHARGE_BuildType  @"Debug"
//#define FREECHARGE_EnvType  @"Sandbox"
//
//#define isAmazonStaging      1
//#define AMAZON_ENDPOINT                 @"https://api.fitpass.dev/amazonpay"
//
//#define PAYPAL_BASE_URL_1              @"https://api.sandbox.paypal.com/v1/"
//#define PAYPAL_BASE_URL_2              @"https://api.sandbox.paypal.com/v2/"
//

////PRODUCTION
//#define FITPASS_API                             @"LIVE"
//#define SERVER_URL_SECURE                       @"https://api.fitpass.live/"
//#define SERVER_URL                              @"https://api-fitpass.in/customer/"
//#define SERVER_URL_MAIN                         @"https://api-fitpass.in/"
//#define SERVER_URL_MAIN_GO                      @"https://customer-go-lang.api-fitpass.in/"
//#define SERVER_URL_TRANSACTION                  @"https://events.fitpass.live/"
//#define SUBSCRIPTION_TERMS_AND_CONDITION        @"https://fitpass.co.in/subscription?is_app=true"
//#define BAMBUSER_APP_ID                         @"qy0MhTtDXRsAsDIZTyAlQg"

//#define PAYU_ENVIRONMENT                                  @"Production"
//
//#define PAYTM_WEBSITE                           @"Fitpasswap"
//#define PAYTM_INDUSTRY_ID                       @"Retail108"
//#define PAYTM_CHANNEL_ID                        @"WAP"
//#define PAYTM_BASE_URL                          @"https://securegw.paytm.in/theia/api/"
//#define PAYTM_CALLBACK_URL                      @"https://securegw.paytm.in/theia/paytmCallback"
//#define PAYTM_GENERATE_CHECKSUM_URL             @"https://api-fitpass.in/customer/paytm/validatechecksum"
//#define PAYTM_TRANSACTION_STATUS                @"https://securegw.paytm.in/merchant-status/getTxnStatus"
//
//#define FREECHARGE_BuildType  @"Release"
//#define FREECHARGE_EnvType  @"Production"
//
//#define isAmazonStaging      0
//#define AMAZON_ENDPOINT                 @"https://api-fitpass.in/amazonpay"
//
//#define PAYPAL_BASE_URL_1              @"https://api.paypal.com/v1/"
//#define PAYPAL_BASE_URL_2              @"https://api.paypal.com/v2/"
//
//
////Go API's
//#define METHOD_FITFEAST_FOOD_SUGGESTION           @"fitfeast/user-food-suggestion"
//#define METHOD_GET_WEEKLY_RESERVATION             @"get-weekly-workout-reservations"
//#define METHOD_GET_USER_PROFILE                   @"get-user-profile"
//#define METHOD_UPDATE_USER_PROFILE                @"profile/user-basic-details"
//
//
//// Paypal API's
//#define METHOD_PAYPAL_ACCESS_TOKEN              @"payments/paypal/authtoken"
////#define METHOD_PAYPAL_ACCESS_TOKEN              @"oauth2/token"
//#define METHOD_PAYPAL_CHECKOUT_ORDER            @"checkout/orders"
//#define METHOD_PAYPAL_STC                       @"risk/transaction-contexts/"
//#define METHOD_PAYPAL_CAPTURE_ORDER             @"/capture"
//
////Payment API's
//#define METHOD_PENDING_ORDER                    @"transaction/pending-order"
//#define METHOD_PAYMENT_CANCELLED_BY_USER        @"event/payment-cancelled"
//#define METHOD_PAYMENT_RETURN_URL               @"event/payment-status"
//#define METHOD_PAYMENT_CONFIRM                  @"payment/order-confirmation"


//#define METHOD_WORKOUT_NOT_ATTENDED            @"customer/notattendedworkoutfeedback"
//
//#define METHOD_OFFER_URL                       @"deeplink/offerplan/getoffer"
//#define METHOD_INVOICE_DETAIL                  @"getinvoicedetails"
//#define METHOD_AFFILIATE_DETAIL                @"affiliate"
//#define METHOD_ACTIVATE_AFFILIATE_MEMBERSHIP   @"affiliate/activatemembership"
//
////FITHEAL
//#define METHOD_CARE_LANDING                    @"care/getdetails"
//#define METHOD_CARE_CLAIM_VOUCHER              @"care/claimvoucher"
//
////in use
//#define METHOD_DIET_UPDATE_CHAT                @"diets/dietchatindex"
//#define METHOD_DIET_WEIGHT_DELETE              @"diets/deleteuserweight"
////in use
//
//
//#define FRESHCHAT_RESTORE_ID                   @"FRESHCHAT_RESTORE_ID"
//#define FRESHCHAT_EXTERNAL_ID                  @"freshchat_external_id"
//#define FRESHCHAT_RESTORE_ID_UPDATED           @"FRESHCHAT_RESTORE_ID_UPDATED"
//#define METHOD_FRESHCHAT_RESTORE_ID_GET        @"freshchat/get"
//#define METHOD_FRESHCHAT_RESTORE_ID_CREATE     @"freshchat/create"
//
//#define FITPASS_REDIRECT_URL                   @"redirecturlscreen"
//
//#define FITPASS_MUTUAL_FREINDS                 @"addmutualfriends"
//
//#define FITPASS_PAYMENT_FOR                    @"FITPASS_PAYMENT_FOR"
//
//#define UBER_AUTH_KEY                          @"Token B8i8lg109n-S3CF0R4IqW-pF2Cv05kqP-F25t8b6";
//#define UBER_ESTIMATES_TIME                    @"https://api.uber.com/v1.2/estimates/time?";
//#define UBER_AUTH_KEY_VALUE                    @"Authorization"
//#define METHOD_FITPASS_LOGIN                   @"login"
//#define METHOD_FITPASS_LOGIN_WITH_SOCIALMEDIA  @"loginwithsocialmedia"
//#define UBER_PRICE                             @"https://api.uber.com/v1.2/estimates/price?"
//
//#define UberCLIENT_ID                          @"Juv924yrt_N51LgK0PIqP2QAlWzjRjJM"
//#define UberCLIENT_SECRET                      @"swtlfhZa1Yq2wU6VI5pc1IRXu9QCES2qmzexYIWP"
//#define UberSERVER_TOKEN                       @"B8i8lg109n-S3CF0R4IqW-pF2Cv05kqP-F25t8b6"


//#define METHOD_FITPASS_FORGOT_PASSWORD         @"forgotpassword"
//
//#define METHOD_FITPASS_DASHBOARD               @"customer/home"
//#define METHOD_FITPASS_HOME                    @"customer/homes/homev2"
//#define METHOD_FITPASS_HOME_v3                 @"customer/homes-v3/home"
////#define METHOD_CORPORATE                       @"customer/corporatepageviews"
//
//#define METHOD_ADDRESS_LIST                    @"customer/addresslist"
//
//#define METHOD_WORKOUT_ACTIVITY                @"customer/workoutactivity"
//#define METHOD_HASH_GENERATOR                  @"customer/hashkeygenerator"
//
//
//#define METHOD_STUDIO_LIST                     @"customer/studios"
//#define METHOD_STUDIO_REVIEW_LIST              @"customer/studios/reviews"
//#define METHOD_STUDIO_SEARCH                   @"customer/searchstudio"
//#define METHOD_STUDIO_FIND                     @"customer/studios/findstudio"
//#define METHOD_STUDIO_DETAIL                   @"customer/studiodetails"
//#define METHOD_WORKOUT_LIST                    @"customer/workouts"
//#define METHOD_WORKOUT_DETAIL                  @"customer/workoutdetails"
//#define METHOD_WORKOUT_RESERVE                 @"customer/reserveworkout"
//#define METHOD_WORKOUT_CANCEL                  @"customer/cancelworkout"
//#define METHOD_WORKOUT_UPDATE                  @"customer/updateworkouts"
//#define METHOD_FITPASS_COUPON                  @"customer/applycoupon"
//#define METHOD_FITPASS_COUPON_2                @"customer/validate-coupon"
//
//#define METHOD_FITPASS_SAVE_PENDING_ORDER      @"save-pending-orders"
//#define METHOD_FITPASS_INITIATE_SUBSCRIPTION   @"initiate-subscription/initiate"
//#define METHOD_FITPASS_UPDATE_ORDER            @"updateorderstatus"
//#define METHOD_FITPASS_BUYFIT_PRIME            @"fitprimetransaction"
//
//#define METHOD_ADD_FAVORITE                    @"customer/addfavouritesstudio"
//#define METHOD_ADD_REVIEW                      @"customer/rateandreviews"
//#define METHOD_WORKOUT_LIST_MY                 @"customer/mystudioworkouts"
//#define METHOD_USER_OTP                        @"customer/userotp"
//#define METHOD_USER_REGISTRATION               @"customer/register"
//#define METHOD_USER_UPDATE_PROFILE             @"customer/updateuserdetails"
//#define METHOD_USER_CHANGE_PASSWORD            @"changepassword"
//#define METHOD_USER_UPLOAD_PROFILE_PIC         @"customer/uploadphoto"
//#define METHOD_USER_DELETE_ACCOUNT             @"customer/users/delete-account"
//
//#define METHOD_URC_STATUS                      @"customer/urcverification/viewreservationschedules"
//#define METHOD_SCAN_QR_CODE                    @"customer/scan-qr"
//#define METHOD_CONFIRM_WORKOUT                 @"customer/confirmworkouts"
//#define METHOD_SET_PLACES                      @"customer/user-places/setplaces"
//
//#define METHOD_CORPORATE_REGISTRATION          @"customer/corporateuserregistration"
//#define METHOD_CORPORATE_WELLNESS_REGISTRATION @"customer/corporatewellnessregistration"
//#define METHOD_CORPORATE_WELLNESS_DETAILS      @"customer/corporatewelnessdetails"
//
//
//#define METHOD_FITSHOP_CART_WEB                @"fitshop/offercart"
//
//#define METHOD_FITSHOP_MYORDERS                @"fitshop/myorders"
//#define METHOD_TRANSACTION_HISTORY             @"customer/transactionhistory"
//
//#define METHOD_VERIFY_DEVICE                   @"customer/verifydevice"
//#define METHOD_RESEND_VERIFY_MESSAGE           @"customer/resendverificationmessage"
//
//#define METHOD_VERIFY_VMN_RESPONSE             @"vmn-response/getresponse"
//
//#define METHOD_FITSHOP_PRODUCT_SEARCH          @"fitshop/productsearch"
//#define METHOD_FITSHOP_CATEGORY                @"fitshop/category"
//#define METHOD_FITSHOP_PRODUCT_DETAIL          @"fitshop/productdetails"
//#define METHOD_FITSHOP_PRODUCT_LIST            @"fitshop/productlist"
//#define METHOD_FITSHOP_VIEW_PRODUCT_IN_CART    @"fitshop/viewproductincart"
//#define METHOD_FITSHOP_RATE_AND_REVIEWS        @"fitshop/rateandreviews"
//#define METHOD_FITSHOP_ADD_PRODUCT_INCART      @"fitshop/addproductincart"
//#define METHOD_FITSHOP_REMOVE_PRODUCT_INCART   @"fitshop/removeproductincart"
//#define METHOD_FITSHOP_BUYMEMBERSHIP           @"fitshop/fitshoporder"
//
//#define METHOD_COUPON_LIST                     @"customer/getcouponlist"
//
//#define PAYMENT_MODE_PAYU                      @"Payu"
//#define PAYMENT_MODE_PAYTM                     @"PAYTM"
//#define PAYMENT_MODE_RAZORPAY                  @"Razorpay"
//#define PAYMENT_MODE_AMAZON_PAY                @"Amazon Pay"
//#define PAYMENT_MODE_FREECHARGE                @"Freecharge"
//#define PAYMENT_MODE_PAYPAL                    @"Paypal"
//
//#define PAYMENT_STATUS_FAILURE                 @"failure"
//#define PAYMENT_STATUS_SUCCESS                 @"success"
//#define METHOD_PAYMENT_FAILED                  @"payment failed"
//
//
//#define PAYMENT_WALLET_ID_PAYTM                     1
//#define PAYMENT_WALLET_ID_AMAZON_PAY                2
//#define PAYMENT_WALLET_ID_FREECHARGE                3
//#define PAYMENT_WALLET_ID_PAYPAL                    4
//#define PAYMENT_WALLET_ID_GPAY                      5
//#define PAYMENT_WALLET_ID_AIRTEL_MONEY              6
//
//
//#define METHOD_BLOG_BLOGLIST                   @"blog/bloglist"
//#define METHOD_BLOG_ADD_FAVOURTIES_AND_LIKE    @"blog/addfavourites"
//#define METHOD_BLOG_BLOG_SEARCH                @"blog/search"
//#define METHOD_HELP_QUESTION_LIST              @"help/questionlist"
//#define METHOD_HELP_SUBMIT_QUERY               @"help/submitquery"
//
//#define APPLY_REFERRAL_CODE                    @"customer/applyreferralcode"
//#define METHOD_DELETE_ADDRESS                  @"customer/deleteaddress"
//#define SendArrayFitpassCartVC                 @"SendArrayFitpassCartVC"
//#define SetNumberOfCardAdd                     @"SetNumberOfCardAdd"
//
//#define METHOD_PAGE_ABOUT                      @"page/about?type=ios"
//#define METHOD_PAGE_FAQ                        @"page/faq?type=ios"
//#define METHOD_PAGE_TERMAND_CONDITION          @"page/termandconditions?type=ios"
//#define METHOD_PAGE_PRIVACY_POLICY             @"page/privacypolicy?type=ios"
//
//#define METHOD_CUSTOMER_ADDRESS                @"customer/customeraddress"

////HRA
//#define METHOD_HRA_GET_QUESTION                @"health-risk-assessment/list"
//#define METHOD_HRA_ADD_ANSWERS                 @"health-risk-assessment/add-update"
//
////HELP
//#define METHOD_HELP_GET_CATEGORIES             @"help/workout"
//#define METHOD_HELP_CREATE_TICKET              @"customer/create-ticket"
//
//#define NOTIFICATION_ADD_ITEM                  @"NOTIFICATION_ADD_ITEM"
//#define NOTIFICATION_ADD_ITEM_PENDING          @"NOTIFICATION_ADD_ITEM_PENDING"
//#define METHOD_PAYMENT_SUCCESS_DONE            @"METHOD_PAYMENT_SUCCESS_DONE"
//#define NOTIFICATION_WORKOUT_DONE              @"NOTIFICATION_WORKOUT_DONE"
//
//#define CORPORATE_REGISTRATION_LIST            @"CORPORATE_REGISTRATION_LIST"

#define fontGothamHTF_Black                        @"GothamHTF-Black"
#define fontGothamHTF_Ultra                        @"GothamHTF-Ultra"
#define fontGothamHTF_Bold                         @"GothamHTF-Bold"
#define fontGothamHTF_Bold_Italic                  @"GothamHTF-BoldItalic"
#define fontGothamHTF_Light                        @"GothamHTF-Light"
#define fontGothamHTF_Medium                       @"GothamHTF-Medium"
#define fontGothamHTF_Book                         @"GothamHTF-Book"

#define fontSFProDisplay_Bold                      @"SFProDisplay-Bold"
#define fontSFProDisplay_Medium                    @"SFProDisplay-Medium"
#define fontSFProDisplay_Regular                   @"SFProDisplay-Regular"
#define fontSFProDisplay_RegularItalic             @"SFProDisplay-RegularItalic"
#define fontSFProDisplay_Semibold                  @"SFProDisplay-Semibold"
#define fontSFProDisplay_SemiboldItalic            @"SFProDisplay-SemiboldItalic"

#define fontDIN_Bold                               @"DIN-Bold"
#define fontDIN_Medium                             @"DIN-Medium"
#define fontDIN_Regular                            @"DIN-Regular"

//#define fontfontGothamHTF_Medium10                 [UIFont fontWithName:fontGothamHTF_Medium size:10]
//#define fontfontGothamHTF_Medium11                 [UIFont fontWithName:fontGothamHTF_Medium size:11]
//#define fontfontGothamHTF_Medium12                 [UIFont fontWithName:fontGothamHTF_Medium size:12]
//#define fontfontGothamHTF_Medium13                 [UIFont fontWithName:fontGothamHTF_Medium size:13]
//#define fontfontGothamHTF_Medium14                 [UIFont fontWithName:fontGothamHTF_Medium size:14]
//#define fontfontGothamHTF_Medium15                 [UIFont fontWithName:fontGothamHTF_Medium size:15]
//#define fontfontGothamHTF_Medium16                 [UIFont fontWithName:fontGothamHTF_Medium size:16]
//#define fontfontGothamHTF_Medium17                 [UIFont fontWithName:fontGothamHTF_Medium size:17]
//#define fontfontGothamHTF_Medium18                 [UIFont fontWithName:fontGothamHTF_Medium size:18]
//#define fontfontGothamHTF_Medium19                 [UIFont fontWithName:fontGothamHTF_Medium size:19]
//#define fontfontGothamHTF_Medium20                 [UIFont fontWithName:fontGothamHTF_Medium size:20]
//
//#define ACTION_TYPE_HEART_RATE                     @"heart_rate"
//#define ACTION_TYPE_STEPS                          @"daily_step"
//#define ACTION_TYPE_CALORIE_BURN                   @"calorie_counter"
//#define ACTION_TYPE_SLEEP                          @"daily_sleep"
//
//#define ACTION_TYPE_CHALLENGE_INVITATION           @"challengeinvitationcard"
//#define ACTION_TYPE_WATERLOG                       @"water_log"
//#define ACTION_TYPE_WEIGHTLOG                      @"weight_log"
//#define ACTION_TYPE_HRA_COMPLETE                   @"hra_not_complete"
//#define ACTION_TYPE_WORKOUT                        @"upomingworkout"
//#define ACTION_TYPE_MEALLOG                        @"meallog"
//#define ACTION_TYPE_NOTICE                         @"notice"
//#define ACTION_TYPE_MEMBERSHIP                     @"buymembership"
//#define ACTION_TYPE_SUBSCRIPTION                   @"subscription"
//#define ACTION_TYPE_RENEWAL                        @"renewals"
//#define ACTION_TYPE_REFER                          @"refer_a_friend"
//#define ACTION_TYPE_CORPORATE                      @"corporate"
//
//
//#define PRODUCT_TYPE_FITPASS                       @"1"
//#define PRODUCT_TYPE_FITFEAST                      @"2"
//#define PRODUCT_TYPE_FITCOACH                      @"3"
//#define PRODUCT_TYPE_FITSHOP                       @"4"
//#define PRODUCT_TYPE_FITPRIME                      @"5"
//#define PRODUCT_TYPE_TV                            @"14"
//#define PRODUCT_TYPE_PT                            @"18"
//
//#define PRODUCT_NAME_FITPASS                       @"FITPASS"
//#define PRODUCT_NAME_FITFEAST                      @"FITFEAST"
//#define PRODUCT_NAME_FITCOACH                      @"FITCOACH"
//#define PRODUCT_NAME_FITSHOP                       @"FITSHOP"
//#define PRODUCT_NAME_FITPRIME                      @"FITPRIME"
//#define PRODUCT_NAME_TV                            @"FITPASS TV"
//#define PRODUCT_NAME_PT                            @"PT"

//**************************************************************************************
//               BELOW ARE THE NSUSERDEFAULTS FUNCTIONS
//**************************************************************************************

//#define  USERDEFAULTS                [NSUserDefaults standardUserDefaults]
//#define  SYNCHRONISE                 [[NSUserDefaults standardUserDefaults] synchronize]
//#define  GETVALUE(keyname)           [[NSUserDefaults standardUserDefaults] valueForKey:keyname]
//#define  SETVALUE(value,keyname)     [[NSUserDefaults standardUserDefaults] setValue:value forKey:keyname]

//**************************************************************************************


#define APP_SESSION_NEW                       @"AppSessionNew"

#define DEVICE_TOKEN                       @"DEVICE_TOKEN"
#define DEVICE_ID                          @"DEVICE_ID"
#define FC_TITLE                       @"FC_TITLE"
#define FF_TITLE                       @"FF_TITLE"

#define USER_TYPE                       @"iOS"
//#define FBUSERIMAGE                     @"userImage"

#define PaymentType_Gym_Membership          @"Gym Membership"
#define PaymentType_Diet_Membership         @"Nutritionist"
#define PaymentType_Coach_Membership        @"Fit-Coach"
#define PaymentType_Fitshop                 @"Fitshop"
#define PaymentType_Fitprime                @"FitPrime"
#define PaymentType_Magnum                  @"Magnum"
#define PaymentType_Invoice                 @"Invoice"


#define PLACEHOLDER_EMAIL             @"EMAIL ADDRESS"
#define PLACEHOLDER_PASS              @"Password"
#define PLACEHOLDER_PASS_CONFIRM              @"Confirm Password"

#define  stringEnterCouponCode      @"Code"
#define RUPEE_SYMBOL        @"₹"
#define CURRENCY_NAME       @"INR"

//keypad
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 200;

//#define CHATBOT_TYPE_DATE               @"date"
//#define CHATBOT_TYPE_GREETING           @"greeting"
//#define CHATBOT_TYPE_TAG                @"tag"
//#define CHATBOT_TYPE_HEIGHT             @"height"
//#define CHATBOT_TYPE_WEIGHT             @"weight"
//#define CHATBOT_TYPE_GENDER             @"gender"
//#define CHATBOT_TYPE_BMI                @"bmi"
//#define CHATBOT_TYPE_ARTICLE            @"article"
//#define CHATBOT_TYPE_METADATA           @"link"
//#define CHATBOT_TYPE_DIET               @"diet"
//#define CHATBOT_TYPE_ACTION             @"action"
//#define CHATBOT_TYPE_ACTION_AFTER_ONBOARD @"action_2"
//#define CHATBOT_TYPE_WATER              @"water"
//#define CHATBOT_TYPE_WATER_TAG          @"watertag"
//#define CHATBOT_TYPE_WATER_POST         @"waterpost"
//#define CHATBOT_TYPE_SCHEDULE_CALL      @"schedulecall"
//#define CHATBOT_TYPE_INPUT              @"input"
//#define CHATBOT_TYPE_DIET_AFTER         @"after-diet"
//
//#define CHATBOT_KEY_WEIGHT_BMI          @"bmi"
//#define CHATBOT_KEY_WEIGHT_DIFF         @"prevWeightDiff"
//#define CHATBOT_KEY_WEIGHT_LOGGED       @"isWeightLogged"


#define FITCOACH_TYPE_PREMIUM           @"Premium"

#define CHATBOT_TYPE_FITCOACH_RUNNING           @"running"

#define CHATBOT_TYPE_FITCOACH_CATEGORY          @"fitcoach-category"
#define CHATBOT_TYPE_FITCOACH_VIDEOS            @"fitcoach-videos"
#define CHATBOT_TYPE_FITCOACH_WORKOUT           @"fitcoach-workout"
#define CHATBOT_TYPE_FITCOACH_AFTER_WORKOUT     @"after-workout"
#define CHATBOT_TYPE_FITCOACH_BUY               @"fitcoach-buy"

#define CHATBOT_NUTRITION_TO_UPLOAD             @"CHATBOT_NUTRITION_TO_UPLOAD"
#define CHATBOT_NUTRITION_TO_SAVE               @"CHATBOT_NUTRITION_TO_SAVE"
#define CHATBOT_NUTRITION_QUSETION_INDEX        @"CHATBOT_NUTRITION_QUSETION_INDEX"
#define CHATBOT_NUTRITION_CHAT_INDEX            @"CHATBOT_NUTRITION_CHAT_INDEX"

#define CHATBOT_FITCOACH_TO_UPLOAD              @"CHATBOT_FITCOACH_TO_UPLOAD"
#define CHATBOT_FITCOACH_TO_SAVE                @"CHATBOT_FITCOACH_TO_SAVE"
#define CHATBOT_FITCOACH_QUSETION_INDEX         @"CHATBOT_FITCOACH_QUSETION_INDEX"



#define LOCATION_SHOULD_CHANGE                  @"LOCATION_SHOULD_CHANGE"
#define LOCATION_SHOULD_CHANGE_FOR_STUDIOLIST   @"LOCATION_SHOULD_CHANGE_FOR_STUDIOLIST"

#define SELECTED_TABBAR_INDEX                @"SELECTED_TABBAR_INDEX"
#define SELECTED_TABBAR_INDEX_PREVIOUS       @"SELECTED_TABBAR_INDEX_PREVIOUS"


//#define CHATBOT_NUTRITION_ONBOARDED             @"CHATBOT_NUTRITION_ONBOARDED"
//test commit

#define FITFEAST_TABLE                  @"FITFEAST_ENTITY"
#define NOTIFICATION_TABLE              @"NOTIFICATION_ENTITY"

#define RESERVE_WORKOUT_TITLE                  @"Reserve Workout"
#define RESERVE_WORKOUT_MESSAGE                @"Are you sure you want to confirm this workout"

#define CANCEL_WORKOUT_TITLE                  @"Cancel Workout"
#define CANCEL_WORKOUT_MESSAGE                @"Are you sure you want to cancel this workout"


#define IsGymMembershipActive                @"IsGymMembershipActive"

#define ConstantDeductionForMealLogWidth   170
#define ConstantDeductionForMealLogWidth2  60

//#define METHOD_UPDATE_CORPORATE_DETAIL                        @"updatecorporateuserdetails"


#define METHOD_FITPASS_IMPORT_CONTACTS                        @"importusermobile"
#define METHOD_FITPASS_GET_REWARDS                            @"getrewards"
#define METHOD_FITPASS_REDEEM_REWARDS                         @"redeemreward"

#define CONTACT_LIST_TO_UPLOAD                                @"CONTACT_LIST_TO_UPLOAD"
#define CONTACT_LIST_TO_DELETE                                @"CONTACT_LIST_TO_DELETE"

#define EARN_MONEY_TAPPED                                     @"EARN_MONEY_TAPPED"
#define AMEX_VIEW_TAPPED_NO                                   @"AMEX_VIEW_TAPPED_NO"

//MAGNUM AGENT
#define METHOD_MA_DASHBOARD                      @"fitcard/agent/dashboard"
#define METHOD_MA_ADD_CUSTOMER                   @"fitcard/addcustomers"
#define METHOD_MA_UPDATE_BANK_DETAIL             @"fitcard/agent/updatebankdetails"
#define METHOD_MA_PENDING_ORDER                  @"fitcard/agent/pendingorder"
#define METHOD_MA_LEADS                          @"fitcard/agent/leads"
#define METHOD_MA_CUSTOMER                       @"fitcard/agent/customerlist"
#define METHOD_MA_ADD_ACTIVITY                   @"fitcard/agent/addactivity"
#define METHOD_MA_UPLOAD_DOC                     @"fitcard/agent/updatedocuments"


#define METHOD_MAGNUM_ADD_USER_DETAIL            @"fitcard/addmagnumuserdetails"
#define METHOD_MAGNUM_BUYMEMBERSHIP              @"fitcardtransaction"

//#define GROUP_TODAY                              @"group.com.fitpassBusinessVenture.fitpass.Today"
//#define BI_TODAY                                 @"com.fitpassBusinessVenture.fitpass.Today"
//#define WORKOUT_LIST                             @"WorkoutList"


#define INSTAGRAM_AUTHURL                       @"https://api.instagram.com/oauth/authorize/"
#define INSTAGRAM_USER_INFO                     @"https://api.instagram.com/v1/users/self/?access_token="

#define INSTAGRAM_CLIENT_ID                     @"c525f360e15648afb6f3b2e6eb1ee1fa"
//#define INSTAGRAM_CLIENTSERCRET                 @"026b05b5bf98421f824903a7aff81547"
#define INSTAGRAM_REDIRECT_URI                  @"https://fitpass.co.in/instagram_login"
#define INSTAGRAM_ACCESS_TOKEN                  @"access_token"
#define INSTAGRAM_SCOPE                         @"follower_list+public_content" /* add whatever scope you need https://www.instagram.com/developer/authorization/ */

#define TYPE_ID_SUBSCRIPTION                    24
#define TYPE_ID_CORPORATE                       25
#define TYPE_ID_CORPORATE_AMWAY                 27


#define htmlStart                  @"<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY>"
#define htmlEnd                    @"</BODY></HTML>"

//#define htmlStart = @"<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY>"
//#define htmlEnd = @"</BODY></HTML>"


#define REDIRECT_URL                              @"REDIRECT_URL"
#define REFERRAL_SOURCE                           @"REFERRAL_SOURCE"
#define REFERRAL_CHANNEL                          @"REFERRAL_CHANNEL"
#define CAMPAIGN_NAME                             @"CAMPAIGN_NAME"

#define REDIRECT_URL_PARAMS                              @"Open_Redirect_URL"

#define REDIRECT_URL_MARKETING                           @"marketing_ads"

#define REDIRECT_URL_SHIPPING_ADDRESS                    @"shipping_address"
#define REDIRECT_URL_HRA_COMPLETE                        @"hra_complete"
#define REDIRECT_URL_WATER_TRACKER                       @"water_tracker"
#define REDIRECT_URL_WEIGHT_LOG                          @"weight_log"
#define REDIRECT_URL_DAILY_STEPS                         @"daily_steps"
#define REDIRECT_URL_HEART_RATE                          @"heart_rate"
#define REDIRECT_URL_SCHEDULE_CALL                       @"schedule_a_call"
#define REDIRECT_URL_BLOG_LIST                           @"blog_list"
#define REDIRECT_URL_BLOG_DETAIL                         @"blog_detail"
//#define REDIRECT_URL_STUDIO_LIST                         @"studio_list"
#define REDIRECT_URL_STUDIO_DETAIL                       @"studio_detail"
#define REDIRECT_URL_FITSHOP_HOME                        @"fitshop_home"
#define REDIRECT_URL_FITSHOP_PRODUCT                     @"fitshop_product"
#define REDIRECT_URL_FITPASS                             @"studios"
#define REDIRECT_URL_FITFEAST                            @"fitfeast"
#define REDIRECT_URL_FITCOACH                            @"fitcoach"
#define REDIRECT_URL_BUY_MEMBERSHIP                      @"buymembership"
#define REDIRECT_URL_SUBSCRIBE                           @"subscribe"
#define REDIRECT_URL_FITPASS_TV                          @"fitpass_tv"
#define REDIRECT_URL_UPDATE_PROFILE                      @"update_details"
#define REDIRECT_URL_FITCASH                             @"fitcash"
#define REDIRECT_URL_FITGIFT                             @"fitgift"

#define REDIRECT_URL_CORPORATE                           @"corporate"
#define REDIRECT_URL_CORPORATE_WELNESS                   @"corporate_wellness"
#define REDIRECT_URL_AMWAY_ONBOARDING                    @"amway_onboarding"
#define REDIRECT_URL_FITPASS_TV_TRAINER_DETAIL           @"fitpass_tv_trainer_detail"


//EVENTS
#define EVENT_APP_NAVIGATION                              @"APP_NAVIGATION"
#define EVENT_LOGIN                                       @"LOGIN"
#define EVENT_USER_REGISTRATION                           @"USER_REGISTRATION"
#define EVENT_HOME                                        @"HOME"
#define EVENT_MEMBERSHIP_SCREEN                           @"MEMBERSHIP"
#define EVENT_PROFILE_SCREEN                              @"PROFILE"
#define EVENT_PROFILE_SETTINGS_SCREEN                     @"PROFILE_SETTINGS"
#define EVENT_FITFEAST_HOME                               @"FITFEAST_HOME"
#define EVENT_FITFEAST_LOG_MEAL                           @"FITFEAST_LOG_MEAL"
#define EVENT_FITFEAST_FOOD_DETAIL                        @"FOOD_DETAIL"
#define EVENT_FITFEAST_ADD_FOOD                           @"ADD_UPDATE_FOOD"
#define EVENT_STUDIO_LIST                                 @"STUDIO_LIST"
#define EVENT_STUDIO_FILTER                               @"STUDIO_FILTER"
#define EVENT_STUDIO_DETAIL                               @"STUDIO_DETAIL"
#define EVENT_PENDING_ORDER                               @"PENDING_ORDER"
#define EVENT_PROFILE_UPDATE                              @"PROFILE_UPDATE"
#define EVENT_MARKETING_ADS                               @"MARKETING_ADS"
#define EVENT_CORPORATE_JOURNEY                           @"CORPORATE_JOURNEY"
#define EVENT_RESERVE_WORKOUT                             @"WORKOUT_RESERVED"
#define EVENT_CANCEL_WORKOUT                              @"WORKOUT_CANCELLED"
#define EVENT_LOCATION_CHANGE                             @"LOCATION_CHANGE"
#define EVENT_ADD_TO_CART                                 @"ADD_TO_CART"

#define EVENT_TRANSACTION                                 @"TRANSACTION"
#define EVENT_RECENT_FROM_PRODUCT                         @"RECENT_PRODUCT"

#define EVENT_MEAL_REMINDER                               @"MEAL_REMINDER"
#define EVENT_WATER_REMINDER                              @"WATER_REMINDER"
#define EVENT_WORKOUT_REMINDER                            @"WORKOUT_REMINDER"
#define EVENT_WALK_REMINDER                               @"WALK_REMINDER"
#define EVENT_WEIGHT_REMINDER                             @"WEIGHT_REMINDER"
#define EVENT_HEART_RATE_REMINDER                         @"HEART_RATE_REMINDER"

#define EVENT_ADD_FITCASH                                 @"ADD_FITCASH"
#define EVENT_INVITE_A_FFRIEND                            @"INVITE_A_FRIEND"
#define EVENT_REDEEM_VOUCHER                              @"REDEEM_VOUCHER"

#define EVENT_FITGIFT_DETAIL                              @"FITGIFT_DETAIL"
#define EVENT_FITGIFT_ADD_RECIPIENT                       @"FITGIFT_ADD_RECIPIENT"

//EVENTS_KEY
#define EVENT_SCREEN_ACTION                               @"action"

#define EVENT_USER_REGISTRATION_KEY_SOURCE                @"registration_source"
#define EVENT_SCREEN_SOURCE                               @"screen_source"

#define EVENT_KEY_PRODUCT                                 @"product"

//EVENT_ACTION_SOURCE
#define EVENT_ACTION_SOURCE_HOME                          @"HOME"
#define EVENT_ACTION_SOURCE_FITPASS                       @"FITPASS"
#define EVENT_ACTION_SOURCE_FITFEAST                      @"FITFEAST"
#define EVENT_ACTION_SOURCE_FITCOACH                      @"FITCOACH"
#define EVENT_ACTION_SOURCE_FITHEAL                       @"FITHEAL"
#define EVENT_ACTION_SOURCE_MOBILE                        @"mobile"
#define EVENT_ACTION_SOURCE_APP_NAVIGATION                @"appnavigation"
#define EVENT_ACTION_SOURCE_DEEPLINK                      @"deeplink"
#define EVENT_ACTION_SOURCE_NOTIFICATION                  @"notification"

#define SOURCE_TYPE_REFERRAL                              @"referral"

#define NO_TRACKING_DATA                                  @"--"

#define METHOD_PWA_LINK                                   @"vendors/icici-lombard/getdetails"

#define Local_Identifier                                  @"en_IN"
#endif /* Constant_h */
