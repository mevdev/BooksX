//
//  BooksHeaderView.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BooksHeaderView: UIView {
    
    var booksCount: Int = 0
    var audioBooksCount: Int = 0
    var pdfsCount: Int = 0
    
    init(booksCount: Int = 0, audioBooksCount: Int = 0, pdfsCount: Int = 0) {
        self.booksCount = booksCount
        self.audioBooksCount = audioBooksCount
        self.pdfsCount = pdfsCount
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layoutElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutElements() {
        let title = UILabel()
        title.text = Constants.collectionTitle
        title.font = UIFont(name: Constants.fontNameTitle, size: Constants.fontHeightTitle)
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints  = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.paddingLarge).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.padding).isActive = true
        let titleDivider = addDividerBelow(title, padding: Constants.paddingSmall)
        
        let collectionInfoLabel = UILabel()
        collectionInfoLabel.font.withSize(Constants.fontHeightSubTitle)
        collectionInfoLabel.textColor = Constants.colorSubTitle
        collectionInfoLabel.text = self.collectionInfoText()
        self.addSubview(collectionInfoLabel)
        
        collectionInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionInfoLabel.topAnchor.constraint(equalTo: titleDivider.bottomAnchor, constant: Constants.padding).isActive = true
        collectionInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding).isActive = true
        collectionInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.padding).isActive = true

        let bottomDivider = self.addDividerBelow(collectionInfoLabel)
        bottomDivider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func addDividerBelow(_ view: UIView, padding: CGFloat = Constants.padding) -> UIView {
        let divider = UIView(frame: .zero)
        divider.backgroundColor = Constants.colorDivider
        self.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        divider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding).isActive = true
        divider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.padding).isActive = true
        divider.topAnchor.constraint(equalTo: view.bottomAnchor, constant: padding).isActive = true
        return divider
    }

    private func collectionInfoText() -> String {
        let labelArray = [
            self.portmanteau(self.booksCount, typeName: "book"),
            self.portmanteau(self.audioBooksCount, typeName: "audiobook"),
            self.portmanteau(self.pdfsCount, typeName: "PDF"),
        ]
        return labelArray.joined(separator: ", ")
    }
    
    private func portmanteau(_ count: Int, typeName: String) -> String {
        let labelPart = "\(count) \(typeName)"
        return count == 1 ? labelPart : labelPart + "s"
    }
    
}
