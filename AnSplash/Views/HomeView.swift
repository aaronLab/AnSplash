//
//  HomeView.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-11.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    // DATA
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var page: Int = 1
    
    // VIEW
    private let width = NSScreen.main!.frame.width
    private let height = NSScreen.main!.frame.height
    private let gridColumns = Array.init(repeating: GridItem(.flexible()), count: 4)
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                
                Color.gray
                    .ignoresSafeArea()
                ScrollView {
                    
                    VStack(alignment: .center, spacing: 30) {
                        
                        Text("AnSplash")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        LazyVGrid(columns: self.gridColumns, alignment: .center, spacing: 20) {
                            ForEach(self.viewModel.photos, id: \.id) { photo in
                                
                                WebImage(url: URL(string: photo.urls?.small ?? ""))
                                    .resizable()
                                    .placeholder { ProgressView() }
                                    .scaledToFit()
                                    .cornerRadius(8.0)
                                    .padding(16)
                                    .frame(width: geo.size.width / 5, height: geo.size.height / 3)
                                    .background(
                                        Color.black.opacity(0.16)
                                            .cornerRadius(8.0)
                                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 5, y: 5)
                                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: -5, y: -5)
                                    )
                                    .onAppear {
                                        if photo.id == viewModel.photos.last?.id {
                                            self.page += 1
                                            self.viewModel.getPhotos(page: self.page)
                                        }
                                    }
                            }
                        } //: LG
                    } //: V
                    .padding()
                } //: SC
            } //: Z
            .frame(width: geo.size.width, height: geo.size.height)
        } //: G
        .frame(minWidth: width * 0.6, minHeight: height * 0.6)
        .frame(maxWidth: width, maxHeight: height)
        .onAppear {
             self.viewModel.getPhotos(page: self.page)
        }
    }
}
