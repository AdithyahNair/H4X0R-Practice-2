//
//  ContentView.swift
//  H4X0R Practice 2
//
//  Created by Adithyah Nair on 09/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.postData) { post in
                NavigationLink(destination: InformationView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title).fixedSize(horizontal: false, vertical: true)
                        // fixes truncation issue
                    }
                }
               
               
            }
            .navigationTitle("H4X0R News")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post: Identifiable {
    let id: String
    let message: String
}

