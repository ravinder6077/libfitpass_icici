//
//  CommonWebPage.swift
//  libfitpass
//
//  Created by Ravinder Singh on 30/08/22.
//

import UIKit
import WebKit

protocol CommonWebPageDelegate
{
    func refreshHome()
}

class CommonWebPage: MyViewController, WKNavigationDelegate
{

    @IBOutlet weak var viewHeaderBG: UIView!
    @IBOutlet weak var viewHeaderBGHt: NSLayoutConstraint!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var viewHeaderHt: NSLayoutConstraint!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnBackLeading: NSLayoutConstraint!
    @IBAction func didTapBtnBack(_ sender: Any)
    {
        if (self.webView.canGoBack) {
            debugPrint("Can go back")
            self.webView.goBack()
        }
        else
        {
            debugPrint("Can't go back")
            delegate.refreshHome()
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var viewCopyRight: UIView!
    @IBOutlet weak var viewCopyRightBottom: NSLayoutConstraint!
    @IBOutlet weak var lblCopyRight: UILabel!

    var myTitle = "FITPASS"
    var hexColorHeaderBG = "#625986"
    var hexColorTitleFG = "#FFFFFF"
    var padding:CGFloat = 20

    var copyright_string = ""
    var webUrl = ""
    var backUrl = ""
    var showHeader = true
    var delegate: CommonWebPageDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }

        let link = URL(string:webUrl)!
        let request = URLRequest(url: link)
        webView.scrollView.bounces = false
        webView.navigationDelegate = self
        webView.load(request)

        viewHeaderHt.constant = viewHeaderHt.constant + Device.NotchTop
        viewHeaderBGHt.constant = 0
        if !showHeader
        {
            viewHeaderHt.constant = 0
            
            if #available(iOS 11.0, *) {
                let window : UIWindow = UIApplication.shared.windows.first!
//                let window = UIApplication.shared.keyWindow
                let topPadding = window.safeAreaInsets.top
                let bottomPadding = window.safeAreaInsets.bottom
                
//                viewHeaderHt.constant = -topPadding
                viewHeaderBGHt.constant = topPadding
            }
        }
        
        let colorTitle = COLORS.hexStringToUIColor(hex: hexColorTitleFG)
        btnBack.setTitle("", for: .normal)
        btnBack.setImage(IconFont.image(fromIcon: FontIcon.back_arrow, size: 20, color: colorTitle), for: .normal)
        btnBackLeading.constant = padding
        lblHeader.text = myTitle
        lblHeader.textColor = colorTitle
        viewHeader.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorHeaderBG)
        viewHeaderBG.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorHeaderBG)
        self.view.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorHeaderBG)

        viewCopyRightBottom.constant = Device.NotchBottom// ? 20:0
        viewCopyRight.isHidden = true
        if !copyright_string.isEmpty
        {
            viewCopyRight.isHidden = false
            lblCopyRight.text = copyright_string
        }

    }
    

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (_: WKNavigationActionPolicy) -> Void)
    {
//        let cancelUrl = String(format: "%@%@", SERVER_URL_TRANSACTION, METHOD_PAYMENT_CANCELLED_BY_USER)
//        let statusUrl = String(format: "%@%@", SERVER_URL_TRANSACTION, METHOD_PAYMENT_STATUS)
//        if ((navigationAction.request.url!.absoluteString.contains(cancelUrl)))
//        {
//            print("payment cancelled by user=======")
//            self.navigationController?.popViewController(animated: true)
////            decisionHandler(.cancel)
//        }
//        else if ((navigationAction.request.url!.absoluteString.contains(statusUrl)))
//        {
////            let myURLString = "https://google.com"
//            let myURLString = statusUrl
//            guard let myURL = URL(string: myURLString) else {
//                print("Error: \(myURLString) doesn't seem to be a valid URL")
//                return
//            }
//
//            do {
//                let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
//                print("HTML : \(myHTMLString)")
//            } catch let error {
//                print("Error: \(error)")
//            }
//
//        }
//        else
//        {
//            let myURLString = "https://google.com"
//            guard let myURL = URL(string: myURLString) else {
//                print("Error: \(myURLString) doesn't seem to be a valid URL")
//                return
//            }
//
//            do {
//                let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
//                print("HTML : \(myHTMLString)")
//            } catch let error {
//                print("Error: \(error)")
//            }
//
//        }

        print("decidePolicyFor======", navigationAction.request.url!)
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
//        MBProgressHUD.hide(for: self.view, animated: true)
        print("didFinish navigation")
//        let returnUrl = backUrl
        let cancelUrl = backUrl
        if ((webView.url?.absoluteString.contains(cancelUrl))!)
        {
            print("webview cancelled by user=======")
            delegate.refreshHome()
            self.navigationController?.popViewController(animated: true)
        }
//        else if ((webView.url?.absoluteString.contains(returnUrl))!)
//        {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                self.callConfirmOrder()
//            }
//        }

    }


}
