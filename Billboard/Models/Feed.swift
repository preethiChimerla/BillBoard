//
//  Feed.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/19/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var results: [Album]
}

struct RSSFeed: Codable {
    var feed: Feed
}
