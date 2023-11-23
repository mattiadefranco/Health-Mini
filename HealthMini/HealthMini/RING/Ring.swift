//
//  Ring.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//


import Foundation
import SwiftUI

struct Ring : View {
    let lineWidth: CGFloat
    let backGroundColor: Color
    let foreGroundColor: Color
    let percentage : Double
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                //track
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backGroundColor)
                // animated ring
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foreGroundColor)
            }
            
        }
        .animation(Animation.easeOut(duration: 1))
        .padding(lineWidth / 2 )
    }
}

