//
//  AlbumsRepository.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation

class AlbumsRepository {
    public func getAlbums(_ completionProtocol: CompletionProtocol) {
        loadEntries { (albumList) in
            completionProtocol.onDataReady(albums: albumList)
        }
    }
    private func loadEntries(completionHandler: @escaping (_ albums:[Album]) -> Void) {
        let defaultSession:URLSession = URLSession(configuration: URLSessionConfiguration.default)
        let itunesURLString =
        "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        let urlItunesApi = URL(string: itunesURLString)!
        let dataTask = defaultSession.dataTask(with: urlItunesApi) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            let statusCode = httpResponse.statusCode
            if statusCode != 200 {
                print("Invalid status: \(statusCode)")
                return
            }
            guard let data = data else {
                print("Invalid data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let rssFeed = try decoder.decode(RSSFeed.self, from: data)
                let albums = rssFeed.feed.results
                completionHandler(albums)
            } catch (let error) {
                print("Error: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
