//
//  HomePopoverView.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-14.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeDownloadSheet: View {
    // MARK: - PROPERTIES
    
    @Binding var isPresented: Bool
    let photoResponse: PhotoResponse?
    
    // MARK: - INIT
    
    init(isPresented: Binding<Bool>, photoResponse: PhotoResponse? = nil) {
        self._isPresented = isPresented
        self.photoResponse = photoResponse
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Spacer()
                
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Text("Done")
                }
            }
            
            Text("Download")
                .font(.title2)
            
            if let urls = photoResponse?.urls {
                
                if urls.raw != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.raw, id: photoResponse?.id, quality: .raw)
                    }) {
                        Text("Raw")
                    }
                }
                
                if urls.full != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.full, id: photoResponse?.id, quality: .full)
                    }) {
                        Text("Full")
                    }
                }
                
                if urls.large != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.large, id: photoResponse?.id, quality: .large)
                    }) {
                        Text("Large")
                    }
                }
                
                if urls.regular != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.regular, id: photoResponse?.id, quality: .regular)
                    }) {
                        Text("Regular")
                    }
                }
                
                if urls.medium != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.medium, id: photoResponse?.id, quality: .medium)
                    }) {
                        Text("Medium")
                    }
                }
                
                if urls.small != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.small, id: photoResponse?.id, quality: .small)
                    }) {
                        Text("Small")
                    }
                }
                
                if urls.thumb != nil {
                    Button(action: {
                        self.saveImage(urlString: urls.thumb, id: photoResponse?.id, quality: .thumb)
                    }) {
                        Text("Thum")
                    }
                }
                
            }
            
        } //: V
        .padding(50)
    }
    
}

// MARK: - IMAGE QUALITY

extension HomeDownloadSheet {
    
    enum ImageQuality: String {
        case raw, full, large, regular, medium, small, thumb
    }
    
}

// MARK: - METHODS

extension HomeDownloadSheet {
    
    private func saveImage(urlString: String?, id: String?, quality: ImageQuality) {
        guard let urlString = urlString,
              let id = id,
              let imageURL = URL(string: urlString)
        else { fatalError("HomeView -> saveImage: Invalid URL & ID") }
        
        let manager = SDWebImageDownloader(config: .default)
        manager.downloadImage(with: imageURL) { image, _, _, _ in
            
            guard let imageOriginal = image else { preconditionFailure("Failed to load image") }
            
            let data = imageOriginal.sd_imageData(as: .JPEG)
            
            let pannel = NSSavePanel()
            pannel.canCreateDirectories = true
            pannel.nameFieldStringValue = "\(id)_\(quality.rawValue).jpg"
            
            pannel.begin { response in
                
                if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    
                    do {
                        
                        try data?.write(to: pannel.url!, options: .atomicWrite)
                        
                        DispatchQueue.main.async  {
                            self.isPresented.toggle()
                        }
                    } catch {
                        fatalError("Cannot save Image")
                    }
                }
                
            }
            
        }
        
    }
    
}
