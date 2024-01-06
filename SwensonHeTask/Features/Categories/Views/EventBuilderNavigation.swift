//
//  EventBuilderNavigation.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

struct EventBuilderNavigation: View {
    var body: some View {
        NavigationStack {
            CategoriesItemsScreen()
                .navigationTitle("")
        }
        .tint(ColorsConstants.mainColor)

    }
}

#Preview {
    EventBuilderNavigation()
}
