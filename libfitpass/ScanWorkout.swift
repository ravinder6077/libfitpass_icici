//
//  ScanWorkout.swift
//  libfitpass
//
//  Created by Ravinder Singh on 22/08/22.
//

import UIKit

class ScanWorkout: UIViewController {

    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBAction func didTalBtnBack(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var lblTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
