//
//  SubcategoryListView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import SwiftUI

struct SubcategoryListView: View {
    var categoryName: String
    var subcategories: [Subcategory]
    @State private var isSearchBarHidden = false

    var body: some View {
        List {
            
            ForEach(subcategories.filter { $0.dati != "No" }) { subcategory in
                Section() {
                    CategoryCard(subcategory: subcategory)
                        .padding(0)
                }
            } .padding(.bottom, -1)

            // Sezione per le sottocategorie senza carta
            Section() {
                ForEach(subcategories.filter { $0.dati == "No" }) { subcategory in
                    Text(subcategory.name)
                        .padding(.vertical, 8)
                }
            }
        }
        .navigationBarTitle(categoryName, displayMode: .large)
    }
}

#if DEBUG
struct SubcategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        SubcategoryListView(categoryName: "Activity", subcategories: [
            Subcategory(name: "Example Subcategory 1", image: "imageName1", color: .blue, dati: "90", unit: "kcal"),
            Subcategory(name: "Example Subcategory 2", image: "imageName2", color: .green, dati: "No"),
            Subcategory(name: "Example Subcategory 5", image: "imageName1", color: .blue, dati: "90"),
            // Aggiungi altre sottocategorie di esempio secondo necessità
        ])
    }
}
#endif
