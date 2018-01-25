//
//  NewsTableViewCell.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-23.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(post: BlogPost) {
        self.titleLabel.text = post.postTitle
        self.postText.text = post.description
        
        if post.postImageURL.count > 0 {
            self.postImage.downloadedFrom(link: post.postImageURL)
        } else {
            self.postImage.image = #imageLiteral(resourceName: "noImage")
        }

        //ACTIVATE THIS IF YOU WANT TO USE DATE TYPE
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        let dateString = dateFormatter.string(from: post.)
        dateLabel.text = post.pubDate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
