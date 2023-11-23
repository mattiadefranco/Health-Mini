//
//  BrowseView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//
import SwiftUI
import Foundation

struct BrowseView: View {
    var viewModel = CategoryViewModel()
    @State private var searchText: String = ""
    @State private var scrollOffset: CGFloat = 0
     
    var body: some View {
        NavigationView {
            HStack{
                VStack (spacing: 0) {
//                    SearchBar(searchText: $searchText) 
//                                       .padding(.horizontal)
                   CategoryListView(viewModel: viewModel, scrollOffset: $scrollOffset)
                
                           
                    // Add your home page content here
                }
                .navigationTitle("Browse")
                
                
            }
        }
        .searchable(text: $searchText)
    }
}



#Preview {
    BrowseView()
}
