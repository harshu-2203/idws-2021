//
//  WebViewController.swift
//  TableViews
//
//  Created by RG on 6/15/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    var query:String?
    
    init(search:String) {
        super.init(nibName: nil, bundle: nil)
        query = search
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://money-heist.fandom.com/wiki/\(query!)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

}
