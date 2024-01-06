//
//  CategoriesItemsScreen.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

enum PageState {
    case mainCategories
    case categoryItems
}
struct CategoriesItemsScreen: View {

    // var vm: CategoriesItemsModularViewModel
    let data = (1...10).map { $0 } // Sample data
    var state: PageState = .mainCategories
    var body: some View {
        ScrollView {
            VStack {
                Text("Test")
                    .font(
                        Font.custom("Avenir", size: 18)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text("Add to your event to view our cost estimate.")
                    .font(
                        Font.custom("Avenir", size: 16)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 310, height: 68, alignment: .top)
                    .foregroundColor(ColorsConstants.subtitleColor)
                Text("-")
                    .font(
                        Font.custom("Avenir", size: 37)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(data, id: \.self) { item in
                        // Your grid cell content here
                        if state == .mainCategories {
                            NavigationLink(destination: CategoriesItemsScreen(state: .categoryItems)){
                                CategoryItemGridViewElement()
                            }
                        } else {
                            CategoryItemGridViewElement(state: .categoryItems)
                        }
                    }
                }
                Button(action: {}, label: {
                    Text("Save")
                      .font(
                        Font.custom("Avenir", size: 16)
                          .weight(.black)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                })
                .frame(width: 343, height: 52)
                .background(ColorsConstants.mainColor)
                .clipShape(.rect(cornerRadius: 5))
                .padding()
            }
        }
        .background(ColorsConstants.backgroundColor)
    }
}

#Preview {
    CategoriesItemsScreen()
}
