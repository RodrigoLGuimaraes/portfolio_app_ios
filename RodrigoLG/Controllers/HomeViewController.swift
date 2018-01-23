//
//  ViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileBackgroundView: UIView!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.purple.withAlphaComponent(0)
        tableView.backgroundView = nil
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLayoutSubviews() {
        profileImgView.layer.cornerRadius = profileImgView.bounds.width/2
        profileBackgroundView.layer.cornerRadius = profileBackgroundView.bounds.width/2
        profileBtn.layer.cornerRadius = profileBtn.bounds.width/2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TABLEVIEWDELEGATE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO
    }
    
    // MARK: - TABLEVIEWDATASOURCE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.purple.withAlphaComponent(0)
        cell.backgroundView = nil
        cell.selectedBackgroundView = nil
        //TODO: Update cell
        
        return cell
    }

}

