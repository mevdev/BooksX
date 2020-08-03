//
//  Book.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

// TODO: add type here and in the json file

struct Book: Codable {
    let title: String
    let coverImage: String?
    let progress: Int
}
