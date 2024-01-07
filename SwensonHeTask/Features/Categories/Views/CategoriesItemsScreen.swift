//
//  CategoriesItemsScreen.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI

enum PageState {
    case categories
    case tasks
}
// Using generics here allows us to reuse the screen differently by passing different VMs that conform to same protocol which provides similar data
struct CategoriesItemsScreen<T>: View where T: CategoriesItemsModularViewModel {
    @ObservedObject var vm: T
    var state: PageState = .categories

    private func constructCategoriesGridCell(index: Int) -> some View {
        return NavigationLink(destination: CategoriesItemsScreen<TasksViewModel>(vm: TasksViewModel(cartManager: vm.cartManager), state: .tasks)){
            CategoryItemGridViewElement<CategoryGridItemViewModel>(vm: vm.dataSource[index] as! CategoryGridItemViewModel)
        }
    }
    private func constructTasksGridCell(index: Int) -> some View {
        return CategoryItemGridViewElement<TaskGridItemViewModel>(vm: vm.dataSource[index] as! TaskGridItemViewModel, state: .tasks)
    }
    var body: some View {
        ScrollView {
            VStack {
                Text(vm.title)
                    .font(
                        Font.custom("Avenir", size: 18)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text(vm.subtitle)
                    .font(
                        Font.custom("Avenir", size: 16)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 310, height: 68, alignment: .top)
                    .foregroundColor(ColorsConstants.subtitleColor)
                Text(vm.avgBudget)
                    .font(
                        Font.custom("Avenir", size: 37)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach((0..<vm.dataSource.count).map { $0 }, id: \.self) { item in
                        if state == .categories {
                            constructCategoriesGridCell(index: item)
                        } else {
                            constructTasksGridCell(index: item)
                        }
                    }
                }
                state == .categories ? Button(action: {}, label: {
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
                .padding() : nil
            }
        }
        .background(ColorsConstants.backgroundColor)
    }
}

#Preview {

    struct ContainerView: View {
        @State var state: PageState = .categories

        var body: some View {
            Button(action: {
                toggleState()
            }, label: {
                Text("Toggle view state")
            })
            if state == .categories {
                CategoriesItemsScreen<CategoriesScreenDummyViewModel>(vm: CategoriesScreenDummyViewModel(cartManager: CartManager()))
            } else {
                CategoriesItemsScreen<TasksDummyViewModel>(vm: TasksDummyViewModel(cartManager: CartManager()), state: .tasks)
            }
        }

        func toggleState() {
            if state == .categories {
                state = .tasks
            } else {
                state = .categories
            }
        }
    }
    return ContainerView()
}
