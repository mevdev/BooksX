//
//  PDFViewController.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/1/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import Foundation
import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    init(pdf: String) {
        // TODO: injection of the pdf file for this VC.
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: make a header to get back...navController has none.
        
        let pdfContainerView = PDFView(frame: self.view.bounds)
        pdfContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(pdfContainerView)
        pdfContainerView.pinToEdgesOfSuperview()
    }
    
}
