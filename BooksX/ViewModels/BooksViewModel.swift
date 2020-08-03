//
//  BooksViewModel.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BooksViewModel {
    private var books = [Book]()
    var booksCount: Int {
        return books.count
    }

    func bookAt(index: Int) -> Book? {
        return self.books[index]
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
        return BooksHeaderView(pdfsCount: books.count)
    }

}

// MARK: Networking extension
    
extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func fetchCollectionTask(with url: URL, completionHandler: @escaping ([Book]?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

}
