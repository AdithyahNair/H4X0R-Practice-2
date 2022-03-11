//
//  InformationView.swift
//  H4X0R Practice 2
//
//  Created by Adithyah Nair on 09/03/22.
//

import SwiftUI
import WebKit

struct InformationView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString {
            if let url = URL(string: safeURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    
}
