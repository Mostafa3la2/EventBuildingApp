//
//  CategoryItemGridViewElement.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI
import Kingfisher
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
    @ObservedObject var vm: T
    @State var added: Bool = false
    var state: PageState = .categories
    private let cellWidth: CGFloat = 164
    private let cellHeight: CGFloat = 149

    private func createBudgetLabel(vm: HasBudget?) -> some View {
        return Text("$ " + ("\(vm?.minBudget ?? 0) - \(vm?.maxBudget ?? 0)" ))
            .font(Font.custom("Avenir-Black", size: 14))
    }
    @ViewBuilder private func createCountBadge() -> some View {
        var count = (vm as? HasCountBadge)?.getBadgeCount()
        switch count {
        case .none:
            EmptyView()
        case 0:
            EmptyView()
        case .some(let badgeCount):
            Text("\(badgeCount)")
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                .background(ColorsConstants.mainColor.opacity(0.5))
                .clipShape(.circle)
                .padding(.top, 12)
                .padding(.trailing, 12)
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: vm.imageURL ?? ""))
                .placeholder{
                    ProgressView()
                }
                .resizable()
                .scaledToFill()
                .modifier(ImageFrameModifier())
                .clipped()
            HStack {
                VStack(alignment: .leading) {
                    Text(vm.title ?? "")
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
            if state == .tasks {
                Button(action: {
                    added.toggle()
                    if added {
                        (vm as? CartHandler)?.addToCart()
                    } else {
                        (vm as? CartHandler)?.removeFromCart()
                    }

                }, label: {
                    !added ? Image(systemName: "plus")
                        .foregroundColor(.white) : Image(systemName: "minus")
                        .foregroundColor(.white)
                })
                .frame(width: 24, height: 24)
                .background(.black.opacity(0.5))
                .clipShape(.circle)
                .padding(.top, 12)
                .padding(.trailing, 12)
            } else {
                createCountBadge()
            }
            // TODO: add indicator as design in category state
        })
    }
}

#Preview {
    var cartManager = CartManager()
    var category = CategoriesModelElement(id: 1, title: "test", image: "https://picsum.photos/200/300")
    var task = TasksModelElement(id: 1, title: "test", minBudget: 100, maxBudget: 300, avgBudget: 200, image: "https://picsum.photos/200/300")
    return VStack {
        CategoryItemGridViewElement<CategoryGridItemViewModel>(vm: CategoryGridItemViewModel(cartManager: cartManager, category: category), state: .categories)
        CategoryItemGridViewElement<TaskGridItemViewModel>(vm: TaskGridItemViewModel(cartManager: cartManager, task: task, categoryID: 2), state: .tasks)
    }
}
