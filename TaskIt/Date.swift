//
//  Date.swift
//  TaskIt
//
//  Created by NanYar on 02.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import Foundation

class Date
{
    class func from(#year: Int, month: Int, day: Int) -> NSDate
    {
        var dateComponents = NSDateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        var calender = NSCalendar(identifier: NSGregorianCalendar)
        
        var date = calender?.dateFromComponents(dateComponents)
        
        return date!
    }
    
    
    class func toString(#date: NSDate) -> String
    {
        let dateToStringFormatter = NSDateFormatter()
        dateToStringFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateToStringFormatter.stringFromDate(date)
        
        return dateString
    }
}
