//
//  ContentView.swift
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
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Summary")
                    Text("Summary")
                }

            SharingView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Sharing")
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
