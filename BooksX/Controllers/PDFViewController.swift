//
//  PDFViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/1/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    let bookURL: URL
    
    init(bookURL: URL) {
        self.bookURL = bookURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "asdf"
        let pdfContainerView = PDFView(frame: self.view.bounds)
        pdfContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(pdfContainerView)
        pdfContainerView.pinToEdgesOfSuperview()
        let doc = PDFDocument(url: self.bookURL)
        pdfContainerView.document = doc
    }
}
