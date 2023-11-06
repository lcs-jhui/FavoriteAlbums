//
//  Album.swift
//  FavoriteAlbums
//
//  Created by Justin Hui on 2/11/2023.
//

import Foundation

struct Album: Identifiable {
    let id = UUID()
    let albumProvided: String
    let artistProvided: String
    let linkProvided: String
    let ratingProvided: Int
}
