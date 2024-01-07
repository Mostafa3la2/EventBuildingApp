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
    @State private var showSavePopup = false

    private func constructCategoriesGridCell(item: any ModularGridItemViewModel) -> some View {
        return NavigationLink(destination: CategoriesItemsScreen<TasksViewModel>(vm: TasksViewModel(cartManager: vm.cartManager, categoryID: item.id, categoryName: item.title), state: .tasks)){
            CategoryItemGridViewElement<CategoryGridItemViewModel>(vm: item as! CategoryGridItemViewModel)
        }
    }
    private func constructTasksGridCell(item: any ModularGridItemViewModel) -> some View {
        return CategoryItemGridViewElement<TaskGridItemViewModel>(vm: item as! TaskGridItemViewModel, state: .tasks)
    }

    private func constructCategoriesGrid() -> some View {
        let dataSource = vm.dataSource as! [CategoryGridItemViewModel]
        let splittedDataSource = dataSource.chunked(into: 2)
        return VStack(alignment: .leading) {
            ForEach(splittedDataSource, id: \.self) { column in
                HStack {
                    ForEach(column, id: \.id) { item in
                            constructCategoriesGridCell(item: item)

                    }
                }
            }
        }
    }
    private func constructTasksGrid() -> some View{
        let dataSource = vm.dataSource as! [TaskGridItemViewModel]
        let splittedDataSource = dataSource.chunked(into: 2)
        return VStack(alignment: .leading) {
            ForEach(splittedDataSource, id: \.self) { column in
                HStack {
                    ForEach(column, id: \.id) { item in
                        constructTasksGridCell(item: item)
                    }
                }
            }
        }
    }
    private func savePopupview() -> some View {
        let range = "\(vm.minBudget) - \(vm.maxBudget)"
        return VStack(alignment: .center) {
            Spacer()
            Text("Event Saved!")
              .font(
                Font.custom("Avenir", size: 18)
                  .weight(.black)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
            Text("$ " + range)
              .font(
                Font.custom("Avenir", size: 37)
                  .weight(.black)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
            Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .background(ColorsConstants.backgroundColor)
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
                Text("\(vm.avgBudget == 0 ? "-":"$ \(vm.avgBudget)")")
                    .font(
                        Font.custom("Avenir", size: 37)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                if state == .categories {
                    constructCategoriesGrid()
                } else {
                    constructTasksGrid()
                }
                state == .categories ? Button(action: {
                    self.showSavePopup = true
                }, label: {
                    Text("Save")
                        .font(
                            Font.custom("Avenir", size: 16)
                                .weight(.black)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 343, height: 52)

                })
                .background(ColorsConstants.mainColor)
                .clipShape(.rect(cornerRadius: 5))
                .padding()
                .popover(isPresented: $showSavePopup) {
                    savePopupview()
                        .font(.headline)
                        .padding()
                }
                : nil
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
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

