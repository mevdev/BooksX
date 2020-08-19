//
//  BasicViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/19/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    
    let spinner = UIActivityIndicatorView()

    // MARK: Shared Views
    
    func showSpinner(_ show: Bool) {
        if show {
            self.view.addSubview(self.spinner)
            self.spinner.centerInSuperview()
            self.spinner.startAnimating()
        } else {
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }
    
}
