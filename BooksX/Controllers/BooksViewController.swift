//
//  BooksViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {
    
    let viewModel = BooksViewModel()
    
    let spinner = UIActivityIndicatorView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
    var flowLayout: UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        return flow
    }
    
    override func viewDidLoad() {
        // load from network.
        self.viewModel.fetchBooks() {
            DispatchQueue.main.async {
                self.showCollection()
            }
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
        self.showSpinner(false)
        let headerView = self.viewModel.booksHeaderView()
        self.view.addSubview(headerView)
        headerView.pinToTopEdgeOfSuperview(withOffset: self.view.safeAreaInsets.top)
        headerView.pinToSideEdgesOfSuperview()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .white
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.register(BookXCollectionCell.self, forCellWithReuseIdentifier: BookXCollectionCell.reuseIdentifier)
        self.view.addSubview(self.collectionView)
        self.collectionView.positionBelow(headerView, withOffset: Constants.paddingSmall)
        self.collectionView.pinToBottomEdgeOfSuperview(withOffset: self.view.safeAreaInsets.bottom)
        self.collectionView.pinToSideEdgesOfSuperview()
    }
    
}

extension BooksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.booksCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: BookXCollectionCell.reuseIdentifier, for: indexPath) as! BookXCollectionCell
        if let book = self.viewModel.bookAt(index: indexPath.item) {
            cell.book(book)
        }
        return cell
    }
    
}

extension BooksViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: transition to reader View Controller.
        print("\(indexPath.item) tapped")
    }
    
}

extension BooksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }

}
