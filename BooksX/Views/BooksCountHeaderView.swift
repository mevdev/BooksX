//
//  BooksCountHeaderView.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation
import UIKit


class BooksCountHeaderView: UIView {
    
    let booksCount: Int
    let audioBooksCount: Int
    let seriesCount: Int
    let pdfsCount: Int

    init(booksCount: Int = 0, audioBooksCount: Int = 0, seriesCount: Int = 0, pdfsCount: Int = 0) {
        self.booksCount = booksCount
        self.audioBooksCount = audioBooksCount
        self.seriesCount = seriesCount
        self.pdfsCount = pdfsCount
        
        super.init(frame: .zero)
        self.layoutCountHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Views
    
    func layoutCountHeader() {
        // put in label with info, make ~40, with bottom line.
    }
}
