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
    var body: some View {
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
              .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
              .frame(width: 310, height: 68, alignment: .top)
            Text("-")
              .font(
                Font.custom("Avenir", size: 37)
                  .weight(.black)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
        }
    }
}

#Preview {
    CategoriesItemsScreen()
}
