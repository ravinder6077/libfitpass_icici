//
//  FPDashboardWorkoutCell.swift
//  libfitpass_icici
//
//  Created by Ravinder Singh on 21/03/23.
//

import UIKit

class FPDashboardWorkoutCell: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblStudioName: UILabel!
    @IBOutlet weak var lblWorkoutName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
