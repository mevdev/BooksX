//
//  BooksViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/2/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import AVKit
import UIKit

class BooksViewController: UIViewController {

    let viewModel: BooksViewModel

    let spinner = UIActivityIndicatorView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
    var flowLayout: UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        return flow
    }

    init(viewModel: BooksViewModel = BooksViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
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
        if let bookSelected = self.viewModel.bookAt(index: indexPath.item),
            let onlinePath = bookSelected.file,
            let onlineURL = URL(string: onlinePath) {
            // TODO: refactor this to somewhere else, maybe make an audio player VC.
            if bookSelected.bookType == .audiobook {
                self.transitionToAudioListener(url: onlineURL, title: bookSelected.title)
            } else if bookSelected.bookType == .pdf || bookSelected.bookType == .ebook {
                self.transitionToPDFViewer(url: onlineURL, title: bookSelected.title)
            }
        } else {
            // TODO: error
            print("\(indexPath.item) tapped and no file was there, or item doesn't exist")
        }
    }
    
    // MARK: ViewController Transitions
    
    func transitionToPDFViewer(url: URL, title: String) {
        // TODO: show a loading spinner, it is streaming the file in.
        // TODO: cache file and if invoked again, show cached version.
        let pdfViewVC = PDFViewController(bookURL: url)
        pdfViewVC.title = title
        self.navigationController?.pushViewController(pdfViewVC, animated: true)
    }
    
    func transitionToAudioListener(url: URL, title: String) {
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.title = title
        vc.player = player
        vc.player?.play()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension BooksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }

}
