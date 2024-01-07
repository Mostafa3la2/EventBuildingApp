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
struct CategoryItemGridViewElement<T>: View where T: ModularGridItemViewModel {
    var vm: T
    var state: PageState = .categories
    private let cellWidth: CGFloat = 164
    private let cellHeight: CGFloat = 149

    func createBudgetLabel(vm: HasBudget?) -> some View {
        return Text(vm?.avgBudget ?? "XX")
            .font(Font.custom("Avenir-Black", size: 14))
    }
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: vm.imageURL)) { phase in
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
                    Text(vm.title)
                        .font(
                            Font.custom("Avenir", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(ColorsConstants.gridItemTitleColor)
                    // using optional here just in case even though tasks state mean that the vm HasBudget
                    state == .tasks ? createBudgetLabel(vm: vm as? HasBudget) : nil
                }
                .padding(.horizontal, 5)
                Spacer()
                state == .categories ?
                    Image(systemName: "chevron.forward")
                        .foregroundColor(ColorsConstants.mainColor)
                .padding(.horizontal, 5) : nil
            }
            Spacer()
        }
        .frame(width: cellWidth, height: cellHeight)
        .clipShape(.rect(cornerRadius: 5))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(ColorsConstants.borderColor, lineWidth: 1)
        )

        .overlay(alignment: .topTrailing, content: {
            state == .tasks ?
            Button(action: {
                // should handle the addition or subtraction here
            }, label: {
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
        CategoryItemGridViewElement<CategoryGridItemViewModel>(vm: CategoryGridItemViewModel(), state: .categories)
        CategoryItemGridViewElement<TaskGridItemViewModel>(vm: TaskGridItemViewModel(), state: .tasks)
    }
}
