//
//  PhotosService.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-11.
//

import Foundation
import Combine

// MARK: - ENDPOINT

final class PhotosEndpoint {
    
    static func getPhotos(page: Int) -> URLRequest {
        guard let url = URL(string: "https://api.unsplash.com/photos/?page=\(page)&client_id=\(ACCESS_KEY)")
        else { preconditionFailure("Invalid URL") }
        return URLRequest(url: url)
    }
    
}

// MARK: - SERVICE

protocol PhotosService {
    var apiSession: APIService { get }
}

extension PhotosService {
    
    func getPhotos(page: Int) -> AnyPublisher<[PhotoResponse], APIError> {
        return apiSession.request(with: PhotosEndpoint.getPhotos(page: page))
            .eraseToAnyPublisher()
    }
    
}
