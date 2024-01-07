//
//  SwensonHeTaskTests.swift
//  SwensonHeTaskTests
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import XCTest
@testable import SwensonHeTask

final class SwensonHeTaskTests: XCTestCase {

    var cartVM: CartManager = CartManager()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cartVM.cartItems.removeAll()
    }

    func testCartAdd() throws {
        let cartItem = CartItem(id: 15, categoryID: 12)
        cartVM.addItemToCart(cartItem: cartItem)
        XCTAssertTrue(cartVM.cartItems.contains(cartItem))
    }
    func testCartTryAddWithoutCategory() throws {
        let cartItem = CartItem(id: 15)
        cartVM.addItemToCart(cartItem: cartItem)
        XCTAssertFalse(cartVM.cartItems.contains(cartItem))
    }
    func testCartRemoveItem() throws {
        let cartItem = CartItem(id: 15, categoryID: 12)
        cartVM.addItemToCart(cartItem: cartItem)
        cartVM.removeItemFrom(cartItem: cartItem)
        XCTAssertFalse(cartVM.cartItems.contains(cartItem))
    }
    func testCartCalculations() throws {
        let cartItem1 = CartItem(avgBudget: 10, id: 15, categoryID: 12)
        let cartItem2 = CartItem(avgBudget: 10, id: 12, categoryID: 12)
        cartVM.addItemToCart(cartItem: cartItem1)
        cartVM.addItemToCart(cartItem: cartItem2)
        XCTAssertTrue(cartVM.avgBudget == 20)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
