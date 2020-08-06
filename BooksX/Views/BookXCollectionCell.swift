//
//  BookXCollectionCell.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/3/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BookXCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "BookXCollectionCell"
    
    var book: Book? = nil
    
    let coverImage = UIImageView()
    let progress = UILabel()
    let ellipses = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutCell() {
        coverImage.contentMode = .scaleAspectFit
        self.size(toHeight: Constants.cellHeight)
        self.size(toWidth: Constants.cellWidth)

        self.coverImage.image = UIImage(imageLiteralResourceName: Constants.coverDefault)
        self.addSubview(self.coverImage)
        self.coverImage.layer.shadowColor = UIColor.black.cgColor
        self.coverImage.layer.shadowOpacity = 0.3
        self.coverImage.layer.shadowOffset = .zero
        self.coverImage.layer.shadowRadius = 6
        // TODO: this should actually be bottom-aligned.
        self.coverImage.pinToTopEdgeOfSuperview(withOffset: Constants.padding)
        self.coverImage.pinToSideEdgesOfSuperview(withOffset: Constants.padding)
        self.coverImage.pinToBottomEdgeOfSuperview(withOffset: Constants.padding)
    }
    
    func book(_ book: Book) {
        self.book = book
        self.fillCellWithCurrentData()
    }
    
    func fillCellWithCurrentData() {
        // TODO: fill out and account for nil state
        // TODO: download image to concurrent queue
        if self.book?.bookType == .audiobook {
            // TODO: make tint color black.
            self.coverImage.image = UIImage(systemName: "speaker.2.fill")
        } else {
            self.coverImage.image = UIImage(imageLiteralResourceName: Constants.coverDefault)
        }
        self.downloadImage(self.book?.coverImage)
    }
    
    override func prepareForReuse() {
        self.book = nil
        self.fillCellWithCurrentData()
        super.prepareForReuse()
    }

    func downloadImage(_ onlineURL: String?) {
        // TODO: cache image and hit cache first
        if let validURL = onlineURL,
            let url = URL(string: validURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async { [weak self] in
                        self?.coverImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
