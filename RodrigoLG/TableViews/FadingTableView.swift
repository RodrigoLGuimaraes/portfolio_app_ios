//
//  FadingTableView.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

//SOURCE: https://stackoverflow.com/questions/10570247/fade-edges-of-uitableview

import UIKit

class FadingTableView : UITableView {
    var percent = Float(0.08)
    
    fileprivate let outerColor = UIColor(white: 1.0, alpha: 0.0).cgColor
    fileprivate let innerColor = UIColor(white: 1.0, alpha: 1.0).cgColor
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addObserver(self, forKeyPath: "bounds", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if object is FadingTableView && keyPath == "bounds" {
            initMask()
        }
    }
    
    deinit {
        removeObserver(self, forKeyPath:"bounds")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateMask()
    }
    
    func initMask() {
        let maskLayer = CAGradientLayer()
        maskLayer.locations = [0.0, NSNumber(value: percent), NSNumber(value:1 - percent), 1.0]
        maskLayer.bounds = CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height)
        maskLayer.anchorPoint = CGPoint.zero
        self.layer.mask = maskLayer
        
        updateMask()
    }
    
    func updateMask() {
        let scrollView : UIScrollView = self
        
        var colors = [AnyObject]()
        
        if(scrollView.contentOffset.y <= -scrollView.contentInset.top) { // top
            colors = [innerColor, innerColor, innerColor, outerColor];
        }
        else if((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) { // bottom
            colors = [outerColor, innerColor, innerColor, innerColor]
        }
        else {
            colors = [outerColor, innerColor, innerColor, outerColor]
        }
        
        if let mask = scrollView.layer.mask as? CAGradientLayer {
            mask.colors = colors
            
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            mask.position = CGPoint(x: 0.0, y: scrollView.contentOffset.y)
            CATransaction.commit()
        }
    }
}
