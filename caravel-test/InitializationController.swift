//
//  InitializationController.swift
//  caravel-test
//
//  Created by Adrien on 29/05/15.
//  Copyright (c) 2015 Coshx Labs. All rights reserved.
//

import Foundation
import UIKit
import Caravel

public class InitializationController: UIViewController {
    
    @IBOutlet weak var _webView: UIWebView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        Caravel.getDefault(_webView).whenReady() { bus in
            bus.post("Before")
        }
        
        _webView.loadRequest(NSURLRequest(URL: NSBundle.mainBundle().URLForResource("initialization", withExtension: "html")!))
        
        Caravel.getDefault(_webView).whenReady() { bus in
            bus.post("After")
        }
    }
}