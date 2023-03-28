//
//  FitpassDashboard.swift
//  libfitpass
//
//  Created by Ravinder Singh on 18/08/22.
//

import UIKit
import CoreLocation
import WebKit

public class FitpassDashboard: MyViewController, CLLocationManagerDelegate, UIScrollViewDelegate
{
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewHeaderHt: NSLayoutConstraint!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnBackLeading: NSLayoutConstraint!
    @IBAction func didTapBtnBack(_ sender: Any)
    {
        //        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var imgDecor: UIImageView!
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var innerViewH: NSLayoutConstraint!
    
    
//    @IBOutlet weak var viewGreeting: UIView!
//    @IBOutlet weak var viewGreetingHt: NSLayoutConstraint!
//    @IBOutlet weak var lblGreeting: UILabel!
//    @IBOutlet weak var lblGreetingLeading: NSLayoutConstraint!
//
//    @IBOutlet weak var lblFPID: UILabel!
//    @IBOutlet weak var lblFPIDTrailing: NSLayoutConstraint!
//
//    @IBOutlet weak var viewCardNative: UIView!
//    @IBOutlet weak var viewCardNativeHt: NSLayoutConstraint!
//    @IBOutlet weak var cvCardView: UICollectionView!
//    @IBOutlet weak var cvCardViewLeading: NSLayoutConstraint!
//    @IBOutlet weak var cvCardViewTrailing: NSLayoutConstraint!
//    @IBOutlet weak var cvPageController: UICollectionView!
    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var viewCardHt: NSLayoutConstraint!
    
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewMenuHt: NSLayoutConstraint!
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet weak var tblMenuHt: NSLayoutConstraint!
    @IBOutlet weak var tblMenuLeading: NSLayoutConstraint!
    @IBOutlet weak var tblMenuTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var viewWorkout: UIView!
    @IBOutlet weak var viewWorkoutHt: NSLayoutConstraint!
    @IBOutlet weak var tblWorkout: UITableView!
    @IBOutlet weak var tblWorkoutHt: NSLayoutConstraint!
    @IBOutlet weak var tblWorkoutLeading: NSLayoutConstraint!
    @IBOutlet weak var tblWorkoutTrailing: NSLayoutConstraint!
    @IBOutlet weak var btnViewMoreWorkout: UIButton!
    
    @IBOutlet weak var viewFAQ: UIView!
    @IBOutlet weak var viewFAQHt: NSLayoutConstraint!
    @IBOutlet weak var lblFAQ: UILabel!
    @IBOutlet weak var tblFAQ: UITableView!
    @IBOutlet weak var tblFAQHt: NSLayoutConstraint!
    @IBOutlet weak var tblFAQLeading: NSLayoutConstraint!
    @IBOutlet weak var tblFAQtrailing: NSLayoutConstraint!
    
    //    @IBOutlet weak var tblFAQ: UITableView!
    
    @IBOutlet weak var viewBtnScan: UIView!
    @IBOutlet weak var imgVScan: UIImageView!
    @IBOutlet weak var btnScan: UIButton!
//    @IBOutlet weak var btnScanBottom: NSLayoutConstraint!
//    @IBOutlet weak var btnScanHt: NSLayoutConstraint!
    
    @IBAction func didTapScan(_ sender: Any)
    {
        let vc = ConfirmWorkoutVC(nibName: "ConfirmWorkoutVC", bundle: frameworkBundle)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var viewCopyRight: UIView!
    @IBOutlet weak var viewCopyRightBottom: NSLayoutConstraint!
    @IBOutlet weak var lblCopyRight: UILabel!
    
    public var myTitle = "FITPASS"
    public var hexColorHeaderBG = "#00305A"
    public var hexColorTitleFG = "#e77817"
    public var padding:CGFloat = 20
    
    public var vendor_id = ""
    public var policy_number = ""
    public var member_id = ""
    var past_label = "Completed Workout"
    var upcoming_label = "Upcoming Workout"

    
    var currentLatitude = CLLocationDegrees()
    var currentLongitude = CLLocationDegrees()
//    var slider2Array: [[String:Any]] = []
//    var workoutArray: [[String:Any]] = []
    var arrayMenu = [[String:Any]]()
    var arrayWorkout = [[String:Any]]()
    var faqArray: [[String:Any]] = []
    var faqSelection = -1
    
//    let reuseIdentifier21 = "DashboardCardViewCell1"
//    let reuseIdentifier22 = "DashboardCardViewCell2"
//    let reuseIdentifierWorkout = "FPDashboardCardViewCell"
//    let reuseIdentifierPB  = "ProgressBarCVCell"
    
    let reuseIdentifier2  = "DashboardMenuCell"
    let reuseIdentifier3  = "FPDashboardWorkoutCell"
    let reuseIdentifier4  = "PTFAQTVCell"
    
    var currentImageIndex = 0
    //    var selectedProductIndex = 0
    //    var selectedPlanIndex = 0
    //    var recommendedPlanIndex = -1
    var pageBarWidthSel:CGFloat = 45
    var pageBarWidth:CGFloat = 4
    var pageBarHeight:CGFloat = 4
    
    var show_header = true
    var query_paramter = false
    var location_permission = false
    var backbtn_url = ""
    var selectedIndex = -1
    var user_id = 0
    var itemWidthForSlider: CGFloat = 200
    var itemHeightForSlider:CGFloat = 175
    
    let paddingMin:CGFloat = 5
    let paddingMax:CGFloat = 30
    
    var past_workout = ""
    var upcoming_workout = ""
    var white_list_url = ""
    var copyright_string = ""
    let frameworkBundleID  = "com.fitpass.libfitpass"
    var frameworkBundle : Bundle!
//    let bundle = Bundle(identifier: frameworkBundleID)

    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        //        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        callAPI()
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        frameworkBundle = Bundle(identifier: frameworkBundleID)

        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
       
        
        if padding < paddingMin
        {
            padding = paddingMin
        }
        else if padding > paddingMax
        {
            padding = paddingMax
        }
        
//        viewGreeting.isHidden = true
//
//        viewGreetingHt.constant = 0
//        viewCardNativeHt.constant = 0
        
        let colorTitle = COLORS.hexStringToUIColor(hex: hexColorTitleFG)
        btnBack.setTitle("", for: .normal)
        btnBack.setImage(IconFont.image(fromIcon: FontIcon.back_arrow, size: 20, color: colorTitle), for: .normal)
        btnBackLeading.constant = padding
        
        lblHeader.text = myTitle
        lblHeader.textColor = colorTitle
        viewHeader.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorHeaderBG)
        viewHeaderHt.constant = viewHeaderHt.constant + Device.NotchTop

        viewCopyRightBottom.constant = Device.NotchBottom// ? 20:0
        viewBtnScan.isHidden = true
        viewCopyRight.isHidden = true

        imgDecor.image = IconFont.image(fromIcon: FontIcon.icon_decor, size: 180, color: COLORS.hexStringToUIColor(hex: "#0D3B62"))
        
        itemWidthForSlider = Device.iOSDeviceWidth - 2*(padding - 5)
        
        let nib2 = UINib(nibName: reuseIdentifier2, bundle: frameworkBundle)
        tblMenu.register(nib2, forCellReuseIdentifier: reuseIdentifier2)
        tblMenuLeading.constant = padding
        tblMenuTrailing.constant = padding
        self.viewMenuHt.constant = 0
        
        
        let nib3 = UINib(nibName: reuseIdentifier3, bundle: frameworkBundle)
        tblWorkout.register(nib3, forCellReuseIdentifier: reuseIdentifier3)
        tblWorkoutLeading.constant = padding
        tblWorkoutTrailing.constant = padding
        self.viewWorkoutHt.constant = 0
        btnViewMoreWorkout.isHidden = true
        
        let nib4 = UINib(nibName: reuseIdentifier4, bundle: frameworkBundle)
        tblFAQ.register(nib4, forCellReuseIdentifier: reuseIdentifier4)
        tblFAQLeading.constant = padding - 5
        tblFAQtrailing.constant = padding - 5
        self.viewFAQHt.constant = 0
        
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.colors = [UIColor.darkPink.cgColor, UIColor.barneyPurple.cgColor]
//        gradient.locations = [0.0 , 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
//        gradient.frame = CGRect(x: 0.0, y: 0.0, width: 190.0, height: 50.0)
//        gradient.cornerRadius = self.btnScan.frame.size.height/2
//        self.btnScan.layer.insertSublayer(gradient, at: 0)
//
//        self.btnScan.layer.cornerRadius = self.btnScan.frame.size.height/2
//        let imageScan = IconFont.image(fromIcon: FontIcon.icon_scan, size: 20, color: UIColor.white)
//        self.btnScan.setImage(imageScan, for: .normal)
//        self.btnScan.setImage(imageScan, for: .highlighted)
//        self.btnScan.setImage(imageScan, for: .selected)
//        self.btnScan.setImage(imageScan, for: .focused)
//        self.btnScan.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
//        self.btnScan.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
//        self.btnScan.bringSubviewToFront(self.btnScan.imageView!)
//
//
//        self.btnScanHt.constant = 50
//        self.btnScanBottom.constant = 25

        let imageScan = IconFont.image(fromIcon: FontIcon.icon_scan, size: 35, color: UIColor.darkIndigo)
        self.imgVScan.image = imageScan

        if let data = getPlist(withName: "FPConfig") {
            print(data)
        }
//        callAPI()
                
        loadCustomeFont()
        viewCardHt.constant = 0
        viewBtnScan.isHidden = true
        
    }
    
    func callAPI()
    {
        MyLoader.showHUDAdded(to: self.view, animated: true)
        let params = [
            "vendor_id": vendor_id,
            "policy_number": policy_number,
            "member_id": member_id,
        ] as [String:Any]
        
        let ldr = Downloader()
        ldr.downloadDelegate = self
        ldr.getResponse(apiURL: APIUrls.apiAuthentucate, params: params)
    }
    
    func loadCustomeFont()
    {
        for family: String in UIFont.familyNames
                {
                    print("family names===",family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }
        
        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Medium.ttf",
            bundle: frameworkBundle
        )
        
        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Light.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Regular.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-MediumItalic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-ThinItalic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-BoldItalic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-LightItalic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Italic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-BlackItalic.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Bold.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Thin.ttf",
            bundle: frameworkBundle
        )

        UIFont.jbs_registerFont(
            withFilenameString: "Roboto-Black.ttf",
            bundle: frameworkBundle
        )

        for family: String in UIFont.familyNames
                {
                    print("family names===",family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }

    }

    //
    //    func getResponse (apiURL: String, params:[String:Any]){
    //
    //        let config = URLSessionConfiguration.default
    //
    //        let session = URLSession(configuration: config)
    //
    //        let url = URL(string: apiURL)!
    //        var urlRequest = URLRequest(url: url)
    //        urlRequest.httpMethod = "POST"
    //        debugPrint("headers====", urlRequest.allHTTPHeaderFields!)
    //
    //        //        guard let postData = try? JSONSerialization.data(withJSONObject: params, options: []) else {
    //        //            return
    //        //        }
    //
    //
    //        //        let d_key = randomString()
    //        let d_key = staticSecretKey
    //
    //        do {
    //            let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
    //            let str = String(data: jsonData, encoding: .utf8)!
    //            debugPrint("str====", str)
    //
    //            let encryptedPayload = getEncryptText(plainText: str, secretKey: d_key)
    //            debugPrint("encryptedPayload====", encryptedPayload)
    //
    //            //            let staticPayload = "vXLzhMHHXbVM3qF17Iqh82nYdXmJNWS1HqPbrd8nl2C4cEIhYVMHb0UbfZDAID31IecsAkeW7zUiBwL321lbUVQ5fc3x8DMA0xjOnDK6kdo+JQduqXxDPgqAqD81LEBhAL/BzNdBowPLTmHdF1bXbg=="
    //            //            let postData = Data(staticPayload.utf8)
    //
    //            let postData = Data(encryptedPayload.utf8)
    //
    //            urlRequest.setValue(String(format: "%lu", postData.count), forHTTPHeaderField: "Content-Length")
    //            urlRequest.setValue(getEncryptedHeadersForRequestWithDynamicKey(dynamic_key: d_key), forHTTPHeaderField: "X-FITPASS-PAYLOAD")
    //            //            urlRequest.setValue("fR+CgnQFwPNqsYeR5e3wKVD8s46zB815DP9RFeh83ndjL0z4l08b1N4vRBaOHc6Q5IQY6I5utH+atvptdOKRrfA6/oAQMl09fTs06HAKUFhk4nVVvuvbgO8xFgcU4/3/7PrJWpRnNX+bNT/LHcO+lV9EieWB7mJJ1FpJv5yPIbVz/8yz5aFTuvwDEXZsq01P1lytWhrWHmQ8k/nhZCWpFHwGrmHiZGC4Qn4SWUiwUtaBSlxvMyIOKe5b5kKLJwfLLuTj8bOgFyu/v8vBON7Xne6Lg/NVXhhkD2HHs6v6TIu9SX02Nahr7LrjedgRPJZQ3JdZGhjU9ye5iECcb1rJW9Sy5EJ3MYP8gHdfdsRqrl5t6oVG6bQ6BK+BNmVIpw60", forHTTPHeaderField: "X-FITPASS-PAYLOAD")
    //            //                urlRequest.setValue("web", forHTTPHeaderField: "X-DEVICE-TYPE")
    //
    //            debugPrint("headers====", urlRequest.allHTTPHeaderFields!)
    //
    //
    //            urlRequest.httpBody = postData
    //
    //            let task = session.dataTask(with: urlRequest) { data, response, error in
    //
    //                // ensure there is no error for this HTTP response
    //                guard error == nil else {
    //                    print ("error: \(error!)")
    //                    return
    //                }
    //
    //                // ensure there is data returned from this HTTP response
    //                guard let content = data else {
    //                    print("No data")
    //                    return
    //                }
    //
    //                guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
    //                    print("Not containing JSON")
    //                    return
    //                }
    //
    //                print("gotten json response dictionary is \n \(json)")
    //                // update UI using the response here
    //
    //            }
    //
    //            task.resume()
    //        } catch {
    //            print("error====22",error.localizedDescription)
    //
    //        }
    //    }
    
    func getPlist(withName name: String) -> [String]?
    {
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path)
        {
            let plistData = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)
            return (plistData) as? [String]
        }
        return nil
    }
    
    @IBAction func didTapGetLocation(_ sender: Any)
    {
        getCurrentLocation()
    }
    
    func getCurrentLocation()
    {
        LocationService.sharedInstance().delegate = self
        //        LocationService.sharedInstance().startUpdatingLocationOnlyIfOn()
        LocationService.sharedInstance().startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        debugPrint("locations = \(locValue.latitude) \(locValue.longitude)")
        let myStr = String(format: "%@, %@", locValue.latitude, locValue.longitude)
        
    }
    
    //    func tracingLocation(_ currentLocation: CLLocation)
    //    {
    //        LocationService.sharedInstance().stopUpdatingLocation()
    //        currentLatitude = currentLocation.coordinate.latitude
    //        currentLongitude = currentLocation.coordinate.longitude
    //    }
    //
    //    func tracingLocationDidFailWithError()
    //    {
    //        LocationService.sharedInstance().stopUpdatingLocation()
    //    }
    
    
    @IBAction func didTapBtnViewMoreWorkout(_ sender: Any)
    {
        //view more
        let vc = WorkoutListVC(nibName: "WorkoutListVC", bundle: frameworkBundle)
        //        vc.myTitle = myTitle
        vc.hexColorHeaderBG = hexColorHeaderBG
        vc.hexColorTitleFG = hexColorTitleFG
        vc.padding = padding
        vc.upcoming_workout = upcoming_workout
        vc.past_workout = past_workout
        vc.upcoming_label = upcoming_label
        vc.past_label = past_label
        vc.white_list_url = white_list_url
        vc.arrayWorkout = arrayWorkout
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapBtnScan(_ sender: Any)
    {
        let vc = ConfirmWorkoutVC(nibName: "ConfirmWorkoutVC", bundle: frameworkBundle)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func callWebView()
    {
        let fp_menu = arrayMenu[selectedIndex]
        let redircet_url = fp_menu["redircet_url"] as! String
        let params = String(format: "latitude=%.4f&longitude=%.4f", currentLatitude, currentLongitude)
        let vc = CommonWebPage(nibName: "CommonWebPage", bundle: frameworkBundle)
        vc.webUrl = String(format: "%@&%@", redircet_url, params)
        vc.delegate = self
        //        vc.webUrl = "https://www.cult.fit/"
        vc.showHeader = show_header
        vc.backUrl = backbtn_url
        vc.myTitle = myTitle
        vc.hexColorHeaderBG = hexColorHeaderBG
        vc.hexColorTitleFG = hexColorTitleFG
        vc.padding = padding
        vc.copyright_string = copyright_string
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension FitpassDashboard:LocationServiceDelegate
{
    public func tracingLocation(_ currentLocation: CLLocation)
    {
        LocationService.sharedInstance().stopUpdatingLocation()
        currentLatitude = currentLocation.coordinate.latitude
        currentLongitude = currentLocation.coordinate.longitude
        callWebView()
        //        let myStr = String(format: "%.4f, %.4f", currentLatitude, currentLongitude)
        
    }
    
    public func tracingLocationDidFailWithError()
    {
        //        LocationService.sharedInstance().stopUpdatingLocation()
        //        callWebView()
        
        //        let topWindow = UIWindow(frame: UIScreen.main.bounds)
        //        topWindow.rootViewController = UIViewController()
        //        topWindow.windowLevel = UIWindow.Level.alert + 1
        let alert = UIAlertController(title: "Turn On Location Services", message: "We require your location to show the nearby gyms & studios", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            
            //            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
            //            UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
            
            if let bundleId = Bundle.main.bundleIdentifier,
               let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            //            topWindow.isHidden = true
        }))
        
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            //                self.delegate!.tracingLocationDidFailWithError()
        }))
        
        
        self.present(alert, animated: true)
        //        topWindow.makeKeyAndVisible()
        //        topWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
extension FitpassDashboard:DownloaderDelagate
{
    func downloadDidFinishedWithSuccess(responseDict: [String : Any])
    {
        //        debugPrint("json response is \n \(responseDict)")
        
        MyLoader.hideHUD(for: self.view, animated: true)
        
        if(responseDict.count == 0)
        {
            return
        }
        
        //        let code = responseDict["code"] as! Int
        //        if(code != SUCCESS_CODE)
        //        {
        //            let message : String = responseDict["message"] as! String
        //            ConstantSwift.showAlertMessage(message: message, success: false)
        //            return
        //        }
        
        let code = responseDict["code"] as! Int
        //        let code = 400
        if(code != ConstantSwift.SUCCESS_CODE)
        {
            let message : String = responseDict["message"] as! String
            ConstantSwift.showAlertMessage(message: message, success: false)
            
            //            let message = "Something went wrong"
            //            debugPrint("message===", message)
            //            showAlert(message: message)
            return
        }
        let result = responseDict["results"] as! [String:Any]
        debugPrint("result===", result)
        
//        viewBtnScan.isHidden = false
        if let cprstring = result["copyright_string"] as? String
        {
            copyright_string = cprstring
            viewCopyRight.isHidden = false
            lblCopyRight.text = copyright_string
        }

        let user_details = result["user_details"] as! [String:Any]

//        viewGreeting.isHidden = false
//        let fitpass_id = (user_details["fitpass_id"] as! NSNumber).stringValue
//        lblFPID.text = String(format: "FITPASS ID: %@", fitpass_id)

        user_id = user_details["user_id"] as! Int
        ConstantSwift.UserDefault.set(user_id, forKey: SecretKey.USER_ID)
        
        if let secret_key = (user_details["secret_key"] as? String)
        {
            ConstantSwift.UserDefault.set(secret_key, forKey: SecretKey.qr_key)
        }
        
        if let app_key = (user_details["app_key"] as? String)
        {
            ConstantSwift.UserDefault.set(app_key, forKey: SecretKey.USER_APP_KEY)
        }
        
        if let auth_token = (user_details["auth_token"] as? String)
        {
            ConstantSwift.UserDefault.set(auth_token, forKey: SecretKey.USER_AUTH_TOKEN)
        }
        
        
        //        let upcoming_activity = result["slider_activity"] as! [[String:Any]]
        //        //slider2Array
        //        print("before sorting====", upcoming_activity)
        //        slider2Array = (upcoming_activity as NSArray).sortedArray(using: [NSSortDescriptor(key: "order_by", ascending: true)]) as! [[String:Any]]
        //        print("after sorting====", slider2Array)
        //
        //        cvCardView.reloadData()
        //        cvPageController.reloadData()
        
//        //
//        let predicate = NSPredicate(format: "action = %@", ACTION_TYPE.workout)
//        let fitpassPlanArray = (slider2Array as NSArray).filtered(using: predicate)
//        workoutArray = fitpassPlanArray as! [[String:Any]]
//        if workoutArray.count > 0
//        {
//            self.btnScanHt.constant = 50
//            self.btnScanBottom.constant = 25
//        }
        
        //        for activity in workoutArray {
        //            let activity_action = activity["action"] as? String
        //            if activity_action == ACTION_TYPE.workout
        //            {
        //                let dictWorkout = activity["data"] as! [String:Any]
        //                let workout_status = dictWorkout["workout_status"] as! Int
        //                if workout_status != 3 {
        //                    self.btnScanHt.constant = 50
        //                    self.btnScanBottom.constant = 25
        //                }
        //                break
        //            }
        //        }
        
        
        //
        
        tblMenuHt.constant = CGFloat.greatestFiniteMagnitude
        self.viewMenuHt.constant = CGFloat.greatestFiniteMagnitude
        
        arrayMenu = result["product_list"] as! [[String:Any]]
        tblMenu.reloadData()
        
        tblMenuHt.constant = CGFloat.greatestFiniteMagnitude
        tblMenu.reloadData()
        tblMenu.layoutIfNeeded()
        
        //                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        self.tblMenuHt.constant = self.tblMenu.contentSize.height
        self.viewMenuHt.constant = self.tblMenuHt.constant + 20
        //                }
        
        
        //
        tblWorkoutHt.constant = CGFloat.greatestFiniteMagnitude
        self.viewWorkoutHt.constant = CGFloat.greatestFiniteMagnitude
        
        white_list_url = result["white_list_url"] as! String
        arrayWorkout = result["workoutlist"] as! [[String:Any]]
        tblWorkout.reloadData()
        
        tblWorkoutHt.constant = CGFloat.greatestFiniteMagnitude
        tblWorkout.reloadData()
        tblWorkout.layoutIfNeeded()
        
        self.tblWorkoutHt.constant = self.tblWorkout.contentSize.height
        self.viewWorkoutHt.constant = self.tblWorkoutHt.constant + 20 + 30
        if(arrayWorkout.count == 0)
        {
            self.viewWorkoutHt.constant = 0
        }
        else
        {
            let workoutDetail0 = arrayWorkout[0]
            let workout_status = workoutDetail0["workout_status"] as! Int
            if(workout_status == 1)
            {
                viewBtnScan.isHidden = false
            }
            
            if(arrayWorkout.count > 5)
            {
                btnViewMoreWorkout.isHidden = false
            }
        }
        //
        
        viewCard.subviews.forEach({$0.removeFromSuperview()})
        if let slide_webview = result["slide_webview"] as? String
        {
            let ht:CGFloat = (Device.SCREEN_WIDTH/2) + 24
            let webUrl = slide_webview
            
            
            let request = URLRequest(url: URL(string: webUrl)!)
            
            var webViewNew: WKWebView!
            let preferences = WKPreferences()
            preferences.javaScriptEnabled = true
            let configuration = WKWebViewConfiguration()
            configuration.preferences = preferences
            webViewNew = WKWebView(frame: CGRect(x: 0, y: 0, width: Device.SCREEN_WIDTH, height: ht), configuration: configuration)
            webViewNew.navigationDelegate = self
            webViewNew.load(request)
            webViewNew.isOpaque = false
            
            viewCard.addSubview(webViewNew)
            viewCardHt.constant = ht

        }
        
        if let view_all_workout = result["view_all_workout"] as? [String:Any]
        {
            self.upcoming_workout = view_all_workout["upcoming_workout"] as? String ?? ""
            self.past_workout = view_all_workout["past_workout"] as? String ?? ""
            
            self.upcoming_label = view_all_workout["upcoming_label"] as? String ?? ""
            self.past_label = view_all_workout["past_label"] as? String ?? ""

        }
        
        if let faq = result["faq"] as? [String:Any]
        {
            if let label = faq["heading"] as? String
            {
                lblFAQ.text = label
            }
            if let list = faq["list"] as? [[String:Any]]
            {
                self.tblFAQHt.constant = CGFloat.greatestFiniteMagnitude
                self.viewFAQHt.constant = CGFloat.greatestFiniteMagnitude
                
                faqArray = list
                tblFAQ.reloadData()
                
                tblFAQHt.constant = CGFloat.greatestFiniteMagnitude
                tblFAQ.reloadData()
                tblFAQ.layoutIfNeeded()
                self.tblFAQHt.constant = self.tblFAQ.contentSize.height
                self.viewFAQHt.constant = self.tblFAQHt.constant + 45
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let newH = self.viewFAQ.frame.origin.y + self.viewFAQHt.constant + 50
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: newH)
            self.innerViewH.constant = newH
        }
        
        
    }
    
    func downloadDidFinishedWithFailure(error: Error) {
        debugPrint("gotten json response dictionary is \n \(error)")
        
    }
    
//    func showAlert(message:String)
//    {
//        let alert = UIAlertController(title: "Sign out?", message: message,         preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
//            //Cancel Action
//            self.navigationController?.popViewController(animated: true)
//        }))
//
//        alert.addAction(UIAlertAction(title: "TRY AGAIN", style: UIAlertAction.Style.default, handler: { _ in
//            //Cancel Action
//            self.callAPI()
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//    }
}

extension FitpassDashboard: UITableViewDelegate, UITableViewDataSource
{
    // MARK: - UITableView DataSource And Delegate
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tblMenu
        {
            return self.arrayMenu.count
        }
        else if tableView == tblWorkout
        {
            return self.arrayWorkout.count
        }
        else
        {
            return faqArray.count
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        //        return cell_height
        if (tableView == tblMenu)
        {
            return 85
        }
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tblMenu
        {
            
            let fitfeast_menu = arrayMenu[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier2, for: indexPath) as! DashboardMenuCell
            
            let heading = fitfeast_menu["title"] as! String
            let description = fitfeast_menu["description"] as! String
            
            cell.viewBG.layer.cornerRadius = 10
            
            let gradient = CAGradientLayer()
            let color1 = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1)
            let color2 = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 206.0/255.0, alpha: 1)
            
            let wtViewBG = Device.SCREEN_WIDTH-(2*padding)-86
            let htDescription = description.height(withConstrainedWidth: wtViewBG, font: cell.lblSubHeading.font)
//            let htViewBG = 47 + htDescription
            let htViewBG:CGFloat = 70
            //            debugPrint("frame 1 ", cell.viewBG.frame)
            debugPrint("htViewBG  ", htViewBG)
            //            gradient.frame = cell.bounds
            gradient.frame = CGRect(x: 0, y: 0, width: wtViewBG+86, height: htViewBG)
            gradient.colors = [color1.cgColor, color2.cgColor]
            gradient.cornerRadius = 10
            cell.viewBG.layer.insertSublayer(gradient, at: 0)
            
            cell.lblHeading.text = heading
            cell.lblSubHeading.text = description
            
            cell.viewImageBG.layer.cornerRadius = cell.viewImageBG.frame.size.height/2
            
            let font_color = (fitfeast_menu["font_color"] as! String)
            let colorFont = COLORS.hexStringToUIColor(hex: font_color)
            
            let imageIcon = fitfeast_menu["font_name"] as! String
            let intIcon = UInt32(String(imageIcon), radix: 16)
            if let fontIcon = FontIcon(rawValue: intIcon!)
            {
                cell.imgView.image = IconFont.image(fromIcon: fontIcon, size: 20, color: colorFont)
            }
            
            let color_codeAsText = (fitfeast_menu["bgcolor"] as! String)
            let colorContainerBG = COLORS.hexStringToUIColor(hex: color_codeAsText)
            cell.viewImageBG.backgroundColor = colorContainerBG
            
            cell.imgArrow.image = IconFont.image(fromIcon: FontIcon.arrow_right, size: 20, color: colorContainerBG)
            
            //
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            return cell
        }
        else if tableView == tblWorkout
        {
            
            let workoutDetail = arrayWorkout[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier3, for: indexPath) as! FPDashboardWorkoutCell
            
            let studio_name = workoutDetail["studio_name"] as! String
            let workout_name = workoutDetail["workout_name"] as! String
            let studio_logo = workoutDetail["studio_logo"] as! String
            let workout_label = workoutDetail["workout_label"] as! String
            let workout_status = workoutDetail["workout_status"] as! Int

            cell.lblStatus.text = workout_label
            cell.lblStatus.textColor = UIColor(named: "colorOrangeTheme")
            if (!workout_label.isEmpty)
            {
                cell.lblStatus.text = workout_label + "  "
            }
            cell.lblTime.isHidden = true
            if let timeResult = (workoutDetail["start_time"] as? Int) {
                cell.lblTime.text = ConstantSwift.getTimeInStringFromEpochTime(time: Int(timeResult))
                cell.lblTime.isHidden = false
            }
            
            if(workout_status == 3)
            {
//                cell.lblTime.isHidden = true
                cell.lblStatus.textColor = UIColor.algaeGreen
                
                let urc_updated_time = workoutDetail["urc_updated_time"] as! Int
                print("urc_updated_time===", urc_updated_time)
                cell.lblTime.text = ConstantSwift.getTimeInStringFromEpochTime(time: urc_updated_time)
            }
            cell.viewBG.layer.cornerRadius = 10
            
            //            let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
            let gradient = CAGradientLayer()
            let color1 = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1)
            let color2 = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 206.0/255.0, alpha: 1)
            
            let wtViewBG = Device.SCREEN_WIDTH-(2*padding)//-86
            let htViewBG:CGFloat = 70
            debugPrint("htViewBG  ", htViewBG)
            gradient.frame = CGRect(x: 0, y: 0, width: wtViewBG, height: htViewBG)
            gradient.colors = [color1.cgColor, color2.cgColor]
            gradient.cornerRadius = 10
            cell.viewBG.layer.insertSublayer(gradient, at: 0)
            
            
            
            cell.lblStudioName.text = studio_name
            cell.lblWorkoutName.text = workout_name
            
            //            cell.viewImageBG.layer.cornerRadius = cell.viewImageBG.frame.size.height/2
            
            let colorContainerBG = COLORS.hexStringToUIColor(hex: self.hexColorTitleFG)
            cell.imgView.imageURL = URL(string: studio_logo)
            cell.imgView.layer.cornerRadius = 22.5
            cell.imgView.layer.borderColor = colorContainerBG.cgColor
            cell.imgView.layer.borderWidth = 1.0
            
            cell.imgArrow.image = IconFont.image(fromIcon: FontIcon.arrow_right, size: 20, color: colorContainerBG)
            
            //
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier4, for: indexPath) as! PTFAQTVCell
            cell.backgroundColor = UIColor.clear
            let item = faqArray[indexPath.row]
            let ques = item["question"] as! String
            let ans = item["answer"] as! String
            
            let colorArrow = COLORS.hexStringToUIColor(hex: hexColorTitleFG)

            cell.lblQues.text = ques
            cell.lblAns.text = ""
            cell.viewSeperator.isHidden = true
            cell.viewCard.shadowOffsetHeight = 0
            cell.viewCard.shadowColor = .clear
            cell.viewCard.layer.cornerRadius = 4
            cell.viewCard.layer.borderColor = UIColor.gray240.cgColor
            cell.viewCard.layer.borderWidth = 0.5
            cell.imgPlusMinus.image = IconFont.image(fromIcon: FontIcon.arrowDown, size: 11, color: colorArrow)
            
            cell.lblQuesTop.constant = 12
            cell.lblQuesBottom.constant = 0
            
            //            cell.lblQues.font = UIFont(name: fontSFProDisplay_Semibold, size: 12)
            //            cell.lblAns.font = UIFont(name: fontSFProDisplay_Medium, size: 12)
            
            if faqSelection == indexPath.row
            {
                cell.imgPlusMinus.image = IconFont.image(fromIcon: FontIcon.arrowUp, size: 11, color: colorArrow)
                cell.lblAns.text = ans
                cell.lblQuesTop.constant = 12
                cell.lblQuesBottom.constant = 8
            }
            
//            let gradient = CAGradientLayer()
//            let color1 = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1)
//            let color2 = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 206.0/255.0, alpha: 1)
//
//            let wtQues = Device.SCREEN_WIDTH-(2*padding)-40
//            let htQues = description.height(withConstrainedWidth: wtQues, font: cell.lblQues.font)
//
//            let wtViewBG = Device.SCREEN_WIDTH-(2*padding)-20
//            let htDescription = description.height(withConstrainedWidth: wtViewBG, font: cell.lblAns.font)
//            let htViewBG = cell.lblQuesTop.constant + htQues + cell.lblQuesBottom.constant + htDescription + 10.5
//            //            debugPrint("frame 1 ", cell.viewBG.frame)
//            debugPrint("htViewBG  ", htViewBG)
//            //            gradient.frame = cell.bounds
//            gradient.frame = CGRect(x: 0, y: 0, width: wtViewBG+20, height: htViewBG)
//            gradient.colors = [color1.cgColor, color2.cgColor]
//            gradient.cornerRadius = 10
//            cell.viewCard.layer.insertSublayer(gradient, at: 0)

            debugPrint("frame of ans=====", cell.lblAns.frame)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == tblMenu
        {
            let fp_menu = arrayMenu[indexPath.row]
            let redircet_url = fp_menu["redircet_url"] as! String
            
            show_header = true
            query_paramter = false
            location_permission = false
            
            if let sh = fp_menu["show_header"] as? Bool
            {
                show_header = sh
            }
            if let qp = fp_menu["query_paramter"] as? Bool
            {
                query_paramter = qp
            }
            if let lp = fp_menu["location_permission"] as? Bool
            {
                location_permission = lp
            }
            if let bbu = fp_menu["backbtn_url"] as? String
            {
                backbtn_url = bbu
            }
            
            selectedIndex = indexPath.row
            if location_permission
            {
                getCurrentLocation()
            }
            else
            {
                let vc = CommonWebPage(nibName: "CommonWebPage", bundle: frameworkBundle)
                vc.webUrl = redircet_url
                vc.showHeader = show_header
                vc.backUrl = backbtn_url
                vc.myTitle = myTitle
                vc.hexColorHeaderBG = hexColorHeaderBG
                vc.hexColorTitleFG = hexColorTitleFG
                vc.padding = padding
                vc.delegate = self
                vc.copyright_string = copyright_string
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else if tableView == tblWorkout
        {
            let vc = ConfirmWorkoutVC(nibName: "ConfirmWorkoutVC", bundle: frameworkBundle)
            vc.dictParameters = arrayWorkout[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)

        }
        else
        {
            self.tblFAQHt.constant = CGFloat.greatestFiniteMagnitude
            self.viewFAQHt.constant = CGFloat.greatestFiniteMagnitude
            
            if faqSelection == indexPath.row
            {
                faqSelection = -1
            }
            else
            {
                faqSelection = indexPath.row
            }
            tblFAQ.reloadData()
            tblFAQHt.constant = CGFloat.greatestFiniteMagnitude
            tblFAQ.reloadData()
            tblFAQ.layoutIfNeeded()
            self.tblFAQHt.constant = self.tblFAQ.contentSize.height
            self.viewFAQHt.constant = self.tblFAQHt.constant + 45
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let newH = self.viewFAQ.frame.origin.y + self.viewFAQHt.constant + 50
                self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: newH)
                self.innerViewH.constant = newH
                
                //        let newH = self.tblFAQ.frame.origin.y + self.tblFAQHt.constant + 50
                //        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: newH)
                //        self.innerViewH.constant = newH
            }
            
            
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //                self.tblFAQHt.constant = self.tblFAQ.contentSize.height + 30;
            //                self.viewFAQHt.constant = self.tblFAQHt.constant + 40
            //
            //                self.updateScrollViewHeight()
            //                self.tblHIW.reloadData()
            //            }
        }
    }
}

extension FitpassDashboard: CommonWebPageDelegate{
    func refreshHome() {
//        callAPI()
    }
    
}

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
}

extension FitpassDashboard: WKNavigationDelegate
{
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (_: WKNavigationActionPolicy) -> Void)
    {
        let webViewUrl:String = navigationAction.request.url!.absoluteString
        print("decidePolicyFor======", webViewUrl)
        print("white_list_url=====", white_list_url)
        
        if (webViewUrl.contains(white_list_url))
        {
            decisionHandler(.cancel)
            let vc = ConfirmWorkoutVC(nibName: "ConfirmWorkoutVC", bundle: frameworkBundle)
            
            let usid = webViewUrl.replacingOccurrences(of: white_list_url, with: "")
            debugPrint("usid=====", usid)
            let predicate = NSPredicate(format: "user_schedule_id = %@", usid)
            let fitpassPlanArray = (arrayWorkout as NSArray).filtered(using: predicate)
            let arrayWorkoutFiltered = fitpassPlanArray as! [[String:Any]]
            if (arrayWorkoutFiltered.count > 0)
            {
                let params = arrayWorkoutFiltered[0]
                vc.dictParameters = params
            }
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else
        {
            decisionHandler(.allow)
        }
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        print("didFinish navigation")
        let returnUrl = "native_action=open_scanner"
        
        print("returnUrl=====", returnUrl)
        print("webView.url===", webView.url?.absoluteString)
        
        if ((webView.url?.absoluteString.contains(returnUrl))!)
        {
            print("payment cancelled by user=======")
            self.navigationController?.popViewController(animated: true)
        }
        //        else if ((webView.url?.absoluteString == backUrl))
        //        {
        //            print("payment cancelled by user=======")
        //            delegate.refreshPage()
        //            self.navigationController?.popViewController(animated: true)
        //        }
        
    }
}
