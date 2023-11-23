//
//  SubcategoryListView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import SwiftUI

struct CategoryListView: View {
    var viewModel = CategoryViewModel()
    @Binding var scrollOffset: CGFloat

    var body: some View {
        NavigationView {
            List {
                let categoriesExcludingLast = viewModel.category.dropLast() // Escludi l'ultima categoria

                ForEach(categoriesExcludingLast) { category in
                    NavigationLink(destination: SubcategoryListView(categoryName: category.name, subcategories: category.subcategories)) {
                        HStack {
                            if UIImage(systemName: category.image) != nil {
                                Image(systemName: category.image)
                                    .imageScale(.large)
                                    .foregroundColor(category.color)
                            } else {
                                Image(category.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                            }

                            Text(category.name)
                                .fontWeight(.bold)
                        }
                        .frame(height: 37)
                    }
                }

                // Separator section for "Clinical Documents"
                Section {
                    ForEach(viewModel.category.filter { $0.name == "Clinical Documents" }) { category in
                        NavigationLink(destination: SubcategoryListView(categoryName: category.name, subcategories: category.subcategories)) {
                            HStack {
                                Image(systemName: category.image)
                                    .imageScale(.large)
                                    .foregroundColor(category.color)
                                Text(category.name)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Health Categories")
            .navigationBarHidden(scrollOffset > 0) // Nascondi il titolo quando scrollOffset è maggiore di 0
                        .onAppear {
                            UITableView.appearance().separatorStyle = .singleLine
                        }
                        .onDisappear {
                            UITableView.appearance().separatorStyle = .none
                        }
                        .gesture(DragGesture().onChanged { value in
                            scrollOffset = value.translation.height
                        })
                  }
              }
    
}

#if DEBUG
struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(scrollOffset: .constant(0))
    }
}
#endif

#Preview {
    CategoryListView(scrollOffset: .constant(0))
}
