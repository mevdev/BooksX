//
//  PDFViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/1/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit
import PDFKit
import Combine

class PDFViewController: BasicViewController {
    
    let bookURL: URL
    let viewModel = PDFViewModel()
    var cancellable: Cancellable?
    
    init(bookURL: URL) {
        self.bookURL = bookURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "asdf"

        cancellable = self.viewModel.$percentageComplete
            .sink() {
                print("progress: ", $0)
        }
        
        self.viewModel.fetchPPDFFile(self.bookURL) { [weak self] (pdfData) in
            DispatchQueue.main.async {
                if let pdfData = pdfData {
                    self?.showPDFView(pdfData)
                } else {
                    //TODO: throw are error or flip a table.
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
        self.showSpinner(true)
    }
    
    func showPDFView(_ pdfData: Data) {
        let pdfContainerView = PDFView(frame: self.view.bounds)
        pdfContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(pdfContainerView)
        pdfContainerView.translatesAutoresizingMaskIntoConstraints = false
        pdfContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pdfContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pdfContainerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        pdfContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        let doc = PDFDocument(data: pdfData)
        pdfContainerView.document = doc
    }

}
