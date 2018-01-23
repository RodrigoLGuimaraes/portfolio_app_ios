//
//  ViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileBackgroundView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.backgroundColor = UIColor.purple.withAlphaComponent(0)
        tableView.backgroundView = nil
    }

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
    
    override func viewDidLayoutSubviews() {
        profileImgView.layer.cornerRadius = profileImgView.bounds.width / 2
        profileBackgroundView.layer.cornerRadius = profileBackgroundView.bounds.width/2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

