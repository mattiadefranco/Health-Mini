//
//  Category.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    
    
    var id = UUID()
    var name: String
    var image: String
    var color : Color
    var subcategories : [Subcategory]
    
}
