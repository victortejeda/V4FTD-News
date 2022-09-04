//
//  NewworkManager.swift
//  V4FTD News
//
//  Created by Victor Tejeda on 12/8/22.
//

import Foundation
import SwiftUI

class NetworkManger: ObservableObject {
    
    @Published var posts = [Post]() // llamado Hilo principal
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let sesion = URLSession(configuration: .default)
            let task = sesion.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.posts = results.hits //Actulizacion del hilo principal
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

