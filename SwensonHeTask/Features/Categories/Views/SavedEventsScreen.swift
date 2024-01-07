//
//  SavedEventsScreen.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import SwiftUI
import SwiftData
struct SavedEventsScreen: View {
    @Query var events: [Event]

    var body: some View {
        List {
            ForEach(events) { event in
                HStack(alignment: .center) {
                    Text("Created at: \(event.time ?? "")")
                        .font(
                          Font.custom("Avenir", size: 14)
                            .weight(.black)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Text("Budget est. $ " + "\(event.minBudget ?? 0) - \(event.maxBudget ?? 0)")
                      .font(
                        Font.custom("Avenir", size: 14)
                          .weight(.black)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)

                }
            }
        }
    }
}

#Preview {
    SavedEventsScreen()
}
