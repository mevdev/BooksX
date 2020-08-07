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

    func testWithData() throws {
        let vm = BooksViewModel(books: [
            Book(title: "AudioBook", coverImage: nil, file: nil, bookType: .audiobook, progress: 0),
            Book(title: "eBook", coverImage: nil, file: nil, bookType: .ebook, progress: 0),
            Book(title: "PDF", coverImage: nil, file: nil, bookType: .pdf, progress: 0)
        ])
        XCTAssertEqual(vm.booksCount, 3)
        XCTAssertNotNil(vm.bookAt(index: 0))
        XCTAssertNil(vm.bookAt(index: 4))
        let booksHeaderView = vm.booksHeaderView()
        XCTAssertEqual(booksHeaderView.booksCount, 1)
        XCTAssertEqual(booksHeaderView.audioBooksCount, 1)
        XCTAssertEqual(booksHeaderView.pdfsCount, 1)

    }
}
