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
        // 250h x 200w
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
        // TODO: fill in the data
    }
    
}
