//
//  ShowQRVC.swift
//  FITPASS_v3
//
//  Created by Ravinder Singh on 30/09/20.
//  Copyright © 2020 Fitpass. All rights reserved.
//

import UIKit
import CoreLocation

class ShowQRVC: UIViewController {

    @IBOutlet weak var hViewGrad: UIView!
    @IBOutlet weak var hView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var imgVQR: UIImageView!
    
    @IBOutlet weak var lblDummy: UILabel!
    @IBOutlet weak var viewGrad: UIView!
    @IBOutlet weak var imgFitpassLogo: UIImageView!
    
    @IBOutlet weak var viewStudioDetail: UIView!
    @IBOutlet weak var imgViewStudio: UIImageView!
    @IBOutlet weak var lblStudioName: UILabel!
    @IBOutlet weak var lblStudioLocality: UILabel!

    @IBOutlet weak var viewWorkout: UIView!
    @IBOutlet weak var imgViewWorkout: UIImageView!
    @IBOutlet weak var lblWorkoutName: UILabel!
    @IBOutlet weak var lblWorkoutTime: UILabel!
    @IBOutlet weak var btnHelp: UIButton!
    @IBAction func didTapBtnHelp(_ sender: Any)
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
    
    
    //    var security_code = ""
    var dictParameters = [String:Any]()
    var currentLatitude = CLLocationDegrees()
    var currentLongitude = CLLocationDegrees()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }

        btnBack.setAttributedTitle(IconFont.string(fromIcon: FontIcon.back_arrow, size: ConstantSwift.BackFontSize, color: UIColor.darkIndigo), for: .normal)
        
//        viewCenter.layer.cornerRadius = 4
//        viewCenter.layer.borderColor = UIColor.darkIndigo.cgColor
//        viewCenter.layer.borderWidth = 1.0
        imgFitpassLogo.image = IconFont.image(fromIcon: FontIcon.fitpass_logo, size: 90, color: .white)
        viewCenter.layer.cornerRadius = 6
        viewStudioDetail.layer.cornerRadius = 4
        if let studio_logo = dictParameters["studio_logo"] as? String
        {
            imgViewStudio.imageURL = URL(string: studio_logo)
        }
        
        let address = dictParameters["address"] as! String
        let studio_name = dictParameters["studio_name"] as! String
        lblStudioName.text = studio_name
        lblStudioLocality.text = address

        
        //
        let workout_name = dictParameters["workout_name"] as! String
        let start_time = dictParameters["start_time"] as! Int
        print("start_time===", start_time)
        lblWorkoutName.text = workout_name
        lblWorkoutTime.text = ConstantSwift.getTimeInStringFromEpochTime(time: start_time)

        imgViewWorkout.image = nil
        var activity_id = "7"
        if let activity_id_string = dictParameters["activity_id"] as? String
        {
            activity_id = activity_id_string
        }
        else if let activity_id_int = dictParameters["activity_id"] as? Int
        {
            activity_id = String(format: "%d", activity_id_int)
        }
        ConstantSwift.setImageFor(activityId: activity_id, size: 30, imgView: imgViewWorkout)
//        imgViewWorkout.image = ConstantSwift.getImageFor(activityId: activity_id, size: 30, color: .white)
        imgViewWorkout.backgroundColor = .white
        imgViewWorkout.layer.cornerRadius = 5
        
        btnHelp.isHidden = true
        btnHelp.setImage(IconFont.image(fromIcon: FontIcon.icon_help, size: 32, color: UIColor.white), for: .normal)
        btnHelp.alignVertical(spacing: 3)


        //

        viewGrad.layer.cornerRadius = 10
        let p11: CGPoint = CGPoint(x: 0, y: 0)
        let p12: CGPoint = CGPoint(x: 0, y: 1)
        viewGrad.layer.insertSublayer(ConstantSwift.getGradientView(view: viewGrad, color1: UIColor.watermelon, color2: UIColor.darkIndigo, start: p11, end: p12), at: 0)
//        viewGrad.layer.addSublayer(ConstantSwift.getGradientView(view: cell.viewGrad, color1: colorBG11, color2: colorBG12, start: p11, end: p12))

        
        let security_code = dictParameters["security_code"] as! String
        let user_schedule_id = dictParameters["user_schedule_id"] as! String
        let timeStamp = Date().toMillis()
        print("timeStamp=====", timeStamp!)

        lblDummy.text = security_code
        lblDummy.isHidden = true
        //&latitude=value&longitude=value&
        var qr_string = String(format: "security_code=%@&user_schedule_id=%@&qrcode_create_time=%d", security_code, user_schedule_id, timeStamp!)
        
        if currentLatitude != 0
        {
            qr_string = String(format: "%@&latitude=%f&longitude=%f", qr_string, currentLatitude, currentLongitude)
        }
        
        print("qr_string=====", qr_string)
//        let encryptedPostString = ConstantSwift.appDelegate.getEncryptText(qr_string)!
        
//        let secretKey = "a8yPNPM9/@1SHSHSx6Kls8XJfsd6jj4hgfsfdjnB20Ys8APkJr+rbdg4Hfm9p3XXXL&"
        let secretKey = ConstantSwift.UserDefault.string(forKey: SecretKey.qr_key) ?? SecretKey.qr_key_default
        let ldr = Downloader()
        let encryptedPostString = ldr.getEncryptText(plainText: qr_string, secretKey: secretKey)
        print("encoded string=====", encryptedPostString)

        
        let imageQR = generateQRCode(from: encryptedPostString)
        imgVQR.image = imageQR


    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    @IBAction func didTapBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
