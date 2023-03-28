//
//  IconFont.swift
//  FITPASS_v3
//
//  Created by Ravinder on 21/08/18.
//  Copyright © 2018 Fitpass. All rights reserved.
//

import UIKit

@objc public enum FontIcon: UInt32 {
    //public enum FontIcon: UInt32 {
        
    case back_arrow                 = 0xe952
    case icon_scan                  = 0xe93b
    case arrow_right                = 0xe953
    case icon_tick                  = 0xe90b
    case alert                      = 0xe908
    case fitpass_logo               = 0xe90f
    case icon_help                  = 0xe96b
    case cross                      = 0xe903
    case icon_flash_on              = 0xe967
    case icon_flash_off             = 0xe966
    
    case arrowDown                  = 0xe902
    case arrowUp                    = 0xe901
    case icon_refresh_2             = 0xe968
    case icon_gallery               = 0xe969
    case icon_tick_reserve          = 0xe94b
    case tick                       = 0xe96a

    case fitpass                    = 0xe91b
    case fitcoach                   = 0xe91c
    case fitpass_tv                 = 0xe912
    
    case icon_decor                = 0xe96c

    case activity_1 = 0xe92f
    case activity_2 = 0xe92e
    case activity_3 = 0xe92a
    case activity_4 = 0xe923
    case activity_5 = 0xe930
    case activity_6 = 0xe92d
    case activity_7 = 0xe927
    case activity_8 = 0xe931
    case activity_9 = 0xe937
    case activity_10 = 0xe933
    case activity_11 = 0xe936
    case activity_12 = 0xe943
    case activity_13 = 0xe938
    case activity_14 = 0xe934
    case activity_15 = 0xe932
//    case activity_16 = 0xe96f
//    case activity_17 = 0xe96d
//    case activity_18 = 0xe96c
//    case activity_19 = 0xe96e



    
    
    
//    var ICON_BACK= 0xe952
//    var ICON_RIGHT = 0Xe953
//    var ICON_SCAN_QR = 0Xe93b

//        case deal_offer = 0xe965
//
//        case checkboxSel = 0xe962
//        case checkboxUnsel = 0xe963
//        case radioSel = 0xe985
//        case radioUnSel = 0xe984
//
//        case checkboxUnSelOutline = 0xe987
//        case checkboxSelOutline = 0xe988
//
//        case arrowupfill = 0xe960
//        case arrowdownfill = 0xe95f
//        case call = 0xe961
//
//        case contact = 0xe945
//        case whatsapp = 0xe950
//        case facebook = 0xe946
//        case twitter = 0xe94e
//        case follow = 0xe948
//        case google = 0xe949
//        case others = 0xe94c
//        case fitshop = 0xe947
//        case meal_log = 0xe94a
//        case new = 0xe94b
//        case sign_up = 0xe94d
//        case chat = 0xe944
//        case weight_log = 0xe94f
//        case workout = 0xe951
//        case about = 0xe900
//        case apple = 0xe904
//        case back_arrow = 0xe905
//        case briefcase = 0xe907
//        case calender = 0xe978
//        case calories = 0xe909
//        case cross = 0xe90d
//        case crown = 0xe90e
//        case debit_card = 0xe910
//        case doc = 0xe911
//        case doublearrowright = 0xe912
//        case arrowDown = 0xe913
//        case edit = 0xe914
//        case arrowUp = 0xe915
//        case favorate_out = 0xe916
//        case favorate = 0xe917
//        case feedback = 0xe918
//        case filter = 0xe919
//        case fitcash = 0xe91a
//        case fitpass = 0xe91b
//        case gift = 0xe91c
//        case glass_empty = 0xe91d
//        case glass = 0xe91e
//        case help = 0xe920
//        case home = 0xe922
//        case info = 0xe923
//        case integration = 0xe924
//        case cart = 0xe925
//        case location = 0xe926
//        case lock = 0xe927
//        case log_out = 0xe929
//        case menu = 0xe92a
//        case netbanking = 0xe92c
//        case notifiaction = 0xe92d
//        case profile = 0xe930
//        case save_card = 0xe932
//        case send = 0xe933
//        case setting = 0xe934
//        case Meal = 0xe935
//        case time = 0xe93a
//        case track_location = 0xe96b
//        case units = 0xe93c
//        case video = 0xe93d
//        case Wallet = 0xe93e
//        case recent_workout = 0xe943
//
//        // Magnum dashboard //
//
//        case add_customer = 0xe952
//        case bank_details = 0xe953
//        case commission = 0xe954
//        case contract = 0xe955
//        case customer_doc = 0xe956
//        case customer_list = 0xe957
//        case information = 0xe958
//        case insert_photo = 0xe959
//        case lead_pending = 0xe95a
//        case offers = 0xe95b
//        case send_2 = 0xe95c
//        case transaction = 0xe95d
//        case upload = 0xe95e
//
//        // Amenities icons //
//        case ac = 0xe902
//        case wifi = 0xe940
//        case parking = 0xe92e
//        case shawer = 0xe936
//        case locker = 0xe928
//        case water_cooler = 0xe93f
//
//        case email = 0xe93b
//        case mobile = 0xe96a
//
//        // Workout icons //
//
//    //    case Yoga = 0xe941
//    //    case Zumba = 0xe942
//    //    case SpinRPM = 0xe937
//    //    case Sports = 0xe938
//    //    case Swimming = 0xe939
//    //    case run = 0xe931
//    //    case Pilates = 0xe92f
//    //    case Combat = 0xe90b
//    //    case Core = 0xe90c
//    //    case Abs = 0xe901
//    //    case Dance = 0xe90f
//    //    case AerobicsCardio = 0xe903
//    //    case MixedMartialArts = 0xe92b
//    //    case GymWorkouts = 0xe91f
//    //    case HIIT = 0xe921
//    //    case BodyToneConditioning = 0xe906
//
//        case activity_1 = 0xe901
//        case activity_2 = 0xe903
//        case activity_3 = 0xe906
//        case activity_4 = 0xe90b
//        case activity_5 = 0xe90c
//        case activity_6 = 0xe90f
//        case activity_7 = 0xe91f
//        case activity_8 = 0xe921
//        case activity_9 = 0xe92b
//        case activity_10 = 0xe92f
//        case activity_11 = 0xe937
//        case activity_12 = 0xe938
//        case activity_13 = 0xe939
//        case activity_14 = 0xe941
//        case activity_15 = 0xe942
//        case activity_16 = 0xe96f
//        case activity_17 = 0xe96d
//        case activity_18 = 0xe96c
//        case activity_19 = 0xe96e
//
//        case run = 0xe931
//
//        case tick = 0xe979
//        case tick_thik = 0xe986
//        case billing = 0xe982
//        case alert = 0xe983
//
//        case alert_triangle = 0xe989
//
//        case pause = 0xe990
//        case play = 0xe991
//        case share = 0xe992
//        case time_duration = 0xe995
//
//        case arrow_left = 0xe98a
//        case arrow_right = 0xe98b
//        case video_play = 0xe98f
//
//        case eye = 0xe97e
//
//        case icon_left_arrow = 0xe99e
//        case icon_right_arrow = 0xe9a0
//        case icon_premium = 0xe9a2
//        case icon_duration = 0xe996
//        case icon_repetation = 0xe99c
//
//        case icon_add = 0xe997
//        case heart_rate = 0xe998
//        case icon_minus = 0xe999
//        case icon_plus = 0xe99b
//
//        case icon_player_previous = 0xe9a6
//        case icon_player_next = 0xe9a3
//        case icon_player_pause = 0xe9a4
//        case icon_player_play = 0xe9a5
//
//        case icon_emoji_hard = 0xe9a8
//        case icon_emoji_right = 0xe9a9
//        case icon_emoji_easy = 0xe9a7
//
//        case icon_save = 0xe99d
//        case icon_search = 0xe972
//        case icon_search_enter = 0xe9a1
//
//        case icon_personal_trainer = 0xe9b2
//        case icon_video_fill = 0xe9b6
//        case icon_video_outline = 0xe9ac
//        case icon_info_italic = 0xe9ae
//        case icon_calendar_with_tick = 0xe9b3
//        case icon_trainer = 0xe9b4
//        case icon_home = 0xe9ad
//        case icon_certified = 0xe9ab
//
//        case icon_learn = 0xe9b1
//        case icon_choose = 0xe9aa
//
//        case icon_refresh = 0xe9bc
//        case icon_left_arrow_curve = 0xe9be
//        case icon_right_arrow_curve = 0xe9bf
//
//        case icon_addition = 0xe980
//        case icon_substraction = 0xe9bd
//
//        case icon_fitfeast = 0xe9c3
//        case icon_fitcoach = 0xe9c4
//        case icon_fitpass_tv = 0xe9c8
//        case icon_1to1_class = 0xe9c9
//
//        case icon_scan = 0xe9c5
//        case icon_refer = 0xe9c7
//        case icon_meallog = 0xe9c2
//
//        case icon_direction = 0xe9cb
//
//        case icon_flash_on       = 0xe9ce
//        case icon_flash_off      = 0xe9fd
//
//
//        case icon_target = 0xe976
//        case icon_call = 0xe974
//        case icon_app = 0xe9cd
//        case icon_India = 0xe9cc
//        case icon_weight_lifting = 0xe9ca
//        case icon_filter_new = 0xe9cf
//
//
//        case icon_account = 0xe9d0
//        case icon_feed = 0xe9d4
//        case icon_challenge = 0xe9d2
//        case icon_reminder = 0xe9d1
//        case icon_connected_device = 0xe9d3
//        case icon_about = 0xe9d5
//        case icon_privacy_policy = 0xe9d6
//        case icon_TnC = 0xe9d8
//        case icon_support = 0xe9d7
//
//        case icon_heartbeat     = 0xe9da
//        case icon_sleep         = 0xe9db
//        case icon_steps         = 0xe9dc
//        case icon_weight        = 0xe9de
//        case icon_glass_fill    = 0xe9df
//
//        case icon_log_meal      = 0xe9e0
//        case icon_plank         = 0xe9e1
//        case icon_pushup        = 0xe9e2
//        case icon_run           = 0xe9e3
//        case icon_squats        = 0xe9e4
//        case icon_workout       = 0xe9e5
//
//        case icon_challenge_new     = 0xe9e6
//        case icon_feed_new          = 0xe9e7
//        case icon_home_new          = 0xe9e8
//
//        case icon_owner             = 0xe9ec
//        case icon_invited           = 0xe9ed
//
//        case icon_link                 = 0xe9ef
//        case icon_copy                 = 0xe9ee
//        case icon_share                = 0xe9f0
//
//        case icon_menu                 = 0xe9e9
//        case icon_logout               = 0xe9f7
//        case icon_profile_delete       = 0xea28
//
//        case icon_profile_new_empty    = 0xe9ea
//        case icon_profile_new_filled   = 0xe9eb
//
//        case icon_medal                = 0xe9f8
//        case icon_cross                = 0xe9f2
//        case icon_refresh_new          = 0xe9f3
//        case icon_tick                 = 0xe9f1
//
//        case icon_check_sel_new                 = 0xe9f9
//        case icon_check_unsel_new               = 0xe9fa
//
//        case icon_notification                  = 0xe9f6
//
//        case icon_sunny                         = 0xe994
//        case icon_past_workout                  = 0xe9fb
//        case icon_tired                         = 0xea03
//        case icon_resting                       = 0xea01
//        case icon_work                          = 0xea02
//        case icon_before_workout                = 0xea00
//        case icon_after_workout                 = 0xe9ff
//
//        case icon_camera_outline                = 0xe9f5
//        case icon_camera_filled                 = 0xe9f4
//
//        case icon_meeting                       = 0xea04
//        case icon_comment                       = 0xea05
//
//    //    case icon_send_new                      = 0xe95c
//    //    case icon_comment_new                   = 0xe944
//
//        case icon_flag                          = 0xea08
//
//        case icon_membership_detail     = 0xea0e
//        case icon_profile               = 0xea0b
//        case icon_hra                   = 0xea23
//        case icon_fitcash               = 0xea10
//        case icon_orders                = 0xea12
//        case icon_workout_reservation   = 0xea11
//
//        case icon_corporate             = 0xea0d
//
//        case icon_edit_profile          = 0xea0c
//        case icon_address               = 0xea0f
//        case icon_smartscale            = 0xea0a
//
//        case icon_offer_card            = 0xea14
//
//        case icon_meal_reminder         = 0xea19
//        case icon_water_reminder        = 0xea1a
//        case icon_workout_reminder      = 0xea1b
//        case icon_steps_reminder        = 0xea1c
//        case icon_weight_reminder       = 0xea18
//        case icon_heart_rate_reminder   = 0xea1d
//
//        case like_outline = 0xea1f
//        case like_filled  = 0xea1e
//
//        case icon_menu_list                 = 0xe97c
//    //    case icon_menu_grid                 = 0xe9e9
//
//        case icon_height        = 0xea22
//        case icon_BMI           = 0xea21
//        case icon_refresh_2     = 0xea24
//        case icon_gallery       = 0xea25
//        case icon_help          = 0xea26
//
//        case icon_partner_denial = 0xea27
//        case icon_tick_reserve   = 0xe9fe
//
//        case icon_care          = 0xea2d
//        case icon_care_menu1    = 0xea2c
//        case icon_care_menu2    = 0xea2a
//        case icon_care_menu3    = 0xea2b
//        case icon_care_menu4    = 0xea29
//
//        case icon_offer         = 0xe9c6
//        case icon_green_tick    = 0xea2e
//        case icon_rupee         = 0xea2f
//
//    case fitpass_logo = 0xe908

    }

//public final class IconFont {
@objc public class IconFont: NSObject {
    private class func iconFont(_ size: CGFloat) -> UIFont? {
        if size == 0.0 {
            return nil
        }
//        let iconfont = "fitpass-lib-font"
        let iconfont = "fp_pwa_font_icon"
        loadMyCustomFont(iconfont)
        return UIFont(name: iconfont, size: size)
    }
    private class func loadMyCustomFont(_ name:String) {
        guard let fontPath = Bundle(for: IconFont.self).path(forResource: name, ofType: "ttf") else {
            return
        }
        
        var error: Unmanaged<CFError>?
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: fontPath)) , let provider = CGDataProvider(data: data as CFData) else {
            return
        }
        
        let font = CGFont(provider)
        CTFontManagerRegisterGraphicsFont(font!, &error)
        if error != nil {
            return
        }
    }
    
    private class func stringForIcon(_ icon : FontIcon) -> String? {
        
        var rawIcon = icon.rawValue;
        let xPtr = withUnsafeMutablePointer(to: &rawIcon, { $0 })
        return String(bytesNoCopy: xPtr, length:MemoryLayout<UInt32>.size, encoding: String.Encoding.utf32LittleEndian, freeWhenDone: false)
    }
    
    
    //loading font here ...
    @objc public class func string(fromIcon icon: FontIcon, size: CGFloat = CGFloat(12), color: UIColor?) -> NSAttributedString? {
        
        guard let font = IconFont.iconFont(size) , let string = stringForIcon(icon) else { return nil }
        
        var attributes = [NSAttributedString.Key : AnyObject]()
        attributes[NSAttributedString.Key.font] = font
        
        if let color = color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        return NSAttributedString(string: string, attributes: attributes)
    }
    
    @objc public class func image(fromIcon icon: FontIcon, size: CGFloat, color: UIColor?) -> UIImage? {
        
        if size == 0.0 {
            return nil
        }
        
        guard let symbol = string(fromIcon: icon, size: size, color: color) else { return nil }
        
        let mutableSymbol = NSMutableAttributedString(attributedString: symbol)
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        mutableSymbol.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, mutableSymbol.length))
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mutableSymbol.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
