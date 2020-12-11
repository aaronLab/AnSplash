//
//  HomeView.swift
//  AnSplash
//
//  Created by Aaron Lee on 2020-12-11.
//

import SwiftUI

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
                
                LazyVGrid(columns: self.gridColumns, alignment: .center, spacing: 20) {
                    ForEach(self.viewModel.photos, id: \.id) { photo in
                        Text(photo.id)
                    }
                }
            } //: ZSTACK
            .frame(width: geo.size.width, height: geo.size.height)
        } //: GEOMETRY
        .frame(minWidth: width * 0.6, minHeight: height * 0.6)
        .frame(maxWidth: width, maxHeight: height)
        .onAppear {
            self.viewModel.getPhotos(page: self.page)
        }
    }
}