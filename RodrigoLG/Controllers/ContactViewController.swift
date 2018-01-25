//
//  ContactViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-25.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var youtubeView: UIView!
    @IBOutlet weak var linkedingView: UIView!
    @IBOutlet weak var facebookView: UIView!
    
    enum SocialNetwork {
        case facebook
        case youtube
        case linkedin
    }
    
    var url : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapYouTube = UITapGestureRecognizer(target: self, action: #selector(self.handleYoutubeTap(sender:)))
        youtubeView.addGestureRecognizer(tapYouTube)
        let tapFaceBook = UITapGestureRecognizer(target: self, action: #selector(self.handleFacebookTap(sender:)))
        facebookView.addGestureRecognizer(tapFaceBook)
        let tapLinkedin = UITapGestureRecognizer(target: self, action: #selector(self.handleLinkedinTap(sender:)))
        linkedingView.addGestureRecognizer(tapLinkedin)
    }
    
    func handleTap(socialNetwork : SocialNetwork) {
        switch socialNetwork {
        case .facebook:
            url = "https://www.facebook.com/rodrigo.guimaraes.564"
        case .youtube:
            url = "https://www.youtube.com/channel/UCNghEgS-PkKMDbZfiwhvYpA"
        case .linkedin:
            url = "http://bit.ly/rodrigolkdn"
        }
        
        performSegue(withIdentifier: "viewNetwork", sender: self)
    }
    
    @objc func handleYoutubeTap(sender: UITapGestureRecognizer? = nil) {
        self.handleTap(socialNetwork: .youtube)
    }
    
    @objc func handleFacebookTap(sender: UITapGestureRecognizer? = nil) {
        self.handleTap(socialNetwork: .facebook)
    }
    
    @objc func handleLinkedinTap(sender: UITapGestureRecognizer? = nil) {
        self.handleTap(socialNetwork: .linkedin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewNetwork") {
            let viewController = segue.destination as! PostViewController
            viewController.postLink = url
        }
    }

}
