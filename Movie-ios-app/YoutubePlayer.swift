//
//  YoutubePlayer.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/12/2025.
//

import SwiftUI
import WebKit

struct YoutubePlayer : UIViewRepresentable {
    let webview = WKWebView()
    let videoid: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
    func makeUIView(context: Context) -> some UIView{
        webview
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let baseURLString =  youtubeBaseURL,
              let baseURL = URL(string: baseURLString) else {return}
        let fullURL = baseURL.appending(path: videoid)
            webview.load(URLRequest(url: fullURL))
        
    }
}
