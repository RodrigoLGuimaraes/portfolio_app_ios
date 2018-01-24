//
//  PersonalizedButton.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-24.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class PersonalizedButton: UIButton {

    @IBInspectable
    public var round : Bool = true {
        didSet {
            if (round) {
                layer.cornerRadius = self.bounds.width/2
            } else {
                layer.cornerRadius = 0
            }
        }
    }
    
    @IBInspectable
    public var labelNumberOfLines: Int = 1 {
        didSet {
            if let label = self.titleLabel {
                label.numberOfLines = labelNumberOfLines
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.textAlignment = .center
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
