//
//  URLModel.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

struct URLs: Decodable {
    let raw: String?
    let full: String?
    let large: String?
    let regular: String?
    let medium: String?
    let small: String?
    let thumb: String?
}
