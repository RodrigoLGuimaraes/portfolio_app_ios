//
//  EasterEggViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-25.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit
import LLSwitch
import ChameleonFramework
import SAConfettiView

class EasterEggViewController: UIViewController, LLSwitchDelegate {

    var confettiView : SAConfettiView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let switchWidth : CGFloat = 120
        let switchHeight : CGFloat = 60
        let llSwitch = LLSwitch(frame: CGRect(x: self.view.bounds.width/2 - switchWidth/2, y: self.view.bounds.height/2 - switchHeight/2, width: switchWidth, height: switchHeight))
        llSwitch.offColor = UIColor.flatGray
        llSwitch.onColor = UIColor.flatYellow
        llSwitch.faceColor = UIColor.white
        llSwitch.animationDuration = 1.2
        llSwitch.setOn(false, animated: false)
        llSwitch.delegate = self
        self.view.addSubview(llSwitch)
    }
    
    func valueDidChanged(_ llSwitch: LLSwitch!, on: Bool) {
        if on {
            //Play animation
            let confettiView = SAConfettiView(frame: self.view.bounds)
            confettiView.type = .Image(UIImage(named: "smiley")!)
            self.view.addSubview(confettiView)
            confettiView.startConfetti()
        } else {
            //Stop animation
            if let view = confettiView {
                view.removeFromSuperview()
                confettiView = nil
            }
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
