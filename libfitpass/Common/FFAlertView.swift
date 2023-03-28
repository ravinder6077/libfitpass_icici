//
//  FFAlertView.swift
//  FITPASS_v3
//
//  Created by Ravinder Singh on 07/01/22.
//  Copyright © 2022 Fitpass. All rights reserved.
//

import UIKit
protocol FFAlertViewDelegate
{
//    optional
    func didTapActionBtn()
}

class FFAlertView: UIView {

    @IBOutlet weak var viewBG: CardView!
    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var imgTypeWidth: NSLayoutConstraint!
    @IBOutlet weak var imgTypeTrailing: NSLayoutConstraint!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnCross: UIButton!
    @IBOutlet weak var btnCrossWidth: NSLayoutConstraint!
    @IBOutlet weak var btnCrossTop: NSLayoutConstraint!
    @IBOutlet weak var btnCrossTrailing: NSLayoutConstraint!
    @IBAction func didTapBtnCross(_ sender: Any)
    {
        if (delegate != nil)
        {
            delegate.didTapActionBtn()
        }
        closeThisView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }
    

    let nibName = "FFAlertView"
    var delegate: FFAlertViewDelegate!
    
    func loadViewFromNib() -> UIView {
        // grabs the appropriate bundle
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    var view: UIView!
    
    func xibSetUp() {
        // setup the view from .xib
        view = loadViewFromNib()
        view.backgroundColor = UIColor.clear
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)

//        viewBG.backgroundColor = UIColor.darkIndigo.withAlphaComponent(0.7)
//        viewBG.layer.cornerRadius = 10
        
        imgType.layer.cornerRadius = imgType.frame.size.height/2
    }

    func setMealSuccessUI(message:String, btnText:String, type:Int)
    {
        lblMessage.text = message
        viewBG.backgroundColor = UIColor.algaeGreen
//        if type == 1
//        {
//            imgType.image = IconFont.image(fromIcon: FontIcon.meal_log, size: 24, color: .white)
//        }
//        else
//        {
            imgType.image = IconFont.image(fromIcon: FontIcon.icon_tick, size: 24, color: .white)
//        }
        btnCrossTop.constant = 15
        btnCrossTrailing.constant = 15
        btnCrossWidth.constant = 55
        
//        let btnText = "View Meal"
        let attributedString1 = NSMutableAttributedString(string: btnText)
        attributedString1.addAttributes([
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.white,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: Fonts.font_Roboto_Regular, size: 12)!
            ], range: NSRange(location: 0, length: btnText.count))
        btnCross.setAttributedTitle(attributedString1, for: .normal)
        //startTimer()
    }
    
    func setMessageUIWithCustomAction(success:Bool, message:String, btnText:String, type:Int)
    {
        lblMessage.text = message
//        viewBG.backgroundColor = UIColor.algaeGreen
        if success
        {
            viewBG.backgroundColor = UIColor.algaeGreen
            imgType.image = IconFont.image(fromIcon: FontIcon.tick, size: 24, color: .white)
        }
        else
        {
            viewBG.backgroundColor = UIColor.watermelon
            imgType.image = IconFont.image(fromIcon: FontIcon.alert, size: 24, color: .white)
        }
//        if type == 1
//        {
//            imgType.image = IconFontFitFeast.image(fromIcon: FontIconFitFeast.diet_note, size: 24, color: .white)
//        }
//        else
//        {
//            imgType.image = IconFont.image(fromIcon: FontIcon.icon_tick, size: 24, color: .white)
//        }
        btnCrossTop.constant = 15
        btnCrossTrailing.constant = 15
        btnCrossWidth.constant = 55
        
        let attributedString1 = NSMutableAttributedString(string: btnText)
        attributedString1.addAttributes([
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.white,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: Fonts.font_Roboto_Regular, size: 12)!
            ], range: NSRange(location: 0, length: btnText.count))
        btnCross.setAttributedTitle(attributedString1, for: .normal)
        //startTimer()
    }
    
    func setMessageWithSuccess(success:Bool, message:String)
    {
        lblMessage.text = message
        if success
        {
            viewBG.backgroundColor = UIColor.algaeGreen
            imgType.image = IconFont.image(fromIcon: FontIcon.tick, size: 24, color: .white)
        }
        else
        {
            viewBG.backgroundColor = UIColor.watermelon
            imgType.image = IconFont.image(fromIcon: FontIcon.alert, size: 24, color: .white)
        }
        startTimer()
    }

    func setMessageWithInfo(message:String)
    {
        lblMessage.text = message
        viewBG.backgroundColor = UIColor.white
        imgTypeWidth.constant = 0
        imgTypeTrailing.constant = 0
        startTimer()
    }
    
    weak var progressTimer: Timer?
    var totalTime: Double = 15.0
    func startTimer()
    {
        progressTimer?.invalidate()
        progressTimer = Timer.scheduledTimer(timeInterval: totalTime, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
    }
    
    @objc func fireTimer() {
//        print("Timer fired!")
        closeThisView()
    }
    
    func closeThisView()
    {
        progressTimer?.invalidate()
        self.removeFromSuperview()
    }

}
