//
//  ConfirmWorkoutVC.swift
//  FITPASS_v3
//
//  Created by Ravinder Singh on 29/09/20.
//  Copyright © 2020 Fitpass. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ConfirmWorkoutVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate, LocationServiceDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    func tracingLocation(_ currentLocation: CLLocation)
    {
        LocationService.sharedInstance().stopUpdatingLocation()
        currentLatitude = currentLocation.coordinate.latitude
        currentLongitude = currentLocation.coordinate.longitude
        setupCameraView()
        
        let myStr = String(format: "lat %.4f,\nlong %.4f", currentLatitude, currentLongitude)
//        let alert = UIAlertController(title: "Location received", message: myStr, preferredStyle: UIAlertController.Style.alert)
//
//
//        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
//
//        }))
//
//
//        self.present(alert, animated: true)

    }
    
    func tracingLocationDidFailWithError()
    {
//        MBProgressHUD.hide(for: self.view, animated: true)
//        LocationService.sharedInstance().stopUpdatingLocation()
        
        let alert = UIAlertController(title: "Turn On Location Services", message: "We require your location to show the nearby gyms & studios", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            
//            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
//            UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
            
            if let bundleId = Bundle.main.bundleIdentifier,
                let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
            {
                self.navigationController?.popViewController(animated: true)
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
//            topWindow.isHidden = true
        }))
        
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: {(_ action: UIAlertAction) -> Void in
            self.navigationController?.popViewController(animated: true)
//                self.delegate!.tracingLocationDidFailWithError()
            }))
        

        self.present(alert, animated: true)

    }
    func tracingLocationDidFailWithoutPrecision()
    {
//        MBProgressHUD.hide(for: self.view, animated: true)
        LocationService.sharedInstance().stopUpdatingLocation()
        
        let optionMenu = UIAlertController(title: "Location not precise", message: "Go to settings and turn on precise location to use this feature.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Turn On in settings", style: .default, handler:
                                    {
                                        (alert: UIAlertAction!) -> Void in
                                        if let bundleId = Bundle.main.bundleIdentifier,
                                           let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)") {
                                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                        }

                                    })
        optionMenu.addAction(action)
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                self.navigationController?.popViewController(animated: true)

                                            })
        optionMenu.addAction(cancelAction)
        
        
        self.present(optionMenu, animated: true, completion: nil)

    }
    


    @IBOutlet weak var hViewGrad: UIView!
    @IBOutlet weak var hView: UIView!
    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnFlash: UIButton!
    @IBOutlet weak var viewCamera: UIView!
    @IBOutlet weak var btnShowQR: UIButton!
    
    @IBOutlet weak var viewRefreshLocation: UIView!
    @IBOutlet weak var imgRefreshLocation: UIImageView!
    @IBOutlet weak var lblRefreshLocation: UILabel!
    @IBOutlet weak var btnRefreshLocation: UIButton!

    @IBOutlet weak var viewScanFromGallery: UIView!
    @IBOutlet weak var imgScanFromGallery: UIImageView!
    @IBOutlet weak var lblScanFromGallery: UILabel!
    @IBOutlet weak var btnScanFromGallery: UIButton!
    
    @IBOutlet weak var viewLink: UIView!
    @IBOutlet weak var imgLink: UIImageView!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var btnLink: UIButton!

    @IBOutlet weak var viewWorkoutList: UIView!
    @IBOutlet weak var viewWorkoutListHt: NSLayoutConstraint!
    
    @IBOutlet weak var viewWorkoutHeader: UIView!
    @IBOutlet weak var lblStudioName: UILabel!
    @IBOutlet weak var tblWorkoutList: UITableView!
    @IBOutlet weak var tblWorkoutListHt: NSLayoutConstraint!
    @IBOutlet weak var btnNeedHelp: UIButton!
    @IBOutlet weak var btnNeedHelpTop: NSLayoutConstraint!
    @IBOutlet weak var btnNeedHelpHt: NSLayoutConstraint!
    @IBOutlet weak var btnNeedHelpBottom: NSLayoutConstraint!
    @IBAction func didTapBtnNeedHelp(_ sender: Any)
    {
        callHelp()
    }
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewSearchHt: NSLayoutConstraint!
    @IBOutlet weak var viewSearchBottom: NSLayoutConstraint!
    @IBOutlet weak var tfSearch: UITextField!
    
    
    var objCaptureSession:AVCaptureSession?
    var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    var vwQRCode:UIView?

    let blueWidth : CGFloat = 200

    var dictParameters = [String:Any]()
    var methodName = ""
    var currentLatitude = CLLocationDegrees()
    var currentLongitude = CLLocationDegrees()
    let cellHeight:CGFloat = 68
    let reuseIdentifier2  = "ScanWorkoutCell"
    var workout_list = [[String:Any]]()
    var isKeyboardOpen = false
    let mealAlertTag = 212121
    var isScanning = true
    
//    override func viewDidAppear(_ animated: Bool)
//    {
//        super.viewDidAppear(animated)
////        setupCameraView()
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//            super.viewDidDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        removeAlertView()
//    }
    
    func setupCameraView()
    {
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized
        {
            // Already Authorized
            configureVideoCapture()
            addVideoPreviewLayer()
            initializeQRView()
        }
        else
        {
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                if granted == true
                {
                    // Permission granted
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                    {
                        self.configureVideoCapture()
                        self.addVideoPreviewLayer()
                        self.initializeQRView()
                    }
                }
                else
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
                    {
                        // Permission Rejected
                        let optionMenu = UIAlertController(title: "FITPASS would like to access the camera", message: "To scan the QR code and help you enjoy your workout", preferredStyle: .alert)
                        
                        let action = UIAlertAction(title: "Settings", style: .default, handler:
                        {
                            (alert: UIAlertAction!) -> Void in
                            
                            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                                return
                            }
                            
                            if UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                                })
                            }
                            
                        })
                        optionMenu.addAction(action)
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
                                                            {
                            (alert: UIAlertAction!) -> Void in
                            self.navigationController?.popViewController(animated: true)
                            
                        })
                        optionMenu.addAction(cancelAction)
                        // 5
                        self.present(optionMenu, animated: true, completion: nil)
                    }
                }
            })
        }
    }

    let sizeOfImage:CGFloat = 16

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }

//        let clr = UIColor.darkIndigo.withAlphaComponent(0.40)
        let clr = UIColor.blueGrey

        btnBack.backgroundColor = clr
        btnBack.layer.cornerRadius = btnBack.frame.size.height/2
        btnBack.setAttributedTitle(IconFont.string(fromIcon: FontIcon.cross, size: 12, color: UIColor.white), for: .normal)

        btnFlash.backgroundColor = clr
        btnFlash.layer.cornerRadius = btnFlash.frame.size.height/2
        btnFlash.setAttributedTitle(IconFont.string(fromIcon: FontIcon.icon_flash_off, size: sizeOfImage, color: UIColor.white), for: .normal)

        self.view.bringSubviewToFront(hView)
                
        btnShowQR.layer.cornerRadius = btnShowQR.frame.size.height/2

        viewWorkoutList.backgroundColor = UIColor.clear
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)

        let rectOuterView = CGRect(x: viewWorkoutList.bounds.origin.x, y: viewWorkoutList.bounds.origin.y, width: Device.iOSDeviceWidth, height: 400)
        let paath = UIBezierPath(roundedRect: rectOuterView, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20))
        let maask = CAShapeLayer()
        maask.path = paath.cgPath
//        maask.backgroundColor = UIColor.grape.cgColor
        viewWorkoutList.layer.mask = maask
        viewWorkoutListHt.constant = 0
        tblWorkoutListHt.constant = 0
        
        let frameworkBundleID  = "com.fitpass.libfitpass";
        let bundle = Bundle(identifier: frameworkBundleID)

//        let nib2 = UINib(nibName: reuseIdentifier2, bundle: nil)
        let nib2 = UINib(nibName: reuseIdentifier2, bundle: bundle)
        tblWorkoutList.register(nib2, forCellReuseIdentifier: reuseIdentifier2)
        
        btnShowQR.isHidden = true
//        btnShowQR.isHidden = (dictParameters.count == 0)
        
        lblRefreshLocation.text = "Refresh location"
        imgRefreshLocation.image = IconFont.image(fromIcon: FontIcon.icon_refresh_2, size: sizeOfImage, color: UIColor.white)
        imgRefreshLocation.layer.cornerRadius = imgScanFromGallery.frame.size.height/2
        imgRefreshLocation.backgroundColor = .blueGrey
        imgRefreshLocation.contentMode = .center

        lblScanFromGallery.text = "Scan from gallery"
        imgScanFromGallery.image = IconFont.image(fromIcon: FontIcon.icon_gallery, size: sizeOfImage, color: UIColor.white)
        imgScanFromGallery.layer.cornerRadius = imgScanFromGallery.frame.size.height/2
        imgScanFromGallery.backgroundColor = .blueGrey
        imgScanFromGallery.contentMode = .center

//        lblLink.text = "Search by URL"
//        imgLink.image = IconFont.image(fromIcon: FontIcon.icon_link, size: sizeOfImage, color: UIColor.white)
//        imgLink.layer.cornerRadius = imgLink.frame.size.height/2
//        imgLink.backgroundColor = .blueGrey
//        imgLink.contentMode = .center

        lblLink.text = "Flash"
        imgLink.image = IconFont.image(fromIcon: FontIcon.icon_flash_off, size: sizeOfImage, color: UIColor.white)
        imgLink.layer.cornerRadius = imgLink.frame.size.height/2
        imgLink.backgroundColor = .blueGrey
        imgLink.contentMode = .center

        viewSearch.backgroundColor = UIColor.clear
        viewSearchHt.constant = 0
        viewSearchBottom.constant = 0
        viewWorkoutListHt.constant = 0
        tfSearch.layer.cornerRadius = 6
        tfSearch.layer.borderColor = UIColor.white.cgColor
        tfSearch.layer.borderWidth = 0.5
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tfSearch.frame.size.height))
        tfSearch.leftView = paddingView
        tfSearch.leftViewMode = .always

        if dictParameters.count > 0
        {
            let studio_name : String = dictParameters["studio_name"] as! String
            lblStudioName.text = studio_name
            workout_list = [dictParameters]
            updateWorkoutListUI()
        }

        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.getCurrentLocation()
//        checkURCStatus()
    }

    @objc func appDidBecomeActive (_ notification : Notification)
    {
        print("did become active notification")
        self.getCurrentLocation()
    }
    
//    func checkURCStatus()
//    {
//        if dictParameters.count > 0
//        {
//            MBProgressHUD.showAdded(to: self.view, animated: true)
//            let user_schedule_id = dictParameters["user_schedule_id"] as! String
//            methodName = METHOD_URC_STATUS
//            let url = String(format: "%@%@", SERVER_URL_SECURE, METHOD_URC_STATUS)
//            let param = String(format: "user_schedule_id=%@", user_schedule_id)
//
//            print("url-------",url)
//            let dLoad = Downloader()
//            dLoad.delegate = self
//            dLoad.getResponseFromAPI(url, withParam: param)
//        }
//    }
    
    func getCurrentLocation()
    {
//        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        LocationService.sharedInstance().delegate = self
        LocationService.sharedInstance().startUpdatingLocation()
    }
    
    func configureVideoCapture() {
        let objCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        var error:NSError?
        let objCaptureDeviceInput: AnyObject!
        do {
            objCaptureDeviceInput = try AVCaptureDeviceInput(device: objCaptureDevice!) as AVCaptureDeviceInput
            
        } catch let error1 as NSError {
            error = error1
            objCaptureDeviceInput = nil
        }
        if (error != nil) {
            let alertView:UIAlertView = UIAlertView(title: "Device Error", message:"Device not Supported for this Application", delegate: nil, cancelButtonTitle: "Ok Done")
            alertView.show()
            return
        }
        objCaptureSession = AVCaptureSession()
        objCaptureSession?.addInput(objCaptureDeviceInput as! AVCaptureInput)
        let objCaptureMetadataOutput = AVCaptureMetadataOutput()
        objCaptureSession?.addOutput(objCaptureMetadataOutput)
        objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        objCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
    }
    
    func addVideoPreviewLayer()
    {
        objCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: objCaptureSession!)
        objCaptureVideoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        objCaptureVideoPreviewLayer?.frame = viewCamera.layer.bounds
        viewCamera.layer.addSublayer(objCaptureVideoPreviewLayer!)
        objCaptureSession?.startRunning()
    }

    func initializeQRView() {
        vwQRCode = UIView(frame: CGRect(x: (viewCamera.frame.size.width - blueWidth)/2, y: (viewCamera.frame.size.height - blueWidth)/2, width: blueWidth, height: blueWidth))
//        vwQRCode?.layer.borderColor = UIColor(red: 59.0/255.0, green: 153.0/255.0, blue: 252.0/255.0, alpha: 1).cgColor
//        vwQRCode?.layer.borderWidth = 5
        vwQRCode?.layer.borderColor = UIColor.sunflowerYellow.cgColor
        vwQRCode?.layer.borderWidth = 2
        vwQRCode?.layer.cornerRadius = 4
        viewCamera.addSubview(vwQRCode!)
        viewCamera.bringSubviewToFront(vwQRCode!)
        viewCamera.bringSubviewToFront(btnShowQR)
        viewCamera.bringSubviewToFront(viewRefreshLocation)
        viewCamera.bringSubviewToFront(viewScanFromGallery)
        viewCamera.bringSubviewToFront(viewLink)
    }
    
    func resetCameraView()
    {
        isScanning = true
        tblWorkoutList.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.objCaptureSession?.startRunning()
            self.vwQRCode?.frame = CGRect(x: (self.viewCamera.frame.size.width - self.blueWidth)/2, y: (self.viewCamera.frame.size.height - self.blueWidth)/2, width: self.blueWidth, height: self.blueWidth)
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
            if metadataObjects.count == 0
            {
                print("Unable to read QR code.\nPlease try again.")
                return
            }
            let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if objMetadataMachineReadableCodeObject.type == AVMetadataObject.ObjectType.qr {
                if let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObject(for: objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as? AVMetadataMachineReadableCodeObject
                {
                    UIView.animate(withDuration: 0.5) {
                        self.vwQRCode?.frame = objBarCode.bounds
                    }
                    if objMetadataMachineReadableCodeObject.stringValue != nil {
                        let result = objMetadataMachineReadableCodeObject.stringValue!
                        print("result===========>>>>>>", result)
                        if((result.count) > 0)
                        {
                            objCaptureSession?.stopRunning()
                            sendQRCode(qr_code: result)
                        }
                    }
                }
            }
    }
    
    @IBAction func didTapBack(_ sender: Any)
    {
        removeAlertView()
        self.navigationController?.popViewController(animated: true)
    }
    
    func removeAlertView()
    {
//        let window = ConstantFitFeast.appDelegate.window!
//        if let alView = window.viewWithTag(mealAlertTag) {
//            alView.removeFromSuperview()
//        }
    }
    
    @IBAction func didTapFlash(_ sender: Any)
    {
        let device = AVCaptureDevice.default(for: AVMediaType.video)!
        if (device.hasTorch) {
            do {
                try device.lockForConfiguration()
                if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                    device.torchMode = AVCaptureDevice.TorchMode.off
//                    btnFlash.setAttributedTitle(IconFont.string(fromIcon: FontIcon.icon_flash_off, size: sizeOfImage, color: UIColor.white), for: .normal)
                    imgLink.image = IconFont.image(fromIcon: FontIcon.icon_flash_off, size: sizeOfImage, color: UIColor.white)

                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                        imgLink.image = IconFont.image(fromIcon: FontIcon.icon_flash_on, size: sizeOfImage, color: UIColor.white)
//                        btnFlash.setAttributedTitle(IconFont.string(fromIcon: FontIcon.icon_flash_on, size: sizeOfImage, color: UIColor.white), for: .normal)
                    } catch {
                        print(error)
                    }
                }
                device.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
        
    func sendQRCode(qr_code:String)
    {
        tfSearch.resignFirstResponder()
        var user_schedule_id = ""
        if dictParameters.count > 0
        {
            user_schedule_id = (dictParameters["user_schedule_id"] as! String)
        }
//        MBProgressHUD.showAdded(to: self.view, animated: true)
        MyLoader.showHUDAdded(to: self.view, animated: true)
        
        methodName = APIUrls.apiScanQRCode
        let url = APIUrls.apiScanQRCode
        
        let auth_token = ConstantSwift.UserDefault.string(forKey: SecretKey.USER_AUTH_TOKEN) ?? ""
        let user_id = ConstantSwift.UserDefault.integer(forKey: SecretKey.USER_ID)
        var payLoad:[String:Any] = [
            "qr_code_string":qr_code,
            "user_schedule_id":user_schedule_id,
        ]

        if currentLatitude != 0
        {
            payLoad = [
                "qr_code_string":qr_code,
                "user_schedule_id":user_schedule_id,
                "latitude":currentLatitude,
                "longitude":currentLongitude,
            ]
        }
        
        payLoad["user_id"] = user_id
        payLoad["auth_token"] = auth_token

        print("url-------",url)
        print("payLoad--------",payLoad)
//        let dLoad = Downloader()
//        dLoad.delegate = self
////        dLoad.getResponseFromAPI(url, withParam: stringPost)
//        dLoad.getResponseFromGOAPI(url, withParameters: payLoad)
        
        let ldr = Downloader()
        ldr.downloadDelegate = self
        ldr.getResponse(apiURL: url, params: payLoad)

    }
    
    func showAlert(message : String, error : Bool)
    {
        if error
        {
            isScanning = false
            tblWorkoutList.reloadData()
//            let window = ConstantFitFeast.appDelegate.window!
            let window = self.view!
            if let alView = window.viewWithTag(mealAlertTag) {
                alView.removeFromSuperview()
            }

            let alertView = FFAlertView(frame: CGRect(x: 0, y: Device.iOSDeviceHeight - 100, width: Device.iOSDeviceWidth, height: 100))
            alertView.tag = mealAlertTag
            alertView.delegate = self
            window.addSubview(alertView)
            alertView.setMessageUIWithCustomAction(success:false, message: message, btnText: "Try again", type: 0)
            
//            ConstantSwift.showAlertMessage(message: message, success: false)
        }
        else
        {
            ConstantSwift.showAlertMessage(message: message, success: true)
        }
    }
    
    func updateWorkoutListUI()
    {
        tblWorkoutList.reloadData()
        tblWorkoutListHt.constant = CGFloat(workout_list.count) * cellHeight
        let maxHt: CGFloat = 200
        tblWorkoutListHt.constant = (tblWorkoutListHt.constant > maxHt) ? maxHt:tblWorkoutListHt.constant

        var extraHt:CGFloat = 0
        if Device.IS_IPHONE_X
        {
            extraHt = 30
        }
        tblWorkoutList.isScrollEnabled = true
        btnNeedHelpHt.constant = 0
        btnNeedHelpTop.constant = 0
        btnNeedHelpBottom.constant = 0 + extraHt
        if workout_list.count == 1
        {
            tblWorkoutList.isScrollEnabled = false
//            btnNeedHelpHt.constant = 30
            btnNeedHelpTop.constant = 8
            btnNeedHelpBottom.constant = 8 + extraHt
        }
        
//                    updateUI()
        viewSearchBottom.constant = 0
        viewWorkoutListHt.constant = 59 + tblWorkoutListHt.constant + btnNeedHelpHt.constant + btnNeedHelpTop.constant + btnNeedHelpBottom.constant

    }
    
    @IBAction func didTapShowQR(_ sender: Any)
    {
        tfSearch.resignFirstResponder()
//        let security_code = dictParameters["security_code"] as! String
        let frameworkBundleID  = "com.fitpass.libfitpass";
        let bundle = Bundle(identifier: frameworkBundleID)
        let vc = ShowQRVC(nibName: "ShowQRVC", bundle: bundle)
        vc.dictParameters = dictParameters
        vc.currentLatitude = currentLatitude
        vc.currentLongitude = currentLongitude
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapRefreshLocation(_ sender: Any)
    {
        LocationService.sharedInstance().stopUpdatingLocation()
        self.getCurrentLocation()
//        checkURCStatus()
    }
    
    @IBAction func didTapScanFromGallery(_ sender: Any)
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType =  UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
//        vc!.present(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func didTapSearchByURL(_ sender: Any)
    {
        if !isKeyboardOpen
        {
            viewSearchBottom.constant = 0
            viewSearchHt.constant = 75
            viewWorkoutListHt.constant = 0
            tfSearch.becomeFirstResponder()
        }
    }

    // MARK: - Keyboard KVO
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            isKeyboardOpen = true
            print("notification: Keyboard will show")
            viewSearchBottom.constant = -(keyboardSize.height)// + 15)
            resetCameraView()
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        isKeyboardOpen = false
        viewSearchBottom.constant = 0//-15
        viewSearchHt.constant = 0
        if dictParameters.count > 0
        {
            let studio_name : String = dictParameters["studio_name"] as! String
            lblStudioName.text = studio_name
            workout_list = [dictParameters]
            updateWorkoutListUI()
        }
        resetCameraView()
    }
            
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("TextField should return method called")
        textField.resignFirstResponder()
        let inputText = tfSearch.text!
        if !inputText.isEmpty
        {
            self.sendQRCode(qr_code: inputText)
        }
        else
        {
            ConstantSwift.showAlertMessage(message: "Please enter URL", success: false)
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        print("TextField should begin editing method called")
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        print("TextField should snd editing method called")
        return true;
    }
    
    // MARK: - UITableView DataSource And Delegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return workout_list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier2, for: indexPath) as! ScanWorkoutCell
        let workoutDetail = workout_list[indexPath.row]
        let workout_name = workoutDetail["workout_name"] as! String
        var activity_id = "7"
        if let activity_id_string = workoutDetail["activity_id"] as? String
        {
            activity_id = activity_id_string
        }
        else if let activity_id_int = workoutDetail["activity_id"] as? Int
        {
            activity_id = String(format: "%d", activity_id_int)
        }
        
        cell.imgActivity.image = ConstantSwift.getImageFor(activityId: activity_id, size: 30, color: .white)

        let colorBG11  = ConstantSwift.activityDict[activity_id]!["color1"] as! UIColor
        let colorBG12  = ConstantSwift.activityDict[activity_id]!["color2"] as! UIColor
//        cell.imgActivity.backgroundColor = colorBG12
        
        let p11: CGPoint = CGPoint(x: 0, y: 0)
        let p12: CGPoint = CGPoint(x: 0, y: 1)
//        cell.viewGrad.layer.insertSublayer(ConstantSwift.getGradientView(view: cell.viewGrad, color1: colorBG11, color2: colorBG12, start: p11, end: p12), at: 0)
        cell.viewGrad.layer.addSublayer(ConstantSwift.getGradientView(view: cell.viewGrad, color1: colorBG11, color2: colorBG12, start: p11, end: p12))

        cell.viewGrad.layer.cornerRadius = 5
        cell.imgActivity.layer.cornerRadius = 5
        cell.imgActivity.contentMode = .center
        
        let start_time = workoutDetail["start_time"] as! Int
        print("start_time===", start_time)
        cell.lblTime.text = ConstantSwift.getTimeInStringFromEpochTime(time: start_time)
        
//        let end_time = workoutDetail["end_time"] as! Int
//        print("end_time===", end_time)
//        cell.lblTime.text = String(format: "%@ to %@", cell.lblTime.text!, ConstantSwift.getTimeInStringFromEpochTime(time: end_time))

        cell.btnScan.setTitle("Scan now", for: .normal)
        cell.btnScan.setBackgroundImage(nil, for: .normal)
        cell.btnScan.setImage(IconFont.image(fromIcon: FontIcon.icon_scan, size: 32, color: UIColor.darkIndigo), for: .normal)
        cell.btnHelp.setImage(IconFont.image(fromIcon: FontIcon.icon_help, size: 32, color: UIColor.darkIndigo), for: .normal)

        cell.btnScan.alignVertical(spacing: 3)
        cell.btnHelp.alignVertical(spacing: 3)

        let workout_status = workoutDetail["workout_status"] as! Int
        cell.viewSeperatorLeading.constant = 10
        cell.viewSeperatorTrailing.constant = 10
        cell.btnScanWidth.constant = 45
        cell.viewSeperatorWidth.constant = 0.5
        cell.btnHelpWidth.constant = 45
        cell.lblSuccess.isHidden = true
        cell.lblActivityTop.constant = 18
        if workout_list.count == 1
        {
            cell.viewSeperatorLeading.constant = 0
            cell.viewSeperatorTrailing.constant = 0

            cell.viewSeperatorWidth.constant = 0
            cell.btnHelpWidth.constant = 0
        }
        if workout_status == 3
        {
            cell.viewSeperatorLeading.constant = 0
            cell.viewSeperatorTrailing.constant = 0

            cell.btnScanWidth.constant = 0
            cell.viewSeperatorWidth.constant = 0
            cell.btnHelpWidth.constant = 0
            
            let urc_updated_time = workoutDetail["urc_updated_time"] as! Int
            print("urc_updated_time===", urc_updated_time)
            cell.lblSuccess.text = String(format: "Workout attended successfully at: %@", ConstantSwift.getTimeInStringFromEpochTime(time: urc_updated_time))
            cell.lblSuccess.isHidden = false
            cell.lblActivityTop.constant = 10
            
            cell.imgActivity.image = IconFont.image(fromIcon: FontIcon.icon_tick_reserve, size: 30, color: UIColor.white)
//            cell.imgActivity.image = UIImage(named: "reserve")
            cell.imgActivity.backgroundColor = UIColor.algaeGreen
        }
        if dictParameters.count > 0
        {
//            let usid = dictParameters["user_schedule_id"] as! String
            var user_schedule_id = ""
            if let usid = dictParameters["user_schedule_id"] as? String
            {
                user_schedule_id = usid
            }
            else if let usid = dictParameters["user_schedule_id"] as? Int
            {
                user_schedule_id = String(format: "%d", usid)
            }
            

//            let u_s_id = workoutDetail["user_schedule_id"] as! String
            var u_s_id = ""
            if let usid = workoutDetail["user_schedule_id"] as? String
            {
                u_s_id = usid
            }
            else if let usid = workoutDetail["user_schedule_id"] as? Int
            {
                u_s_id = String(format: "%d", usid)
            }
            
            if u_s_id == user_schedule_id
            {

                if isScanning
                {
                    cell.lblSuccess.text = "Workout scanning in progress"
                    cell.lblSuccess.isHidden = false
                    cell.lblActivityTop.constant = 10

                    let urll = Bundle.main.url(forResource: "qr_scaner", withExtension: "gif")
                    let gifImage = UIImage.animatedImage(withAnimatedGIFURL: urll)
                    cell.btnScan.setBackgroundImage(gifImage, for: .normal)
                    cell.btnScan.setImage(nil, for: .normal)
                    cell.btnScan.setTitle("", for: .normal)
                }

            }

        }


        cell.lblActivity.text = workout_name
        
        
        cell.btnScan.tag = indexPath.row
        cell.btnScan.addTarget(self, action: #selector(didTapScanNow(_:)), for: .touchUpInside)

        cell.btnHelp.tag = indexPath.row
        cell.btnHelp.addTarget(self, action: #selector(didTapHelp(_:)), for: .touchUpInside)

        //
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

    }

    @objc func didTapScanNow(_ btn:UIButton)
    {
        dictParameters = workout_list[btn.tag]
//        btnShowQR.isHidden = (dictParameters.count == 0)
        tblWorkoutList.reloadData()

        removeAlertView()
        resetCameraView()
    }
    
    @objc func didTapHelp(_ btn:UIButton)
    {
        dictParameters = workout_list[btn.tag]
//        btnShowQR.isHidden = (dictParameters.count == 0)

        callHelp()
    }
    
    func callHelp()
    {
//        let vc = HelpAndSupportVC()
//        vc.dictParameters = dictParameters
//        if currentLatitude != 0
//        {
//            vc.currentLatitude = currentLatitude
//            vc.currentLongitude = currentLongitude
//        }
//        self.navigationController?.pushViewController(vc, animated: true)
    }


}


extension UIButton {
    func alignVertical(spacing: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [kCTFontAttributeName as NSAttributedString.Key: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}

extension ConfirmWorkoutVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
        DispatchQueue.main.async {
                   
            if let qrcodeImg = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue) ] as? UIImage {
                let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])!
                let ciImage:CIImage=CIImage(image:qrcodeImg)!
      
                let features=detector.features(in: ciImage)
                if features.count == 0
                {
                    let errorMsg = "No QR Code detected. " + Messages.TRY_AGAIN
                    ConstantSwift.showAlertMessage(message: errorMsg, success: false)
                }
                else if features.count > 1
                {
                    let errorMsg = "Multiple QR Code detected. " + Messages.TRY_AGAIN
                    ConstantSwift.showAlertMessage(message: errorMsg, success: false)
                }
                else if features.count == 1
                {
                    self.resetCameraView()
                    let feature = features[0] as! CIQRCodeFeature
                    let qrCode = feature.messageString!
                    self.sendQRCode(qr_code: qrCode)

//                    for feature in features as! [CIQRCodeFeature] {
//                        qrCodeLink += feature.messageString!
//                    }
//
//                    if qrCodeLink=="" {
//                        print("nothing")
//                    }else{
//                        print("message: \(qrCodeLink)")
//                    }
                }
                else
                {
                    ConstantSwift.showAlertMessage(message: Messages.TRY_AGAIN, success: false)
                    print("Something went wrong")
                }
            }
            else{
                ConstantSwift.showAlertMessage(message: Messages.TRY_AGAIN, success: false)
                print("Something went wrong")
            }
           self.dismiss(animated: true, completion: nil)            
        }
    }
}


extension ConfirmWorkoutVC: FFAlertViewDelegate
{
    func didTapActionBtn()
    {
        print("didTapActionBtn======")
        self.resetCameraView()
    }
}

extension ConfirmWorkoutVC:DownloaderDelagate
{
    func downloadDidFinishedWithSuccess(responseDict: [String : Any]) {
//        debugPrint("gotten json response dictionary is \n \(responseDict)")
        MyLoader.hideHUD(for: self.view, animated: true)
        if(responseDict.count == 0)
        {
            return
        }
        
        

        
//        MBProgressHUD.hide(for: self.view, animated: true)
        print("resonsedictionary>>>>",responseDict as Any)
        if methodName == APIUrls.apiScanQRCode
        {
//            if(responseDict == nil)
//            {
//                ConstantSwift.showAlertMessage(message: Messages.TRY_AGAIN, success: false)
////                showAlert(message: TRY_AGAIN, error: true)
//                return
//            }
//            let code : Int = dictionary!["code"] as! Int
//            let message : String = dictionary!["message"] as! String
//            if(code != SUCCESS_CODE)
//            {
//                showAlert(message: message, error: true)
//                return
//            }
//            else
//            {
            let code = responseDict["code"] as! Int
            if(code != ConstantSwift.SUCCESS_CODE)
            {
                let message : String = responseDict["message"] as! String
//                ConstantSwift.showAlertMessage(message: message, success: false)
                showAlert(message: message, error: true)
                return
            }
            if let results = responseDict["results"] as? [String:Any]
            {
            debugPrint("results===", results)

                let response_type : String = results["response_type"] as? String ?? ""
//                if response_type == "corporate"
//                {
//                    let corporate_id : Int = results["corporate_id"] as! Int
//                    let vc = BankOfferLandingPage()
//                    vc.corporate_id = String(format: "%d", corporate_id)
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//                else
            if response_type == "upcoming_workout"
                {
                    let studio_name : String = results["studio_name"] as! String
                    let studio_logo : String = results["studio_logo"] as! String
                    let address : String = results["address"] as! String
                    lblStudioName.text = studio_name
                    workout_list = results["workout_list"] as! [[String:Any]]
                    
                    let workout_list_temp = results["workout_list"] as! [[String:Any]]
                    workout_list.removeAll()
                    for ind in 0..<workout_list_temp.count
                    {
                        var workout = workout_list_temp[ind]
                        workout["studio_name"] = studio_name
                        workout["studio_logo"] = studio_logo
                        workout["address"] = address
                        workout_list.append(workout)
                    }
                    if workout_list.count == 1
                    {
                        dictParameters = workout_list[0]
                        resetCameraView()
                    }
                    
                    updateWorkoutListUI()
                }
            }
                else
                {
                    if(code == ConstantSwift.SUCCESS_CODE)
                    {
//                        ConstantSwift.UserDefault.setValue(true, forKey: REFRESH_DASHBOARD)
//                        showAlert(message: message, error: false)
//                        self.navigationController?.popViewController(animated: true)
                        let message : String = responseDict["message"] as! String
                        showAlert(message: message, error: false)

                    }
                    else
                    {
                        let message : String = responseDict["message"] as! String
                        showAlert(message: message, error: true)
                    }
                }

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
//                    //Cancel Action
//            self.navigationController?.popViewController(animated: true)
//                }))
//
//        alert.addAction(UIAlertAction(title: "TRY AGAIN", style: UIAlertAction.Style.default, handler: { _ in
//                    //Cancel Action
//            self.callAPI()
//                }))
//
//                self.present(alert, animated: true, completion: nil)
//    }
}
