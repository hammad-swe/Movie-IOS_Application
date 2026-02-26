//
//  DownloadView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 24/02/2026.
//

import SwiftUI
import SwiftData

struct DownloadView: View {
    @Query(sort: \Title.title) var savedTitles: [Title]
    
    var body: some View {
        NavigationStack{
            if savedTitles.isEmpty{
                Text("No Download")
                    .padding()
                    .font(.title3)
                    .bold()
            }else{
                VerticalListView(titles: savedTitles, conDelete: true)
            }
        }
    }
}

#Preview {
    DownloadView()
}
