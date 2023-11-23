//
//  CustomCategory.swift
//  HealthMini
//
//  Created by Mattia De Franco on 23/11/23.
//

import Foundation

struct CustomCategory {
    var category: Category?
    var subcategory: Subcategory?

    init(category: Category) {
        self.category = category
    }

    init(subcategory: Subcategory) {
        self.subcategory = subcategory
    }
}
