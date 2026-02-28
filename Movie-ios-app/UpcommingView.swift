//
//  UpcommingView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 13/02/2026.
//

import SwiftUI

struct UpcommingView: View {
    
    let viewModel = ViewModel()
    
    var body: some View {
        GeometryReader{ geo in
            switch viewModel.upcomingStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView()
                    .frame(width: geo.size.width, height: geo.size.height)
            case .success:
                VerticalListView(titles: viewModel.upcomingMovies, conDelete: false)
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
                    .errorMessage()
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .task {
            await viewModel.getUpcomingMovies()
        }
        
    }
}

#Preview {
    UpcommingView()
}

