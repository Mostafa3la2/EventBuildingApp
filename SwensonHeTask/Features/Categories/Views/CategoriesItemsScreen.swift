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
struct CategoriesItemsScreen<T>: View where T: CategoriesItemsModularViewModel {

    @ObservedObject var vm: T
    let data = (1...4).map { $0 } // Sample data
    var state: PageState = .mainCategories
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
                    ForEach(data, id: \.self) { item in
                        // Your grid cell content here
                        if state == .mainCategories {
                            NavigationLink(destination: CategoriesItemsScreen<CategoryItemsViewModel>(vm: CategoryItemsViewModel(), state: .categoryItems)){
                                CategoryItemGridViewElement()
                            }
                        } else {
                            CategoryItemGridViewElement(state: .categoryItems)
                        }
                    }
                }
                state == .mainCategories ? Button(action: {}, label: {
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
        @State var state: PageState = .mainCategories

        var body: some View {
            Button(action: {
                toggleState()
            }, label: {
                Text("Toggle view state")
            })
            if state == .mainCategories {
                CategoriesItemsScreen<CategoriesScreenDummyViewModel>(vm: CategoriesScreenDummyViewModel())
            } else {
                CategoriesItemsScreen<CategoryItemsDummyViewModel>(vm: CategoryItemsDummyViewModel(), state: .categoryItems)
            }
        }

        func toggleState() {
            if state == .mainCategories {
                state = .categoryItems
            } else {
                state = .mainCategories
            }
        }
    }
    return ContainerView()
}
