//
//  DashboardMenuCell.swift
//  libfitpass
//
//  Created by Ravinder Singh on 29/08/22.
//

import UIKit

class DashboardMenuCell: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewImageBG: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblSubHeading: UILabel!
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
