//
//  Date+Extensions.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

extension Date {
    
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    public var month: Int {
         return Calendar.current.component(.month, from: self)
    }
    
    public var day: Int {
         return Calendar.current.component(.day, from: self)
    }
    
    public var monthName: String {
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMMM"
        return nameFormatter.string(from: self)
    }
    
}
