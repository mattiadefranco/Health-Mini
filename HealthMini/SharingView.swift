//
//  SharingView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import SwiftUI

struct SharingView: View {
    @State var percentage1 : Double = 0
    @State var percentage2 : Double = 0
    @State var percentage3 : Double = 0
    
    var body: some View {
        NavigationView {
            VStack {
            
                Text("Health Sharing")
                    .font(.title)
                    .padding()

                // Add your activity page content here
            }
            .navigationTitle("Sharing")
        }
    }
}

#Preview {
    SharingView()
}
