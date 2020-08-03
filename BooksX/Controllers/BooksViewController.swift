//
//  BooksViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation
import UIKit

class BooksViewController: UIViewController {
    
    let viewModel = BooksViewModel()
    
    let spinner = UIActivityIndicatorView()
    let collectionView: UICollectionView? = nil
//    var countHeaderView: BooksCountHeaderView?
    
    override func viewDidLoad() {
        // load from network.
        self.viewModel.fetchBooks() {
            self.showCollection()
        }
        self.view.backgroundColor = .white
        self.showSpinner(true)
    }
    
    // MARK: Show / Hide
    
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
    
    func showCollection() {
        // self.showSpinner(false)

//        let countHeaderView = self.viewModel.booksCountHeaderView()
//        self.view.addSubview(self.collectionView)
//        self.collectionView.
    }
    
}

extension BooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.booksCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension BooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: transition to reader View Controller.
    }
}
