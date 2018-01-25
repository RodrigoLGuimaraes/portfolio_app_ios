//
//  String+HTMLParsing.swift
//  RodrigoLG
//
//  Created by Rodrigo Guimaraes on 2018-01-24.
//  Copyright © 2018 RodrigoLG. All rights reserved.
//

//SOURCE: https://stackoverflow.com/questions/28124119/convert-html-to-plain-text-in-swift

import Foundation

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
