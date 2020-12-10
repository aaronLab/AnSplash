//
//  Sponsorship.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

struct Sponsorship: Decodable {
    let impression_urls: [String]?
    let tagline: String?
    let tagline_url: String?
    let sponsor: User?
}
