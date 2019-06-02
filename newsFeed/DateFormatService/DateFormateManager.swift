//
//  DateFormateManager.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 02/06/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class DateFormateManager {
    //MARK: Methods
    class func dateConvert(dateString: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SS'Z'"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "YYYY-MM-dd'T'hh:mm"
            let timeStamp = dateFormatter.string(from: date)
            return timeStamp
        } else {
            return dateString
        }
    }
}
