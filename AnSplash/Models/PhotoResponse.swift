//
//  PhotoResponse.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

struct PhotoResponse: Decodable, Identifiable {
    let id: String
    let created_at: String?
    let updated_at: String?
    let promoted_at: String?
    let width: Int?
    let height: Int?
    let color: String?
    let description: String?
    let urls: URLs?
    let links: Links?
    let likes: Int?
    let liked_by_user: Bool?
    let sponsorship: Sponsorship?
    let user: User?
}

extension PhotoResponse {
    
    var convertedCreatedAt: Date? {
        CommonUtils.unixDate2Date(string: self.created_at)
    }
    
    var convertedUpdatedAt: Date? {
        CommonUtils.unixDate2Date(string: self.updated_at)
    }
    
    var convertedPromotedAt: Date? {
        CommonUtils.unixDate2Date(string: self.promoted_at)
    }
    
}
