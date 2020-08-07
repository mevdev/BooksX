//
//  BooksXUITests.swift
//  BooksXUITests
//
//  Created by Robert Linnemann on 8/1/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import XCTest
@testable import BooksX

class BooksXUITests: XCTestCase {

    func testExample() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
