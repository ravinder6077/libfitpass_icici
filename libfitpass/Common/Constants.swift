//
//  Constants.swift
//  libfitpass
//
//  Created by Ravinder Singh on 19/08/22.
//

import Foundation
import UIKit

public class Device
{
    static let iOSDeviceWidth   = UIScreen.main.bounds.size.width
    static let iOSDeviceHeight  = UIScreen.main.bounds.size.height
    
    //{
        // iDevice detection code
        static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
        static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_RETINA           = UIScreen.main.scale >= 2.0
        static let SCREEN_WIDTH        = CGFloat(UIScreen.main.bounds.size.width)
        static let SCREEN_HEIGHT       = CGFloat(UIScreen.main.bounds.size.height)
        static let SCREEN_MAX_LENGTH   = CGFloat( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
        static let SCREEN_MIN_LENGTH   = CGFloat( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
        static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
        static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
        static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
        static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
//        static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
        static let IS_IPHONE_X         = IS_IPHONE && (SCREEN_MAX_LENGTH == 812 || SCREEN_MAX_LENGTH == 896)
//    static let TYPE                = "iOS"
    static let TYPE                = "web"
    
    static var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    
    static var NotchTop: CGFloat {
        let top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        return top
    }
    
    static var NotchBottom: CGFloat {
        let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return bottom
    }

    //}

}
class ACTION_TYPE
{
    static let workout              = "upcomingworkout"
    static let notice               = "notice"
    static let update_details       = "update_details"
    static let meal_log             = "meal_log"

}

class COLORS
{
    static let  MAGNUM_AGENT_1 = UIColor(red: 48.0/255.0, green: 51.0/255.0, blue: 149.0/255.0, alpha: 1)
    static let  MAGNUM_AGENT_2 = UIColor(red: 27.0/255.0, green: 157.0/255.0, blue: 255.0/255.0, alpha: 1)

    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

class Fonts
{
//    static let fontGothamHTF_Black                        = "GothamHTF-Black"
//    static let fontGothamHTF_Ultra                        = "GothamHTF-Ultra"
//    static let fontGothamHTF_Bold                         = "GothamHTF-Bold"
//    static let fontGothamHTF_Bold_Italic                  = "GothamHTF-BoldItalic"
//    static let fontGothamHTF_Light                        = "GothamHTF-Light"
//    static let fontGothamHTF_Medium                       = "GothamHTF-Medium"
//    static let fontGothamHTF_Book                         = "GothamHTF-Book"
//
//    static let fontSFProDisplay_Bold                      = "SFProDisplay-Bold"
//    static let fontSFProDisplay_Medium                    = "SFProDisplay-Medium"
//    static let fontSFProDisplay_Regular                   = "SFProDisplay-Regular"
//    static let fontSFProDisplay_RegularItalic             = "SFProDisplay-RegularItalic"
//    static let fontSFProDisplay_Semibold                  = "SFProDisplay-Semibold"
//    static let fontSFProDisplay_SemiboldItalic            = "SFProDisplay-SemiboldItalic"
//
//    static let SFProDisplay_Bold                      = "SFProDisplay-Bold"
//    static let SFProDisplay_Medium                    = "SFProDisplay-Medium"
//    static let SFProDisplay_Regular                   = "SFProDisplay-Regular"
//    static let SFProDisplay_RegularItalic             = "SFProDisplay-RegularItalic"
//    static let SFProDisplay_Semibold                  = "SFProDisplay-Semibold"
//    static let SFProDisplay_SemiboldItalic            = "SFProDisplay-SemiboldItalic"

    static let font_Roboto_Bold                      = "Roboto-Bold"
    static let font_Roboto_Medium                    = "Roboto-Medium"
    static let font_Roboto_Regular                   = "Roboto-Regular"
    static let font_Roboto_RegularItalic             = "Roboto-Italic"
//    static let font_Roboto_Semibold                  = "Roboto-Semibold"
//    static let font_Roboto_SemiboldItalic            = "Roboto-SemiboldItalic"

}

class APIUrls
{
    static let baseURL                          = "https://api.fitpass.dev/vendors/"
//    static let baseURL                          = "https://api.fitpass.live/vendors/"
//    static let apiAuthentucate                  = baseURL + "authenticate"
    static let apiAuthentucate                  = baseURL + "icici-lombard/getdetails"
    static let apiScanQRCode                    = baseURL + "scanqrcode"
//    static let apiScanQRCode                    = "https://customer-api.fitpass.dev/" + "customer/scan-qr"


    
    
    static let baseURL1                          = "https://api.fitpass.dev/"
    static let METHOD_USER_GET_CHALLENGE  = baseURL1 + "customer/amway-challenges/get-challenge"
    static let METHOD_USER_GET_CHALLENGE_DETAIL  = baseURL1 + "customer/amway-challenges/get-challenge-details"
    static let METHOD_USER_DELETE_CHALLENGE  = baseURL1 + "customer/amway-challenges/delete-challenge"
    static let METHOD_USER_UPDATE_CHALLENGE  = baseURL1 + "customer/amway-challenges/update-challenge"
    static let METHOD_USER_CREATE_CHALLENGE  = baseURL1 + "customer/amway-challenges/create-challenge"

    static let METHOD_USER_CHALLENGE_ADD_MEMBER        = baseURL1 + "customer/amway-users/add-member"
    static let METHOD_USER_CHALLENGE_INVITE_MEMBER     = baseURL1 + "customer/amway-challenge-invitation/invite-for-challenge"
    static let METHOD_USER_CHALLENGE_INVITE_MEMBERS_M  = baseURL1 + "customer/amway-challenge-invitation/invite-challenge-for-multiple-users"
    static let METHOD_USER_CHALLENGE_GET_MEMBER_DETAIL = baseURL1 + "customer/amway-users/get-user-details"
    static let METHOD_USER_CHALLENGE_GET_MEMBER        = baseURL1 + "customer/amway-users/get-members"
    static let METHOD_USER_CHALLENGE_GET_INVITATION    = baseURL1 + "customer/amway-users/get-challenge-invitation"
    static let METHOD_USER_CHALLENGE_GET_REQUEST       = baseURL1 + "customer/amway-users/get-challenge-request"
    static let METHOD_USER_CHALLENGE_GET_NOTIFICATION  = baseURL1 + "customer/amway-user-notification/get-notifcation"
    static let METHOD_USER_CHALLENGE_REVOKE            = baseURL1 + "customer/amway-users/revoke-users"
    static let METHOD_USER_CHALLENGE_RESEND            = baseURL1 + "customer/amway-users/resend-inviteto-users"
    static let METHOD_USER_CHALLENGE_STATUS            = baseURL1 + "customer/amway-challenge-invitation/update-status"
    static let METHOD_USER_FEED_POST_COMMENTS          = baseURL1 + "customer/amway-feed/postcomments"
    static let METHOD_USER_FEED_GET_COMMENTS           = baseURL1 + "customer/amway-feed/getcomments"
    static let METHOD_USER_FEED_REPORT_FEED            = baseURL1 + "customer/amway-feed/flagfeedpost"
    static let METHOD_USER_FEED_DELETE_FEED            = baseURL1 + "customer/amway-feed/deletefeed"

    static let METHOD_USER_LOG_STEPS         = baseURL1 + "customer/user-activity-tracking/update-steps"
    


}

class SecretKey
{
    static let qr_key             = "secret_key_qr"
    static let qr_key_default     = "a8yPNPM9/@1SHSHSx6Kls8XJfsd6jj4hgfsfdjnB20Ys8APkJr+rbdg4Hfm9p3XXXL&"


    static let USER_APP_KEY_DEFAULT                   = "lBnRJTc7CAJ8AixpqtilPB9FE2qU6EZg6YBkbugE"
    static let USER_AUTH_KEY_DEFAULT                  = "CadoXbi9bfU9WqnLLJM4FfXYo1bkMXbA5jTfB3tH"


    static let USER_APP_KEY             = "app_key"
    static let USER_AUTH_TOKEN          = "auth_token"
    static let USER_ID                  = "user_id"


}

class Messages
{
    static let TRY_AGAIN              = "Please try again"
    static let kVALIDUSERNAME         = "Please enter your full name"

}

class ConstantSwift
{
//    static let ACTION_TYPE_WORKOUT = "upomingworkout"
    static let USER_ID                                = "user_id"
    static let REFRESH_CHALLENGE                      = "REFRESH_CHALLENGE"
    static let AMWAY_SELECETD_CHALLENGE_TYPE          = "AMWAY_SELECETD_CHALLENGE_TYPE"
    static let AMWAY_ABO_USER_ID                      = "abo_user_id"
    
    
    static let CHALLENGE_TYPE_PUSHUP                   = "1"
    static let CHALLENGE_TYPE_SQUATS                   = "2"
    static let CHALLENGE_TYPE_PLANK                    = "3"
    static let CHALLENGE_TYPE_MEALS                    = "4"
    static let CHALLENGE_TYPE_HEART                    = "5"
    static let CHALLENGE_TYPE_STEPS                    = "6"
    static let CHALLENGE_TYPE_RUNNING                  = "7"
    static let CHALLENGE_TYPE_DAILY                    = "8"

    static let Local_Identifier                        = "en_IN"
    
    static func getImageFor(activityId: String, size: CGFloat, color:UIColor) -> UIImage
    {
//        let img = IconFont.image(fromIcon: FontIcon.workout, size: size, color: color)
//        return img!

        var activityImage : UIImage!
        switch activityId
        {
        case "1":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_1, size: size, color: color)
            break
        case "2":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_2, size: size, color: color)
            break
        case "3":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_3, size: size, color: color)
            break
        case "4":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_4, size: size, color: color)
            break
        case "5":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_5, size: size, color: color)
            break
        case "6":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_6, size: size, color: color)
            break
        case "7":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_7, size: size, color: color)
            break
        case "8":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_8, size: size, color: color)
            break
        case "9":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_9, size: size, color: color)
            break
        case "10":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_10, size: size, color: color)
            break
        case "11":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_11, size: size, color: color)
            break
        case "12":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_12, size: size, color: color)
            break
        case "13":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_13, size: size, color: color)
            break
        case "14":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_14, size: size, color: color)
            break
        case "15":
            activityImage = IconFont.image(fromIcon: FontIcon.activity_15, size: size, color: color)
            break
//        case "16":
//            activityImage = IconFont.image(fromIcon: FontIcon.activity_16, size: size, color: color)
//            break
//        case "17":
//            activityImage = IconFont.image(fromIcon: FontIcon.activity_17, size: size, color: color)
//            break
//        case "18":
//            activityImage = IconFont.image(fromIcon: FontIcon.activity_18, size: size, color: color)
//            break
//        case "19":
//            activityImage = IconFont.image(fromIcon: FontIcon.activity_19, size: size, color: color)
//            break

        default:
            activityImage = IconFont.image(fromIcon: FontIcon.activity_7, size: size, color: color)
            break
        }
        
        return activityImage!
    }
    
    static func setImageFor(activityId: String, size: CGFloat, imgView:UIImageView)// -> UIImage
    //: (NSString*)activity_id withSize : (CGFloat)size forImageView : (UIImageView*)imgView
    {
        for subUIView in imgView.subviews {
            subUIView.removeFromSuperview()
        }
        
//        let a:Int? = Int(activityId)
        let AI:Int = Int(activityId)!
        var fi:UInt32 = 0
        switch (AI)
        {
        case 1:
            fi = FontIcon.activity_1.rawValue
            break;
        case 2:
            fi = FontIcon.activity_2.rawValue
            break;
        case 3:
            fi = FontIcon.activity_3.rawValue
            break;
        case 4:
            fi = FontIcon.activity_4.rawValue
            break;
        case 5:
            fi = FontIcon.activity_5.rawValue
            break;
        case 6:
            fi = FontIcon.activity_6.rawValue
            break;
        case 7:
            fi = FontIcon.activity_7.rawValue
            break;
        case 8:
            fi = FontIcon.activity_8.rawValue
            break;
        case 9:
            fi = FontIcon.activity_9.rawValue
            break;
        case 10:
            fi = FontIcon.activity_10.rawValue
            break;
        case 11:
            fi = FontIcon.activity_11.rawValue
            break;
        case 12:
            fi = FontIcon.activity_12.rawValue
            break;
        case 13:
            fi = FontIcon.activity_13.rawValue
            break;
        case 14:
            fi = FontIcon.activity_14.rawValue
            break;
        case 15:
            fi = FontIcon.activity_15.rawValue
            break;
//        case 16:
//            fi = FontIcon.activity_16.rawValue
//            break;
//        case 17:
//            fi = FontIcon.activity_17.rawValue
//            break;
//        case 18:
//            fi = FontIcon.activity_18.rawValue
//            break;
//        case 19:
//            fi = FontIcon.activity_19.rawValue;
//            break;
            
        default:
            fi = FontIcon.activity_7.rawValue;
            break;
        }
        
        let colortop = activityDict[activityId]!["color1"]as! UIColor
        let colorbottom = activityDict[activityId]!["color2"]as! UIColor
//        lblImage.textAlignment = NSTextAlignmentCenter;
        let lblImage = THLabel(frame: imgView.bounds)
        lblImage.attributedText = IconFont.string(fromIcon:  FontIcon(rawValue: fi) ?? FontIcon.activity_7, size: size, color: .red)
        lblImage.textAlignment = .center
        lblImage.gradientStartColor = colorbottom
        lblImage.gradientEndColor = colortop
        imgView.addSubview(lblImage)
        imgView.backgroundColor = .white

    }
    
    static let SUCCESS_CODE   : Int = 200
    static let ERROR_CODE_405 : Int = 405
    static let ERROR_CODE_406 : Int = 406
    static let ERROR_CODE_407 : Int = 407
    static let ERROR_CODE_409 : Int = 409
    static let ERROR_CODE_412 : Int = 412

    static func getFloatValueto2DecimalPlace(floatValue:Float) -> Float
    {
        let roundedValue = round(floatValue * 100) / 100.0
        return roundedValue
    }
    static func convertCMtoFEETINCH(cm:String) -> String
    {
        let INCH_IN_CM:Float = 2.54
        let heightInCM = Float(cm)!
        var numInches:Float = Float(heightInCM / INCH_IN_CM)
        numInches = round(numInches)
        //(NSInteger) roundf(heightInCM / INCH_IN_CM);
        let feet:Int = Int(numInches / 12)
        let inches:Int = (Int(numInches) % 12)
        
        return String(format: "%d'%d\"", feet, inches)
    }
    
    static func convertKGtoLBS(kg:String) -> String
    {
        let weight_converter_kg_lbs:Float = 2.205
        let weightInKG = Float(kg)!
        let weightInLBS = weightInKG * weight_converter_kg_lbs
        return String(format: "%.1f", weightInLBS.rounded(toPlaces: 1))
    }
    
    static let screenSize = UIScreen.main.bounds.size
//    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let UserDefault = UserDefaults.standard
    static let Syncronize = UserDefault.synchronize()
    
    static let BackFontSize : CGFloat = 20.0

    static func showAlertMessage(message : String, success : Bool)
    {

//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let window = appDelegate.window!
        
        let window : UIWindow = UIApplication.shared.windows.first!

        if let alView = window.viewWithTag(121212) {
            alView.removeFromSuperview()
        }

        let alertView = FFAlertView(frame: CGRect(x: 0, y: Device.iOSDeviceHeight - 100, width: Device.iOSDeviceWidth, height: 100))
        alertView.tag = 121212
        window.addSubview(alertView)
        alertView.setMessageWithSuccess(success: success, message: message)

    }
        

    struct Colors
    {
        static let NavigationColorCRMLeft = UIColor(red: 45.0/255.0, green: 38.0/255.0, blue: 111.0/255.0, alpha: 1)
        static let NavigationColorCRMRight = UIColor(red: 93.0/255.0, green: 25.0/255.0, blue: 102.0/255.0, alpha: 1)
        
        //        static let ProfileColorCRMLeft  = UIColor(red: 253, green: 15, blue: 119, alpha: 1)
        //        static let ProfileColorCRMRight  = UIColor(red: 97, green: 37, blue: 138, alpha: 1)
        
        static let ProfileColorCRMLeft = UIColor(red: 97.0/255.0, green: 37.0/255.0, blue: 138.0/255.0, alpha: 1)
        static let ProfileColorCRMRight = UIColor(red: 253.0/255.0, green: 15.0/255.0, blue: 119.0/255.0, alpha: 1)
        
    }
    
    static func getGradientView(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = view.bounds
        return gradientLayer
    }

    static func getGradientView(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint, cornerRadius:CGFloat) -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        gradientLayer.frame = view.bounds
        gradientLayer.cornerRadius = cornerRadius
        return gradientLayer
    }

    static func getGradientBorder(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint) -> CAGradientLayer
    {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: view.frame.size)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = start
        gradient.endPoint = end
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: view.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        return gradient
    }
    
    static func getTimeInStringFromEpochTime(time:Int) -> String
    {
        let timeDate = Date(timeIntervalSince1970: TimeInterval(time))
        print("timeDate===", timeDate)
        let df = DateFormatter()
        df.dateFormat = "dd MMM, hh:mm a"
        df.locale = Locale(identifier: Local_Identifier)
        return df.string(from: timeDate)
    }
    
//    struct Device {
//        // iDevice detection code
//        static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
//        static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
//        static let IS_RETINA           = UIScreen.main.scale >= 2.0
//        static let SCREEN_WIDTH        = CGFloat(UIScreen.main.bounds.size.width)
//        static let SCREEN_HEIGHT       = CGFloat(UIScreen.main.bounds.size.height)
//        static let SCREEN_MAX_LENGTH   = CGFloat( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
//        static let SCREEN_MIN_LENGTH   = CGFloat( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
//        static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
//        static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
//        static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
//        static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
////        static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
//        static let IS_IPHONE_X         = IS_IPHONE && (SCREEN_MAX_LENGTH == 812 || SCREEN_MAX_LENGTH == 896)
//        static let TYPE                = "iOS"
//
//    }
    
    static func getAppVersionWithBuild() -> String
    {
        let appVersionString = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let buildNumberString = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
        return String(format: "%@(%@)", appVersionString, buildNumberString)
    }
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static let  COLOR_ERROR  = UIColorFromRGB(rgbValue: 0xD81B1B)
    static let  COLOR_SUCCESS = UIColorFromRGB(rgbValue: 0x0F9D58)

    static let  COLOR_BLUE_DARK = UIColorFromRGB(rgbValue: 0x130D56)

    static let  COLOR_GREEN_1 = UIColor(red: 33.0/255.0, green: 211.0/255.0, blue: 108.0/255.0, alpha: 1)
    static let  COLOR_GREEN_2 = UIColor(red: 72.0/255.0, green: 230.0/255.0, blue: 138.0/255.0, alpha: 1)

    static let  COLOR_GRAY_BORDER1 = UIColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1)
    static let  COLOR_CHERRY = UIColor(red: 48.0/255.0, green: 44.0/255.0, blue: 87.0/255.0, alpha: 1)

    static let  COLOR_GRAY_151 = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1)
    static let  COLOR_GRAY_1 = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
    static let  COLOR_GRAY_2 = UIColor(red: 178.0/255.0, green: 186.0/255.0, blue: 204.0/255.0, alpha: 1)


    static let  COLOR_TEXT_RED = UIColor(red: 208.0/255.0, green: 47.0/255.0, blue: 63.0/255.0, alpha: 1)
    static let  COLOR_TEXT_BLUE = UIColor(red: 15.0/255.0, green: 31.0/255.0, blue: 46.0/255.0, alpha: 1)
    
    static let  COLOR_MAGNUM_AGENT_1 = UIColor(red: 48.0/255.0, green: 51.0/255.0, blue: 149.0/255.0, alpha: 1)
    static let  COLOR_MAGNUM_AGENT_2 = UIColor(red: 27.0/255.0, green: 157.0/255.0, blue: 255.0/255.0, alpha: 1)
    static let  COLOR_MAGNUM_AGENT_3 = UIColor(red: 144.0/255.0, green: 34.0/255.0, blue: 140.0/255.0, alpha: 1)
    static let  COLOR_MAGNUM_AGENT_4 = UIColor(red: 0.0/255.0, green: 155.0/255.0, blue: 144.0/255.0, alpha: 1)
    
    static let COLOR_ACTIVITY_1_1 = UIColorFromRGB(rgbValue: 0x80db7e )
    static let COLOR_ACTIVITY_1_2 = UIColorFromRGB(rgbValue: 0x998046 )
    static let COLOR_ACTIVITY_1_3 = UIColorFromRGB(rgbValue: 0x879AF5 )
    static let COLOR_ACTIVITY_1_4 = UIColorFromRGB(rgbValue: 0xF5BF40 )
    static let COLOR_ACTIVITY_1_5 = UIColorFromRGB(rgbValue: 0xf5908c )
    static let COLOR_ACTIVITY_1_6 = UIColorFromRGB(rgbValue: 0x9f6edc )
    static let COLOR_ACTIVITY_1_7 = UIColorFromRGB(rgbValue: 0xef78ba )
    static let COLOR_ACTIVITY_1_8 = UIColorFromRGB(rgbValue: 0xebe382 )
    static let COLOR_ACTIVITY_1_9 = UIColorFromRGB(rgbValue: 0x5feae5 )
    static let COLOR_ACTIVITY_1_10 = UIColorFromRGB(rgbValue: 0xe981fb )
    static let COLOR_ACTIVITY_1_11 = UIColorFromRGB(rgbValue: 0xb47df1 )
    static let COLOR_ACTIVITY_1_12 = UIColorFromRGB(rgbValue: 0xa85d4a )
    static let COLOR_ACTIVITY_1_13 = UIColorFromRGB(rgbValue: 0x675ea4 )
    static let COLOR_ACTIVITY_1_14 = UIColorFromRGB(rgbValue: 0x10bddb )
    static let COLOR_ACTIVITY_1_15 = UIColorFromRGB(rgbValue: 0xad68b7 )
    static let COLOR_ACTIVITY_1_16 = UIColorFromRGB(rgbValue: 0xf5908c )
    
    static let COLOR_ACTIVITY_2_1 = UIColorFromRGB(rgbValue: 0x4dc349 )
    static let COLOR_ACTIVITY_2_2 = UIColorFromRGB(rgbValue: 0x815E0D )
    static let COLOR_ACTIVITY_2_3 = UIColorFromRGB(rgbValue: 0x5E8CEB )
    static let COLOR_ACTIVITY_2_4 = UIColorFromRGB(rgbValue: 0xFBBB74 )
    static let COLOR_ACTIVITY_2_5 = UIColorFromRGB(rgbValue: 0xd04a31 )
    static let COLOR_ACTIVITY_2_6 = UIColorFromRGB(rgbValue: 0x6345c6 )
    static let COLOR_ACTIVITY_2_7 = UIColorFromRGB(rgbValue: 0xda4361 )
    static let COLOR_ACTIVITY_2_8 = UIColorFromRGB(rgbValue: 0xeac644 )
    static let COLOR_ACTIVITY_2_9 = UIColorFromRGB(rgbValue: 0x41ccc6 )
    static let COLOR_ACTIVITY_2_10 = UIColorFromRGB(rgbValue: 0xc734e0 )
    static let COLOR_ACTIVITY_2_11 = UIColorFromRGB(rgbValue: 0x8f40e6 )
    static let COLOR_ACTIVITY_2_12 = UIColorFromRGB(rgbValue: 0x8a2e14 )
    static let COLOR_ACTIVITY_2_13 = UIColorFromRGB(rgbValue: 0x1c1162 )
    static let COLOR_ACTIVITY_2_14 = UIColorFromRGB(rgbValue: 0x59b1d7 )
    static let COLOR_ACTIVITY_2_15 = UIColorFromRGB(rgbValue: 0x6e1f7a )
    static let COLOR_ACTIVITY_2_16 = UIColorFromRGB(rgbValue: 0xd04a31 )
    
    static let activity1 = ["color1" : COLOR_ACTIVITY_1_1, "color2" : COLOR_ACTIVITY_2_1, "activity_name" : "Abs1"] as [String : Any]
    static let activity2 = ["color1" : COLOR_ACTIVITY_1_2, "color2" : COLOR_ACTIVITY_2_2, "activity_name" : "Abs2"] as [String : Any]
    static let activity3 = ["color1" : COLOR_ACTIVITY_1_3, "color2" : COLOR_ACTIVITY_2_3, "activity_name" : "Abs3"] as [String : Any]
    static let activity4 = ["color1" : COLOR_ACTIVITY_1_4, "color2" : COLOR_ACTIVITY_2_4, "activity_name" : "Abs4"] as [String : Any]
    static let activity5 = ["color1" : COLOR_ACTIVITY_1_5, "color2" : COLOR_ACTIVITY_2_5, "activity_name" : "Abs5"] as [String : Any]
    static let activity6 = ["color1" : COLOR_ACTIVITY_1_6, "color2" : COLOR_ACTIVITY_2_6, "activity_name" : "Abs6"] as [String : Any]
    static let activity7 = ["color1" : COLOR_ACTIVITY_1_7, "color2" : COLOR_ACTIVITY_2_7, "activity_name" : "Abs7"] as [String : Any]
    static let activity8 = ["color1" : COLOR_ACTIVITY_1_8, "color2" : COLOR_ACTIVITY_2_8, "activity_name" : "Abs8"] as [String : Any]
    static let activity9 = ["color1" : COLOR_ACTIVITY_1_9, "color2" : COLOR_ACTIVITY_2_9, "activity_name" : "Abs9"] as [String : Any]
    static let activity10 = ["color1" : COLOR_ACTIVITY_1_10, "color2" : COLOR_ACTIVITY_2_10, "activity_name" : "Abs10"] as [String : Any]
    static let activity11 = ["color1" : COLOR_ACTIVITY_1_11, "color2" : COLOR_ACTIVITY_2_11, "activity_name" : "Abs11"] as [String : Any]
    static let activity12 = ["color1" : COLOR_ACTIVITY_1_12, "color2" : COLOR_ACTIVITY_2_12, "activity_name" : "Abs12"] as [String : Any]
    static let activity13 = ["color1" : COLOR_ACTIVITY_1_13, "color2" : COLOR_ACTIVITY_2_13, "activity_name" : "Abs13"] as [String : Any]
    static let activity14 = ["color1" : COLOR_ACTIVITY_1_14, "color2" : COLOR_ACTIVITY_2_14, "activity_name" : "Abs14"] as [String : Any]
    static let activity15 = ["color1" : COLOR_ACTIVITY_1_15, "color2" : COLOR_ACTIVITY_2_15, "activity_name" : "Abs15"] as [String : Any]
    static let activity16 = ["color1" : COLOR_ACTIVITY_1_16, "color2" : COLOR_ACTIVITY_2_16, "activity_name" : "Abs16"] as [String : Any]
    static let activity17 = ["color1" : COLOR_ACTIVITY_1_7, "color2" : COLOR_ACTIVITY_2_7, "activity_name" : "Abs16"] as [String : Any]
    static let activity18 = ["color1" : COLOR_ACTIVITY_1_8, "color2" : COLOR_ACTIVITY_2_8, "activity_name" : "Abs16"] as [String : Any]
    static let activity19 = ["color1" : COLOR_ACTIVITY_1_9, "color2" : COLOR_ACTIVITY_2_9, "activity_name" : "Abs16"] as [String : Any]
    
    static let activityDict = ["1" : activity1, "2" : activity2, "3" : activity3, "4" : activity4, "5" : activity5, "6" : activity6, "7" : activity7, "8" : activity8, "9" : activity9, "10" : activity10, "11" : activity11, "12" : activity12, "13" : activity13, "14" : activity14, "15" : activity15, "16" : activity16, "17" : activity17, "18" : activity18, "19" : activity19 ]

    
    static let SPORTS_ARRAY = [
        ["sports_id":"13","sports_name":"Box Cricket","singles":"yes","doubles":"no"],
        ["sports_id":"14","sports_name":"Football","singles":"yes","doubles":"no"],
        ["sports_id":"15","sports_name":"Volleyball","singles":"yes","doubles":"no"],
        ["sports_id":"16","sports_name":"Table Tennis","singles":"yes","doubles":"yes"],
        ["sports_id":"18","sports_name":"Squash","singles":"yes","doubles":"yes"],
        ["sports_id":"20","sports_name":"Badminton","singles":"yes","doubles":"yes"],
        ["sports_id":"22","sports_name":"Chess","singles":"yes","doubles":"no"],
        ["sports_id":"23","sports_name":"Lawn Tennis","singles":"yes","doubles":"yes"]
    ]

    //[{"sports_id":"13","sports_name":"Box Cricket","tournament_type":""},{"sports_id":"14","sports_name":"Football","tournament_type":""},{"sports_id":"15","sports_name":"Volleyball","tournament_type":""},{"sports_id":"16","sports_name":"Table Tennis","tournament_type":1},{"sports_id":"17","sports_name":"Table Tennis","tournament_type":2},{"sports_id":"18","sports_name":"Squash","tournament_type":1},{"sports_id":"19","sports_name":"Squash","tournament_type":2},{"sports_id":"20","sports_name":"Badminton","tournament_type":1},{"sports_id":"21","sports_name":"Badminton","tournament_type":2},{"sports_id":"22","sports_name":"Chess","tournament_type":1},{"sports_id":"23","sports_name":"Lawn Tennis","tournament_type":1},{"sports_id":"24","sports_name":"Lawn Tennis","tournament_type":2}]

    
//    static func getGradientView(view : UIView, color1 : UIColor, color2 : UIColor, start:CGPoint, end:CGPoint) -> CAGradientLayer

    static func getDiagonalGradientFor(view : UIView, dictObj :[String:Any]) -> CAGradientLayer
    {
        let color_cta = dictObj["color"] as! [String:Any]
        let position_cta = dictObj["position"] as! [String:Any]
        let iOSposition_cta = position_cta["ios"] as! [String:Any]
        let position_cta1 = (iOSposition_cta["start"] as! String)
        let position_cta2 = (iOSposition_cta["middle"] as! String)
        let position_cta3 = (iOSposition_cta["end"] as! String)
        
        var color_ctaAsText1 = (color_cta["start"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText2 = (color_cta["middle"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText3 = (color_cta["end"] as! String).components(separatedBy: "-").first!
        
        let transp_cta1 = (color_cta["start"] as! String).components(separatedBy: "-").last!
        let transp_cta2 = (color_cta["middle"] as! String).components(separatedBy: "-").last!
        let transp_cta3 = (color_cta["end"] as! String).components(separatedBy: "-").last!
        
        let transp_cta1F = Float(transp_cta1)!
        let transp_cta2F = Float(transp_cta2)!
        let transp_cta3F = Float(transp_cta3)!
        
        color_ctaAsText1 = "0X" + color_ctaAsText1
        color_ctaAsText2 = "0X" + color_ctaAsText2
        color_ctaAsText3 = "0X" + color_ctaAsText3
        
        var color_cta11 = UIColor(hexString: color_ctaAsText1)//.withAlphaComponent(transp1F)
        var color_cta12 = UIColor(hexString: color_ctaAsText2)
        var color_cta13 = UIColor(hexString: color_ctaAsText3)
        
        color_cta11 = color_cta11.withAlphaComponent(CGFloat(transp_cta1F))
        color_cta12 = color_cta12.withAlphaComponent(CGFloat(transp_cta2F))
        color_cta13 = color_cta13.withAlphaComponent(CGFloat(transp_cta3F))
        
        let gradientLayer_cta = CAGradientLayer()
        gradientLayer_cta.frame = view.frame
        gradientLayer_cta.colors = [color_cta11.cgColor, color_cta12.cgColor, color_cta13.cgColor]
//        gradientLayer_cta.colors = [color_cta13.cgColor, color_cta12.cgColor, color_cta11.cgColor]
        gradientLayer_cta.locations = [NSNumber(value: Float(position_cta1)!), NSNumber(value: Float(position_cta2)!), NSNumber(value: Float(position_cta3)!)]
        gradientLayer_cta.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer_cta.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer_cta
        
    }
    
    static func getHorizontalGradientFor(view : UIView, dictObj :[String:Any]) -> CAGradientLayer
    {
        let color_cta = dictObj["color"] as! [String:Any]
        let position_cta = dictObj["position"] as! [String:Any]
        let iOSposition_cta = position_cta["ios"] as! [String:Any]
        let position_cta1 = (iOSposition_cta["start"] as! String)
        let position_cta2 = (iOSposition_cta["middle"] as! String)
        let position_cta3 = (iOSposition_cta["end"] as! String)
        
        var color_ctaAsText1 = (color_cta["start"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText2 = (color_cta["middle"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText3 = (color_cta["end"] as! String).components(separatedBy: "-").first!
        
        let transp_cta1 = (color_cta["start"] as! String).components(separatedBy: "-").last!
        let transp_cta2 = (color_cta["middle"] as! String).components(separatedBy: "-").last!
        let transp_cta3 = (color_cta["end"] as! String).components(separatedBy: "-").last!
        
        let transp_cta1F = Float(transp_cta1)!
        let transp_cta2F = Float(transp_cta2)!
        let transp_cta3F = Float(transp_cta3)!
        
        color_ctaAsText1 = "0X" + color_ctaAsText1
        color_ctaAsText2 = "0X" + color_ctaAsText2
        color_ctaAsText3 = "0X" + color_ctaAsText3
        
        var color_cta11 = UIColor(hexString: color_ctaAsText1)//.withAlphaComponent(transp1F)
        var color_cta12 = UIColor(hexString: color_ctaAsText2)
        var color_cta13 = UIColor(hexString: color_ctaAsText3)
        
        color_cta11 = color_cta11.withAlphaComponent(CGFloat(transp_cta1F))
        color_cta12 = color_cta12.withAlphaComponent(CGFloat(transp_cta2F))
        color_cta13 = color_cta13.withAlphaComponent(CGFloat(transp_cta3F))
        
        let gradientLayer_cta = CAGradientLayer()
        gradientLayer_cta.frame = view.frame
        gradientLayer_cta.colors = [color_cta11.cgColor, color_cta12.cgColor, color_cta13.cgColor]
        gradientLayer_cta.locations = [NSNumber(value: Float(position_cta1)!), NSNumber(value: Float(position_cta2)!), NSNumber(value: Float(position_cta3)!)]
        gradientLayer_cta.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer_cta.endPoint = CGPoint(x: 1, y: 0)
        return gradientLayer_cta

    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
    {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    static func getVerticalGradientFor(view : UIView, dictObj :[String:Any]) -> CAGradientLayer
    {
        let color_cta = dictObj["color"] as! [String:Any]
        let position_cta = dictObj["position"] as! [String:Any]
        let iOSposition_cta = position_cta["ios"] as! [String:Any]
        let position_cta1 = (iOSposition_cta["start"] as! String)
        let position_cta2 = (iOSposition_cta["middle"] as! String)
        let position_cta3 = (iOSposition_cta["end"] as! String)
        
        var color_ctaAsText1 = (color_cta["start"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText2 = (color_cta["middle"] as! String).components(separatedBy: "-").first!
        var color_ctaAsText3 = (color_cta["end"] as! String).components(separatedBy: "-").first!
        
        let transp_cta1 = (color_cta["start"] as! String).components(separatedBy: "-").last!
        let transp_cta2 = (color_cta["middle"] as! String).components(separatedBy: "-").last!
        let transp_cta3 = (color_cta["end"] as! String).components(separatedBy: "-").last!
        
        let transp_cta1F = Float(transp_cta1)!
        let transp_cta2F = Float(transp_cta2)!
        let transp_cta3F = Float(transp_cta3)!
        
        color_ctaAsText1 = "0X" + color_ctaAsText1
        color_ctaAsText2 = "0X" + color_ctaAsText2
        color_ctaAsText3 = "0X" + color_ctaAsText3
        
        var color_cta11 = UIColor(hexString: color_ctaAsText1)//.withAlphaComponent(transp1F)
        var color_cta12 = UIColor(hexString: color_ctaAsText2)
        var color_cta13 = UIColor(hexString: color_ctaAsText3)
        
        color_cta11 = color_cta11.withAlphaComponent(CGFloat(transp_cta1F))
        color_cta12 = color_cta12.withAlphaComponent(CGFloat(transp_cta2F))
        color_cta13 = color_cta13.withAlphaComponent(CGFloat(transp_cta3F))
        
        let gradientLayer_cta = CAGradientLayer()
        gradientLayer_cta.frame = view.frame
        gradientLayer_cta.colors = [color_cta11.cgColor, color_cta12.cgColor, color_cta13.cgColor]
        gradientLayer_cta.locations = [NSNumber(value: Float(position_cta1)!), NSNumber(value: Float(position_cta2)!), NSNumber(value: Float(position_cta3)!)]
        gradientLayer_cta.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer_cta.endPoint = CGPoint(x: 0, y: 1)
        return gradientLayer_cta
        
    }
    
    static func getColorFor(text : String) -> UIColor
    {
//        let color_cta = dictObj["color"] as! [String:Any]
//        let position_cta = dictObj["position"] as! [String:Any]
//        let iOSposition_cta = position_cta["ios"] as! [String:Any]
//        let position_cta1 = (iOSposition_cta["start"] as! String)
//        let position_cta2 = (iOSposition_cta["middle"] as! String)
//        let position_cta3 = (iOSposition_cta["end"] as! String)
        
        var color_ctaAsText1 = text.components(separatedBy: "-").first!
        let transp_cta1 = text.components(separatedBy: "-").last!
//        var color_ctaAsText1 = text.first as! String
//        let transp_cta1 = text.last as! String
        let transp_cta1F = Float(transp_cta1)!
        color_ctaAsText1 = "0X" + color_ctaAsText1
        
        var color_cta11 = UIColor(hexString: color_ctaAsText1)//.withAlphaComponent(transp1F)
        color_cta11 = color_cta11.withAlphaComponent(CGFloat(transp_cta1F))
        return color_cta11
        
//        let gradientLayer_cta = CAGradientLayer()
//        gradientLayer_cta.frame = view.frame
//        gradientLayer_cta.colors = [color_cta11.cgColor, color_cta12.cgColor, color_cta13.cgColor]
//        gradientLayer_cta.locations = [NSNumber(value: Float(position_cta1)!), NSNumber(value: Float(position_cta2)!), NSNumber(value: Float(position_cta3)!)]
//        gradientLayer_cta.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer_cta.endPoint = CGPoint(x: 0, y: 1)
//        return gradientLayer_cta
        
    }
    
}

//class Toast
//{
//    class private func showAlert(backgroundColor:UIColor, textColor:UIColor, message:String)
//    {
//
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let viewBG = UIView(frame: CGRect.zero)
//        viewBG.backgroundColor =  UIColor.white//backgroundColor //UIColor.whiteColor()
//        let htV:CGFloat = 60.0
//        let wtV:CGFloat = 60.0
//
////        let viewImg = UIView(frame: CGRect(x: 0, y: 0, width: wtV, height: htV))
////        viewImg.backgroundColor =  backgroundColor //UIColor.whiteColor()
////
////        let htI:CGFloat = 24.0
////        let wtI:CGFloat = 24.0
////        let imgV = UIImageView(frame: CGRect(x: 18, y: 18, width: wtI, height: htI))
////        imgV.image = IconFont.image(fromIcon: FontIcon.feed, size: 24, color: UIColor.white)
////        imgV.backgroundColor = UIColor.clear //backgroundColor //UIColor.whiteColor()
//
////        let label = UILabel(frame: CGRect.zero)
//        let label = UILabel(frame: CGRect(x: wtV+10, y: 0, width: ConstantSwift.screenSize.width - wtV-10, height: htV))
//        label.textAlignment = NSTextAlignment.left
//        label.text = message
//        label.font = UIFont(name: fontGothamHTF_Book, size: 14)
////        label.adjustsFontSizeToFitWidth = true
//
//        label.backgroundColor =  UIColor.white//backgroundColor //UIColor.whiteColor()
//        label.textColor = textColor //TEXT COLOR
//
////        label.sizeToFit()
//        label.numberOfLines = 4
//        label.layer.shadowColor = UIColor.gray.cgColor
//        label.layer.shadowOffset = CGSize(width: 4, height: 3)
//        label.layer.shadowOpacity = 0.3
//
//        let rectF = CGRect(x: 0, y: ConstantSwift.screenSize.height, width: ConstantSwift.screenSize.width, height: htV)
//
////        label.frame = CGRect(x: appDelegate.window!.frame.size.width, y: 64, width: appDelegate.window!.frame.size.width, height: 44)
////        label.frame = rectF
//        viewBG.frame = rectF
//
//        label.alpha = 1
//
////        viewBG.addSubview(viewImg)
////        viewImg.addSubview(imgV)
//        viewBG.addSubview(label)
//        appDelegate.window!.addSubview(viewBG)
//
//        var basketTopFrame: CGRect = viewBG.frame;
//        basketTopFrame.origin.y = ConstantSwift.screenSize.height - htV;
//
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
////            label.frame = basketTopFrame
//            viewBG.frame = basketTopFrame
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
////                label.removeFromSuperview()
//                basketTopFrame.origin.y = ConstantSwift.screenSize.height;
////                label.frame = basketTopFrame
//                viewBG.frame = basketTopFrame
//            })
//        }, completion: { (finished: Bool) in
//            //label.removeFromSuperview()
//        })
//
//
////        UIView.animate(withDuration
////            :2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
////                label.frame = basketTopFrame
////        },  completion: {
////            (value: Bool) in
////            UIView.animate(withDuration:2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
////                label.alpha = 0
////            },  completion: {
////                (value: Bool) in
////                label.removeFromSuperview()
////            })
////        })
//    }
//
//    class func showPositiveMessage(message:String)
//    {
//        showAlert(backgroundColor: ConstantSwift.COLOR_SUCCESS, textColor: UIColor.gray, message: message)
//    }
//    class func showNegativeMessage(message:String)
//    {
//        showAlert(backgroundColor: ConstantSwift.COLOR_ERROR, textColor: UIColor.gray, message: message)
//    }
//}
extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 )
    }
}

extension UILabel {
    func setHTMLFromString(htmlText: String) {
        //        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(self.font!.pointSize)\">%@</span>", htmlText)
//        let modifiedFont = String(format:"<span%@</span>", htmlText)
        let modifiedFont = String(format:"<span style=\"font-size: \(self.font!.pointSize)\">%@</span>", htmlText)

        
        //process collection values
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        
        
        self.attributedText = attrStr
    }
    //amway
    func convertPlainTextToUnderLineText(plainText:String) -> NSAttributedString
    {
        let option1 = plainText
        let range1 = NSRange(location: 0, length: option1.count)
        let attributedString2 = NSMutableAttributedString(string: option1)
        attributedString2.addAttributes([
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.grape,
            NSAttributedString.Key.foregroundColor:UIColor.grape
            ], range: range1)
        attributedString2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.grape, range: range1)

        return attributedString2
    }
}
//amway
extension Date{
    func conver12HrTo24Hr(dateAsString:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let date = dateFormatter.date(from: dateAsString)

        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        return date24
    }
    
    func conver24HrTo12Hr(dateAsString:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.date(from: dateAsString)

        dateFormatter.dateFormat = "hh:mm a"
        let date12 = dateFormatter.string(from: date!)
        return date12
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension UIStackView {
    @objc func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

extension CGFloat {
    
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

extension String {
    var characterArray: [Character]{
        var characterArray = [Character]()
//        for character in self.characters {
        for character in self {
            characterArray.append(character)
        }
        return characterArray
    }
}

extension UITextView {
    func typeOn(string: String) {
        let characterArray = string.characterArray
        var characterIndex = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.text.append(characterArray[characterIndex])
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
            }
        }
    }
}

extension Date {

  static func today() -> Date {
      return Date()
  }

  func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.next,
               weekday,
               considerToday: considerToday)
  }

  func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.previous,
               weekday,
               considerToday: considerToday)
  }

  func get(_ direction: SearchDirection,
           _ weekDay: Weekday,
           considerToday consider: Bool = false) -> Date {

    let dayName = weekDay.rawValue

    let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }

    assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")

    let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1

    let calendar = Calendar(identifier: .gregorian)

    if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
      return self
    }

    var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
    nextDateComponent.weekday = searchWeekdayIndex

    let date = calendar.nextDate(after: self,
                                 matching: nextDateComponent,
                                 matchingPolicy: .nextTime,
                                 direction: direction.calendarSearchDirection)

    return date!
  }

}

// MARK: Helper methods
extension Date {
  func getWeekDaysInEnglish() -> [String] {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en_US_POSIX")
    return calendar.weekdaySymbols
  }

  enum Weekday: String {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
  }

  enum SearchDirection {
    case next
    case previous

    var calendarSearchDirection: Calendar.SearchDirection {
      switch self {
      case .next:
        return .forward
      case .previous:
        return .backward
      }
    }
  }
}

extension Float {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UIFont {

    static func jbs_registerFont(withFilenameString filenameString: String, bundle: Bundle) {

        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
            print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }

}
