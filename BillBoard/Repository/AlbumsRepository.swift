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
    
    private func loadEntries(completionHandler: @escaping (_ albums:[Album])->()){
        
        let defaultSession:URLSession = URLSession(configuration: URLSessionConfiguration.default)
        let itunesURLString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        let urlItunesApi = URL(string: itunesURLString)!
        
        let dataTask = defaultSession.dataTask(with: urlItunesApi) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else{
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
            
            do{
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:AnyObject] else {
                    print("Couldn't parse data")
                    return
                }
                
                guard let dataDictionary = dictionary["feed"] as? [String:AnyObject] else {
                    return
                }
                
                guard let results = dataDictionary["results"] as? [[String:AnyObject]] else {
                    return
                }
                
                let albums = results.compactMap({ (dataEntry) -> Album in
                    let album_name = dataEntry["name"] as! String
                    let artist_name = dataEntry["artistName"] as! String
                    let thumbnailImg = dataEntry["artworkUrl100"] as! String
                    let genres = dataEntry["genres"] as! NSArray
                    let name = genres[0] as! NSDictionary
                    let gname = name.object(forKey: "name")
                    let genre = gname as! String
                    let releaseDate = dataEntry["releaseDate"] as! String
                    let copyright = dataEntry["copyright"] as! String
                    var albumImage = dataEntry["artworkUrl100"] as! String
                    albumImage = albumImage.replacingOccurrences(of: "200x200", with: "600x600")
                    let artistUrl = dataEntry["artistUrl"] as! String
                    
                    let album = Album(album_name: album_name, artist_name: artist_name, thumbnailImg: thumbnailImg, genre: genre, releaseDate: releaseDate, copyright: copyright, albumImage: albumImage, artistUrl: artistUrl)
                    
                    return album
                })
                completionHandler(albums)
            } catch (let error){
                print("Error: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
