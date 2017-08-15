//
//  DateExtensions.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 10/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation


extension Date{

    public static func getDateFromString(_ fecha : String) -> Date{
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return  (dateFormatter.date(from: fecha))!
    
    }
    
    public  func getStringFromDate() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return  dateFormatter.string(from: self)
    }
}
    
    

