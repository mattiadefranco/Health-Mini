//
//  CardListView.swift
//  HealthMini
//
//  Created by Mattia De Franco on 23/11/23.
//
import SwiftUI
import Foundation


struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Funzione per ottenere l'orario corrente
    private func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }



struct CategoryCard: View {
    
    let subcategory : Subcategory
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 7) {
                HStack(alignment: .bottom, spacing: 0) {
                    GeometryReader { geometry in
                        HStack(spacing: 2) {
                            ZStack() {
                                Image(systemName: subcategory.image)
                                    .font(Font.custom("SF UI Display", size: 20).weight(.semibold))
                                    .foregroundColor(subcategory.color)
                            }
                            .frame(width: 18, height: 18)
                            Text(subcategory.name)
                                .font(Font.custom("SF UI Display", size: 20).weight(.semibold))
                                .foregroundColor(subcategory.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .background(
                                    Color.clear
                                        .preference(
                                            key: WidthPreferenceKey.self,
                                            value: geometry.size.width
                                        )
                                )
                        }
                        .frame(height:18)
                        
                    }
//                    .frame(width: UIScreen.main.bounds.size.width, height: 18)
//                        .alignmentGuide(.leading) { _ in 0 }
                    
                    HStack(spacing: 1) {
                        Text(getCurrentTime())
                      
                            .font(Font.custom("SF UI Display", size: 14))
                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                        ZStack() {
                            Image(systemName: "chevron.right")
                                .font(Font.custom("SF UI Display", size: 20).weight(.semibold))
                                .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                        }
                        .frame(width: 18, height: 18)
                    }
                    .frame(height: 18)
                }
                .frame(maxWidth: .infinity)
                
                HStack(alignment: .bottom, spacing: 220) {
                    HStack(alignment: .bottom, spacing: 4) {
                        Text(subcategory.dati)
                            .font(Font.custom("SF Pro Rounded", size: 28).weight(.bold))
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 0) {
                            Text(subcategory.unit)
                                .font(Font.custom("SF Pro Rounded", size: 14).weight(.bold))
                                .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    }
                    ZStack {
                            // fare in modo di inserire anello, grafico o niente nel caso in cui ci sia no data
                            Ring(
                                lineWidth: 30, backGroundColor: Color.black, foreGroundColor: Color.black, percentage: 100
                            )
                            .frame(width: 60, height: 60)
                            Ring(
                                lineWidth: 13, backGroundColor: subcategory.color.opacity(0.5), foreGroundColor: subcategory.color, percentage: 20
                                
                                
                                // % di dato su 100
                                
                                
                            )
                            .frame(width: 60, height: 60)
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(14)
        .frame(width: 376, height: 100)
        .background(Color(red: 28 / 255.0, green: 28 / 255.0, blue: 30 / 255.0))
        .cornerRadius(10)
        
            }
        }

#Preview {
    let subcategory = Subcategory(name: "Active Energy",image: "flame.fill",color: .red, dati: "90", unit:"kcal")
    return CategoryCard(subcategory: subcategory)
}
