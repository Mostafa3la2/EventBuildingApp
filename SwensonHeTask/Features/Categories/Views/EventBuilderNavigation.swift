//
//  EventBuilderNavigation.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

struct EventBuilderNavigation: View {
    var preview = false
    @EnvironmentObject var cart: CartManager
    private func constructPreview() -> some View {
        return CategoriesItemsScreen<CategoriesScreenDummyViewModel>(vm: CategoriesScreenDummyViewModel(cartManager: cart))
            .navigationTitle("")
    }
    private func constructRealView() -> some View {
        return CategoriesItemsScreen<CategoriesScreenViewModel>(vm: CategoriesScreenViewModel(cartManager: cart))
            .navigationTitle("")
    }
    var body: some View {
        NavigationStack {
            if preview {
                constructPreview()
            } else {
                constructRealView()
            }
        }
        .tint(ColorsConstants.mainColor)

    }
}

#Preview {
    EventBuilderNavigation(preview: true)
}
