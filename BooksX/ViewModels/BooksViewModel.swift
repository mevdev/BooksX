//
//  BooksViewModel.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation
import UIKit

class BooksViewModel {

    var booksCount: Int {
        return 0
    }
    
    func fetchBooks(completion: @escaping () -> Void) {
        // do the stuffs.
        completion()
    }
    
    func booksCountHeaderView() -> BooksCountHeaderView {
        return BooksCountHeaderView()
    }
    
}
