//
//  Album.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation

struct Album {
    
    private(set) public var album_name: String
    private(set) public var artist_name: String
    private(set) public var thumbnailImg: String
    private(set) public var genre: String
    private(set) public var releaseDate: String
    private(set) public var copyright: String
    private(set) public var albumImage: String
    private(set) public var artistUrl: String
    
    init(album_name: String, artist_name: String, thumbnailImg: String, genre: String,releaseDate: String, copyright: String, albumImage: String, artistUrl: String) {
        self.album_name = album_name
        self.artist_name = artist_name
        self.thumbnailImg = thumbnailImg
        self.genre = genre
        self.releaseDate = releaseDate
        self.copyright = copyright
        self.albumImage = albumImage
        self.artistUrl = artistUrl
    }
}
