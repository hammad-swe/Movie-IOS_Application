//
//  TitleDetailView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 25/12/2025.
//

import SwiftUI
import SwiftData

struct TitleDetailView: View {
    let title : Title
    var titleName : String{
        return (title.name ?? title.title) ?? ""
    }
    let viewModel = ViewModel()
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        GeometryReader {geometry in
            switch viewModel.videoIdtatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            case .success:
                ScrollView{
                    LazyVStack(alignment: .leading){
                        YoutubePlayer(videoid: viewModel.videoId)
                            .aspectRatio(1.33, contentMode: .fit)
                        
                        Text(titleName)
                            .bold()
                            .font(.title2)
                            .padding(5)
                           
                        Text(title.overView ?? "")
                            .padding(5)
                        HStack{
                            Spacer()
                            Button {
                                let saveTitle = title
                                saveTitle.title = titleName
                                modelContext.insert(saveTitle)
                                try? modelContext.save()
                            } label: {
                                Text(constant.downloadstring)
                                    .ghostbutton()
                            }

                            Spacer()
                        }
                    }
                }
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
            }
            
        }
        .task {
            await viewModel.getVideoId(for: titleName)
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
