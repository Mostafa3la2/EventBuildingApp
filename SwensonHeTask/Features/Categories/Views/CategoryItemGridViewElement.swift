//
//  CategoryItemGridViewElement.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

private struct ImageFrameModifier: ViewModifier {
    private let imageHeight: CGFloat = 104

    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: imageHeight,
                alignment: .center
            )
    }
}
struct CategoryItemGridViewElement: View {
    var state: PageState = .mainCategories
    private static let cellWidth: CGFloat = 164
    private static let cellHeight: CGFloat = 149
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .modifier(ImageFrameModifier())
                        .clipped()
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .modifier(ImageFrameModifier())
                        .clipped()
                case .failure:
                    Spacer()
                        .modifier(ImageFrameModifier())
                        .clipped()
                @unknown default:
                    Spacer()
                        .modifier(ImageFrameModifier())
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Staff")
                        .font(
                            Font.custom("Avenir", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(ColorsConstants.gridItemTitleColor)
                    state == .categoryItems ? Text("$350")
                        .font(Font.custom("Avenir-Black", size: 14)) : nil
                }
                .padding(.horizontal, 5)
                Spacer()
                state == .mainCategories ? Button(action: {}, label: {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(ColorsConstants.mainColor)
                })
                .padding(.horizontal, 5) : nil
            }
            Spacer()
        }
        .frame(width: CategoryItemGridViewElement.cellWidth, height: CategoryItemGridViewElement.cellHeight)
        .clipShape(.rect(cornerRadius: 5))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(ColorsConstants.borderColor, lineWidth: 1)
        )

        .overlay(alignment: .topTrailing, content: {
            state == .categoryItems ?
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            })
            .frame(width: 24, height: 24)
            .background(.black.opacity(0.5))
            .clipShape(.circle)
            .padding(.top, 12)
            .padding(.trailing, 12) :
            nil
        })
    }
}

#Preview {
    VStack {
        CategoryItemGridViewElement(state: .mainCategories)
        CategoryItemGridViewElement(state: .categoryItems)
    }
}
