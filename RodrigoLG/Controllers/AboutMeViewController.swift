//
//  AboutMeViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-26.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var stackViewCards: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic.layer.cornerRadius = 20
        profilePic.layer.borderWidth = 2
        profilePic.layer.borderColor = UIColor.flatSand.cgColor
        
        for view in stackViewCards.arrangedSubviews {
            view.layer.cornerRadius = 10
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.init(red: 41/255.0, green: 32/255.0, blue: 57/255.0, alpha: 1).cgColor
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
