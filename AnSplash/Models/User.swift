//
//  Sponsor.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-10.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: String
    let updated_at: String?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let twitter_username: String?
    let portfolio_url: String?
    let bio: String?
    let location: String?
    let links: Links?
    let profile_image: URLs?
    let instagram_username: String?
    let total_collections: Int?
    let total_likes: Int?
    let total_photos: Int?
    let accepted_tos: Bool?
}
