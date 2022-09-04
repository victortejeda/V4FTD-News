//
//  DetailView.swift
//  V4FTD News
//
//  Created by Victor Tejeda on 13/8/22.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}




