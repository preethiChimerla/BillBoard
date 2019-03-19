//
//  Album.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation

struct Album: Codable {
    var name: String
    var artistName: String
    var artworkUrl100: String
    var genres: [Genre]
    var releaseDate: String
    var copyright: String
    var artistUrl: String
}

struct Genre: Codable {
    var name: String
}
