//
//  Book.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

// TODO: add type here and in the json file

enum BookType: String, Codable {
    case ebook, audiobook, pdf
}

struct Book: Codable {
    let title: String
    let coverImage: String?
    let file: String?
    let bookType: BookType?
    let progress: Int
}
