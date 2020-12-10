//
//  APIError.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
