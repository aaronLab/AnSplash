//
//  CommonUtils.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

final class CommonUtils {
    
    static func unixDate2Date(string: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        guard let string = string else { return nil }
        let date = formatter.date(from: string)
        return date
    }
    
}
