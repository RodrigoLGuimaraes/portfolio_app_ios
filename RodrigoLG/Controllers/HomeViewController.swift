//
//  ViewController.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileBackgroundView: UIView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundBottomView: UIView!
    @IBOutlet weak var backgroundTopView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Properties
    var parser: XMLParser = XMLParser()
    var blogPosts: [BlogPost] = []
    var postTitle: String = String()
    var postLink: String = String()
    var postImageURL: String = String()
    var descriptionStr: String = String()
    var pubDate: String = String()
    var eName: String = String()
    var selectedRow : Int = 0
    var currentBG : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableview Configuration
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.purple.withAlphaComponent(0)
        tableView.backgroundView = nil
        
        backgroundTopView.image = UIImage(named: BACKGROUND_NAMES[currentBG])
        backgroundBottomView.backgroundColor = IMAGE_BOTTOM_COLOR[BACKGROUND_NAMES[self.currentBG]]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        DispatchQueue.global().async {
            //Configure Data Load
            let url: URL = URL(string: "http://inovaapps.com.br/feed/rss/")!
            self.parser = XMLParser(contentsOf: url)!
            self.parser.delegate = self
            self.parser.parse()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Hide navigation controller background
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

    @IBAction func didAskForBgChange(_ sender: Any) {
        currentBG = (currentBG + 1) % BACKGROUND_NAMES.count
        self.backgroundTopView.image = UIImage(named: BACKGROUND_NAMES[self.currentBG])
        self.backgroundBottomView.backgroundColor = IMAGE_BOTTOM_COLOR[BACKGROUND_NAMES[self.currentBG]]
    }
    
    
    
    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewpost") {
            let blogPost: BlogPost = blogPosts[selectedRow]
            let viewController = segue.destination as! PostViewController
            viewController.postLink = blogPost.postLink
        }
    }
    
    // MARK: - TABLEVIEWDELEGATE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "viewpost", sender: self)
    }
    
    // MARK: - TABLEVIEWDATASOURCE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        //Remove Background
        cell.backgroundColor = UIColor.purple.withAlphaComponent(0)
        cell.backgroundView = nil
        cell.selectedBackgroundView = nil
        
        cell.updateCell(post: blogPosts[indexPath.row])
        
        return cell
    }
    
    // MARK: - NSXMLParserDelegate methods
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        eName = elementName
        if elementName == "item" {
            postTitle = String()
            postLink = String()
            postImageURL = String()
            descriptionStr = String()
            pubDate = String()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if (!data.isEmpty) {
            if eName == "title" {
                postTitle += data
            } else if eName == "link" {
                postLink += data
            } else if eName == "content:encoded" {
                postImageURL += data
            } else if eName == "description" {
                descriptionStr += data
            } else if eName == "pubDate" {
                pubDate += data
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let blogPost: BlogPost = BlogPost()
            blogPost.postTitle = postTitle
            blogPost.postLink = postLink
            blogPost.postImageURL = getFirstImageFromContent(postImageURL)
            blogPost.description = descriptionStr.html2String
            blogPost.pubDate = pubDate
            blogPosts.append(blogPost)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }

}

