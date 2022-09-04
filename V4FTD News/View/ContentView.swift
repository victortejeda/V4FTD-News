//
//  ContentView.swift
//  V4FTD News
//
//  Created by Victor Tejeda on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Noticias Gringas")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let p osts = [
//    Post(id: "1", title: "Hola"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hello")
//]

