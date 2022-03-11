//
//  NetworkManager.swift
//  H4X0R Practice 2
//
//  Created by Adithyah Nair on 09/03/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var postData = [PostInformation]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let decodedData = try decoder.decode(PostData.self, from: safeData)
                        DispatchQueue.main.async {
                            self.postData = decodedData.hits
                        }
                    } catch {
                        print(error)
                    }
                    
                }
                
            }
            task.resume()
        }
    }
}
