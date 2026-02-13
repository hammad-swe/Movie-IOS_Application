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
                VerticalListView(titles: viewModel.upcomingMovies)
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
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
