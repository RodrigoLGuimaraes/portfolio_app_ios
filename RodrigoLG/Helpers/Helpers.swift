//
//  Helpers.swift
//  BlogReader
//
//  Created by Rodrigo Guimaraes on 2017-11-10.
//  Copyright © 2017 Ravi Shankar. All rights reserved.
//

import Foundation
import UIKit

func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

func getFirstImageFromContent(_ content : String) -> String{
    let matched = matches(for: "http.+?\\.(png|jpg|gif)", in: content)
    return matched.first ?? ""
}
