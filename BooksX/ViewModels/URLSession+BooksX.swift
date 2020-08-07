//
//  URLSession+BooksX.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/7/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation

protocol URLSessionBooksX {
    
    func fetchCollectionTask(with url: URL, completionHandler: @escaping ([Book]?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    
    func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
    
}

// MARK: Networking extension
    
extension URLSession: URLSessionBooksX {
    
    func fetchCollectionTask(with url: URL, completionHandler: @escaping ([Book]?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
    
    func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

}
