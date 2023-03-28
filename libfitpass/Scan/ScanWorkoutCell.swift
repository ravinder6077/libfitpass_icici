//
//  ScanWorkoutCell.swift
//  FITPASS_v3
//
//  Created by Ravinder Singh on 02/06/22.
//  Copyright © 2022 Fitpass. All rights reserved.
//

import UIKit

class ScanWorkoutCell: UITableViewCell {

    @IBOutlet weak var viewGrad: UIView!
    @IBOutlet weak var imgActivity: UIImageView!
    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var lblActivityTop: NSLayoutConstraint!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblSuccess: UILabel!

    @IBOutlet weak var btnScan: UIButton!
    @IBOutlet weak var btnScanWidth: NSLayoutConstraint!
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnHelpWidth: NSLayoutConstraint!

    @IBOutlet weak var viewSeperator: UIView!
    @IBOutlet weak var viewSeperatorWidth: NSLayoutConstraint!
    @IBOutlet weak var viewSeperatorLeading: NSLayoutConstraint!
    @IBOutlet weak var viewSeperatorTrailing: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
