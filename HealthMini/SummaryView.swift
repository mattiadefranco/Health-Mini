//
//  SummaryView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        NavigationView {
            HStack{
                VStack {
                    Text("Favourites categories")
                        .font(.title)
                        .padding()
                    
                    // Add your home page content here
                }
                .navigationTitle("Summary")
                
            }
        }
    }
}
#Preview {
    SummaryView()
}
