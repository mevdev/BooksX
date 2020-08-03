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
        // injection of the pdf file for this VC.
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pdfContainerView = PDFView(frame: self.view.bounds)
        pdfContainerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(pdfContainerView)
        pdfContainerView.pinToEdgesOfSuperview()
    }
    
}
