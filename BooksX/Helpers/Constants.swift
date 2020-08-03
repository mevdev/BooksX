//
//  Constants.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

struct Constants {
    // MARK: Networking
    static let fetchURL = URL(string: "https://robertLinnemann.com/booksX/collection.json")!
    
    // MARK: Design
    static let paddingSmall: CGFloat = 10.0
    static let padding: CGFloat = 20.0
    static let paddingLarge: CGFloat = 50.0
    
    static let fontHeightTitle: CGFloat = 36.0
    static let fontHeightSubTitle: CGFloat = 12.0
    static let fontNameTitle: String = "TimesNewRomanPS-BoldMT"
    
    static let colorSubTitle: UIColor = .gray
    static let colorDivider: UIColor = .lightGray
    
    // MARK: Copy
    static let collectionTitle = "Library"
}
