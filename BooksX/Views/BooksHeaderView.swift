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
        title.pinToTopEdgeOfSuperview(withOffset: Constants.paddingLarge)
        title.pinToSideEdgesOfSuperview(withOffset: Constants.padding)
        let titleDivider = addDividerBelow(title, padding: Constants.paddingSmall)
        
        let collectionInfoLabel = UILabel()
        collectionInfoLabel.font.withSize(Constants.fontHeightSubTitle)
        collectionInfoLabel.textColor = Constants.colorSubTitle
        collectionInfoLabel.text = self.collectionInfoText()
        self.addSubview(collectionInfoLabel)
        collectionInfoLabel.positionBelow(titleDivider, withOffset: Constants.padding)
        collectionInfoLabel.pinToSideEdgesOfSuperview(withOffset: Constants.padding)
        let bottomDivider = self.addDividerBelow(collectionInfoLabel)
        bottomDivider.pinToBottomEdgeOfSuperview()
    }
    
    private func addDividerBelow(_ view: UIView, padding: CGFloat = Constants.padding) -> UIView {
        let divider = UIView(frame: .zero)
        divider.backgroundColor = Constants.colorDivider
        divider.size(toHeight: 1.0)
        self.addSubview(divider)
        divider.pinToSideEdgesOfSuperview(withOffset: Constants.padding)
        divider.positionBelow(view, withOffset: padding)
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
