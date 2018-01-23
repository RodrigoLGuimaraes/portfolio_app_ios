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
    
    func updateCell(title : String, date : Date, imageURL : String, postText : String) {
        self.titleLabel.text = title
        self.postText.text = postText
        
        if imageURL.count > 0 {
            self.postImage.downloadedFrom(link: imageURL)
        } else {
            self.postImage.image = #imageLiteral(resourceName: "rodrigo") //TODO
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
