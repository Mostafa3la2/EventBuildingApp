//
//  SwensonHeTaskUITests.swift
//  SwensonHeTaskUITests
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import XCTest

final class SwensonHeTaskUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGridItemsRendering() throws {
        // UI tests must launch the application that they test.
        var mockHomeVM = CategoriesScreenDummyViewModel(cartManager: CartManager())
        let app = XCUIApplication()
        app.launchEnvironment["UITest"] = "true"
        app.launch()
        for index in 0..<4 {
            let element = app.staticTexts[mockHomeVM.dataSource[index].title!]
            XCTAssertTrue(element.exists)
            // Perform actions or assertions on each element as needed
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
