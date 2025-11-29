//
//  ContentView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                Text("Home")
            }
            Tab("Home", systemImage: ""){
                Text("Home")
            }
            Tab("Home", systemImage: "house"){
                Text("Home")
            }
            Tab("Home", systemImage: "house"){
                Text("Home")
            }
        }
    }
}

#Preview {
    ContentView()
}
