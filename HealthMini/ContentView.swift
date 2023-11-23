//
//  COntentView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Summary")
                }

            SharingView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Sharing")
                }

            BrowseView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Browse")
                }
        }
    }
}
#Preview {
    ContentView()
}
