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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableview Configuration
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.purple.withAlphaComponent(0)
        tableView.backgroundView = nil
        
        //Hide navigation controller background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        //Configure Data Load
        let url: URL = URL(string: "http://inovaapps.com.br/feed/rss/")!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
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
        return blogPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        //Remove Background
        cell.backgroundColor = UIColor.purple.withAlphaComponent(0)
        cell.backgroundView = nil
        cell.selectedBackgroundView = nil
        
        let blogPost: BlogPost = blogPosts[indexPath.row]
        cell.updateCell(title: blogPost.postTitle, date: Date(), imageURL: blogPost.postImageURL, postText: "")
        
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
        print(elementName)
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
            blogPost.description = descriptionStr
            blogPost.pubDate = pubDate
            blogPosts.append(blogPost)
        }
    }

}

