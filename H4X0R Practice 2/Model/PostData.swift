//
//  PostData.swift
//  H4X0R Practice 2
//
//  Created by Adithyah Nair on 09/03/22.
//

import Foundation

struct PostData: Codable {
    let hits: [PostInformation]
}

struct PostInformation: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
