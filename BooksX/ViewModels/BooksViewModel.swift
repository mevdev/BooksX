//
//  BooksViewModel.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BooksViewModel {
    
    private var books: [Book]
    var booksCount: Int {
        return books.count
    }
    
    init(books: [Book] = [Book]()) {
        self.books = books
    }

    func bookAt(index: Int) -> Book? {
        var selectedBook: Book? = nil
        if self.books.indices.contains(index) {
            selectedBook = self.books[index]
        }
        return selectedBook
    }
    
    func fetchBooks(completion: @escaping () -> Void) {
        let task = URLSession.shared.fetchCollectionTask(with: Constants.fetchURL) { booksXCollection, response, error in
            if let booksXCollection = booksXCollection {
                self.books = booksXCollection
            }
            completion()
        }
        task.resume()
    }

    func booksHeaderView() -> BooksHeaderView {
        return BooksHeaderView(
            booksCount: self.books.filter({$0.bookType == .ebook}).count,
            audioBooksCount: self.books.filter({$0.bookType == .audiobook}).count,
            pdfsCount: self.books.filter({$0.bookType == .pdf}).count
        )
    }

}
