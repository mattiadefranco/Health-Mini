//
//  Ring_View.swift
//  HealthMini
//
//  Created by Mattia De Franco on 23/11/23.
//

import SwiftUI

struct Ring_View: View {
    @State var percentage1 : Double = 0
    @State var percentage2 : Double = 0
    @State var percentage3 : Double = 0
    
    var body: some View {
        VStack {
            ZStack{
                Ring(
                    lineWidth: 30, backGroundColor: Color.blue.opacity(0.2), foreGroundColor: Color.blue, percentage: percentage1
                )
                .frame(width: 140, height: 140)
                .onTapGesture {
                    self.percentage1 = 70
                }
                
                Ring(
                    lineWidth: 40, backGroundColor: Color.yellow.opacity(0.2), foreGroundColor: Color.yellow, percentage: percentage2
                )
                .frame(width: 220, height: 220)
                .onTapGesture {
                    self.percentage2 = 50
                }
                
                Ring(
                    lineWidth: 40, backGroundColor: Color.red.opacity(0.2), foreGroundColor: Color.red, percentage: percentage3
                )
                .frame(width: 300, height: 300)
                .onTapGesture {
                    self.percentage3 = 80
                }
            }

            // Add your activity page content here
        }
    }
}

#Preview {
    Ring_View()
}
