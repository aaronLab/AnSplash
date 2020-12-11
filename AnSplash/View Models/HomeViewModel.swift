//
//  HomeViewModel.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-11.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject, PhotosService {
    
    // MARK: - PROPERTIES
    
    // SERVICE
    var apiSession: APIService
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // PHOTOS
    @Published var photos = [PhotoResponse]()
    
    // MARK: - INIT
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
}

// MARK: - PHOTOS

extension HomeViewModel {
    
    func getPhotos(page: Int) {
        self.getPhotos(page: page)
            .sink { result in
                self.handleResult(with: result)
            } receiveValue: { response in
                self.photos = response
            }
            .store(in: &self.cancellables)
    }
    
}

// MARK: - HANDLERS

extension HomeViewModel {
    
    private func handleResult(with result: Subscribers.Completion<APIError>) {
        switch result {
        case .failure(let error):
            print("Handle error: \(error)")
        case .finished:
            break
        }
    }
    
}
