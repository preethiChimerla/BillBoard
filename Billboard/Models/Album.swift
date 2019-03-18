//
//  Album.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation

struct Album {
    private(set) public var albumName: String
    private(set) public var artistName: String
    private(set) public var thumbnailImg: String
    private(set) public var genre: String
    private(set) public var releaseDate: String
    private(set) public var copyright: String
    private(set) public var albumImage: String
    private(set) public var artistUrl: String
    init(albumName: String,artistName:String,thumbnailImg: String,genre: String,releaseDate: String,
         copyright: String,albumImage: String,artistUrl: String) {
        self.albumName = albumName
        self.artistName = artistName
        self.thumbnailImg = thumbnailImg
        self.genre = genre
        self.releaseDate = releaseDate
        self.copyright = copyright
        self.albumImage = albumImage
        self.artistUrl = artistUrl
    }
}
