//
//  PDFViewModel.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/19/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation

class PDFViewModel {
    
    func fetchPPDFFile(_ url: URL, session: URLSession = URLSession.shared, completion: @escaping (_: Data?) -> Void) {

        if url.isFileURL == false {
            completion(nil)
        }
        
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) -> Void in
            // TODO: check error
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let data = data {
                    completion(data)
                } else {
                    completion(nil)
                }
        }
        task.resume()
    }
    
}
