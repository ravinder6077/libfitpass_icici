//
//  WorkoutListVC.swift
//  libfitpass_icici
//
//  Created by Ravinder Singh on 23/03/23.
//

import UIKit
import WebKit

class WorkoutListVC: MyViewController {
    
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
    
    @IBOutlet weak var cvTab: UICollectionView!
    @IBOutlet weak var cvTabLeading: NSLayoutConstraint!
    @IBOutlet weak var cvTabTrailing: NSLayoutConstraint!
    @IBOutlet weak var webView: WKWebView!
    
    var myTitle = "FITPASS"
    var hexColorHeaderBG = "#625986"
    var hexColorTitleFG = "#FFFFFF"
    var padding:CGFloat = 20
    
    var past_workout = ""
    var upcoming_workout = ""
    var past_label = "Completed Workout"
    var upcoming_label = "Upcoming Workout"

    let reuseId1          = "BlogFilterCollectionViewCell"
    var tabList = [String]()
    var selectedProductIndex = 0
    var white_list_url = ""
    var arrayWorkout = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let colorTitle = COLORS.hexStringToUIColor(hex: hexColorTitleFG)
        btnBack.setTitle("", for: .normal)
        btnBack.setImage(IconFont.image(fromIcon: FontIcon.back_arrow, size: 20, color: colorTitle), for: .normal)
        lblHeader.text = myTitle
        lblHeader.textColor = colorTitle
        viewHeader.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorHeaderBG)
        
        btnBackLeading.constant = padding
        
        tabList.append(upcoming_label)
        tabList.append(past_label)
        
        debugPrint("Device.topNotch====", Device.NotchTop)
        debugPrint("past_workout====", past_workout)
        debugPrint("upcoming_workout====", upcoming_workout)
        viewHeaderHt.constant = viewHeaderHt.constant + Device.NotchTop
        
        //        let nib01 = UINib(nibName: reuseId1, bundle: nil)
        //        cvTab?.register(nib01, forCellWithReuseIdentifier: reuseId1)
        cvTab.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId1)
        //        cvTabLeading.constant = padding
        //        cvTabTrailing.constant = padding
        
        let request = URLRequest(url: URL(string: upcoming_workout)!)
        webView.scrollView.bounces = false
        webView.navigationDelegate = self
        webView.load(request)
        //        webView.isOpaque = false
        MyLoader.showHUDAdded(to: self.view, animated: true)
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}



extension WorkoutListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate
{
    // MARK: - UICollectionView DataSource And Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //        if collectionView == cvTab
        //        {
        //            return product_list.count
        //        }
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //        if collectionView == cvTab
        //        {
        //            return CGSize(width: ((ConstantSwift.Device.SCREEN_WIDTH - 0) / CGFloat(product_list.count)), height: 31)
        //        }
        //        else if collectionView == cvImages
        //        {
        //            return CGSize(width: ConstantSwift.Device.SCREEN_WIDTH , height: 220)
        //        }
        //        return CGSize(width: pageBarWidth , height: pageBarHeight)
        return CGSize(width: (Device.SCREEN_WIDTH / CGFloat(tabList.count)), height: 31)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId1, for: indexPath)
        
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let viewBGShadow = UIView(frame: CGRect(x: 10, y: 10, width: cell.frame.size.width-20, height: cell.frame.size.height-20))
        cell.contentView.addSubview(viewBGShadow)
        
        let product = tabList[indexPath.row]
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = product
        textLabel.font = UIFont(name: Fonts.font_Roboto_Regular, size: 16)
        textLabel.textColor = UIColor.white
        cell.contentView.addSubview(textLabel)
        
//        let selectionViewWidth:CGFloat = 150
        let selectionViewWidth = product.width(withConstrainedHeight: 20, font: textLabel.font)
        let startX:CGFloat = (cell.frame.size.width - selectionViewWidth)/2
        let selectionView = UIView(frame: CGRect(x: startX, y: cell.frame.size.height - 3, width: selectionViewWidth, height: 3))
        cell.contentView.addSubview(selectionView)
        selectionView.backgroundColor = UIColor.clear
                
        
        if indexPath.row == selectedProductIndex
        {
            textLabel.font = UIFont(name: Fonts.font_Roboto_Medium, size: 16)
            textLabel.textColor = COLORS.hexStringToUIColor(hex: hexColorTitleFG)
            selectionView.backgroundColor = COLORS.hexStringToUIColor(hex: hexColorTitleFG)
            
            
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedProductIndex = indexPath.row
        cvTab.reloadData()
        MyLoader.showHUDAdded(to: self.view, animated: true)
        if selectedProductIndex == 0
        {
            let request = URLRequest(url: URL(string: upcoming_workout)!)
            webView.load(request)
        }
        else
        {
            let request = URLRequest(url: URL(string: past_workout)!)
            webView.load(request)
        }
    }
    
}

extension WorkoutListVC: WKNavigationDelegate
{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (_: WKNavigationActionPolicy) -> Void)
    {
        let webViewUrl:String = navigationAction.request.url!.absoluteString
        print("decidePolicyFor======", webViewUrl)
        print("white_list_url=====", white_list_url)
        
        if (webViewUrl.contains(white_list_url))
        {
            decisionHandler(.cancel)
            let frameworkBundleID  = "com.fitpass.libfitpass";
            let bundle = Bundle(identifier: frameworkBundleID)
            let vc = ConfirmWorkoutVC(nibName: "ConfirmWorkoutVC", bundle: bundle)
            
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
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        print("didFinish navigation")
        MyLoader.hideHUD(for: self.view, animated: true)
    }
}
