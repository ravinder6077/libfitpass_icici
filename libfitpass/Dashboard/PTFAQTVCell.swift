//
//  PTFAQTVCell.swift
//  FITPASS_v3
//
//  Created by Ravinder Singh on 17/06/20.
//  Copyright © 2020 Fitpass. All rights reserved.
//

import UIKit

class PTFAQTVCell: UITableViewCell {

    @IBOutlet weak var viewCard: CardView!
    @IBOutlet weak var lblQues: UILabel!
    @IBOutlet weak var lblQuesTop: NSLayoutConstraint!
    @IBOutlet weak var lblQuesBottom: NSLayoutConstraint!
    @IBOutlet weak var viewSeperator: UIView!
    //    @IBOutlet weak var lblQuesH: NSLayoutConstraint!
    @IBOutlet weak var lblAns: UILabel!
//    @IBOutlet weak var lblAnsH: NSLayoutConstraint!
    @IBOutlet weak var imgPlusMinus: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
