//
//  PostViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-24.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIWebViewDelegate {
   
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var postLink: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url : URL = URL(string: postLink)!
        let request: URLRequest = URLRequest(url: url)
        webView.loadRequest(request)
        webView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Hide navigation controller background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
