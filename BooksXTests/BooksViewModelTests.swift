//
//  BooksViewModelTests.swift
//  BooksXTests
//
//  Created by Robert Linnemann on 8/6/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import XCTest
@testable import BooksX

class BooksViewModelTests: XCTestCase {

    func testInitialState() throws {
        let vm = BooksViewModel()
        XCTAssertEqual(vm.booksCount, 0)
        XCTAssertNil(vm.bookAt(index: 0))
        let booksHeaderView = vm.booksHeaderView()
        XCTAssertEqual(booksHeaderView.booksCount, 0)
        XCTAssertEqual(booksHeaderView.audioBooksCount, 0)
        XCTAssertEqual(booksHeaderView.pdfsCount, 0)
    }

}
