//
//  FPDashboardCardViewCell.swift
//  libfitpass
//
//  Created by Ravinder Singh on 24/08/22.
//

import UIKit

class FPDashboardCardViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBG: UIView!
    
//    //Image
//    @IBOutlet weak var viewImage: UIView!
//    @IBOutlet weak var viewImageView: UIImageView!
    
    //Workout
    @IBOutlet weak var viewGreenDot: UIView!
    @IBOutlet weak var viewGreenDotW: NSLayoutConstraint!
    @IBOutlet weak var viewGreenDotTrailing: NSLayoutConstraint!
    @IBOutlet weak var lblUpcoming: UILabel!
    @IBOutlet weak var lblConfirmWorkoutTime: UILabel!
    @IBOutlet weak var imgWorkout: UIImageView!
    @IBOutlet weak var lblWorkoutName: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var viewStudio: UIView!
    @IBOutlet weak var imgStudio: UIImageView!
    @IBOutlet weak var lblStudioName: UILabel!
    @IBOutlet weak var lblStudioLocation: UILabel!
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnHelpLeading: NSLayoutConstraint!
    @IBOutlet weak var btnHelpWidth: NSLayoutConstraint!
    @IBOutlet weak var btnDirection: UIButton!

    @IBOutlet weak var viewScan: UIView!
    @IBOutlet weak var btnQrCode: UIButton!
    @IBOutlet weak var btnQrScan: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
