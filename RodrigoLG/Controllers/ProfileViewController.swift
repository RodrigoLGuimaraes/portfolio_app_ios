//
//  ProfileViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit
import Hero

class ProfileViewController: UIViewController {
    //Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var stackViewButtons: UIStackView!
    
    //Constraints
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    var initialTopMargin : CGFloat = 0
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    var initialBottomMargin : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = backgroundImage.bounds
        backgroundImage.addSubview(visualEffectView)
        
        initialTopMargin = stackViewTopConstraint.constant
        initialBottomMargin = stackViewBottomConstraint.constant
    }

    override func viewDidLayoutSubviews() {
        var maxWidth : CGFloat = 0
        for view in stackViewButtons.arrangedSubviews {
            if view.bounds.width > maxWidth {
                maxWidth = view.bounds.width
            }
        }
        
        let newHeight = maxWidth
        let currentHeight = stackViewButtons.bounds.height
        let differenceInEachConstraint = (currentHeight - newHeight)/2
        stackViewTopConstraint.constant += initialTopMargin >= 0 ? differenceInEachConstraint : -differenceInEachConstraint
        stackViewBottomConstraint.constant += initialBottomMargin >= 0 ? differenceInEachConstraint : -differenceInEachConstraint
        print("*****")
        print(differenceInEachConstraint)
        print(newHeight)
        print(currentHeight)
        print("*****")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

}
