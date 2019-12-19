//
//  Extension+DateFormatter.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 19.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import Foundation
extension String {
   func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            dateFormatter.locale = tempLocale
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
        else {
            return ""
        }
       
    }
}
