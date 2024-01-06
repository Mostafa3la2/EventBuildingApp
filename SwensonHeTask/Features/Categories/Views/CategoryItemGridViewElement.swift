//
//  CategoryItemGridViewElement.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

struct CategoryItemGridViewElement: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 104)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 104)
                            .clipped()
                    case .failure:
                        Image("articlePlaceholder")
                    @unknown default:
                        EmptyView()
                    }
                }
                VStack {
                    Text("Staff")
                        .font(
                            Font.custom("Avenir", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(ColorsConstants.textColor)
                    Text("$350")
                        .font(Font.custom("Avenir-Black", size: 14))
                }
                .padding(.horizontal, 5)
                Spacer()
            }
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            })
            .frame(width: 24, height: 24)
            .background(.black.opacity(0.5))
            .clipShape(.circle)
            .padding(.top, 12)
            .padding(.trailing, 12)

        }
        .frame(width: 164, height: 149)
        .clipShape(.rect(
            topLeadingRadius: 5,
            bottomLeadingRadius: 5,
            bottomTrailingRadius: 5,
            topTrailingRadius: 5
        ))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(ColorsConstants.borderColor, lineWidth: 1)
        )
    }
}

#Preview {
    CategoryItemGridViewElement()
}
