//
//  UIVIew+CalculatedHeight.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/3/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

extension UIView {
    func calculatedHeight() -> CGFloat {
        let viewCalculatedSize = self.systemLayoutSizeFitting(UIScreen.main.bounds.size)
        return viewCalculatedSize.height
    }
}
