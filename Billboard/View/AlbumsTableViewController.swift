//
//  AlbumsTableViewController.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation
import UIKit

class AlbumsTableViewController: UITableViewController, CompletionProtocol {
    
    var albums: [Album] = []
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top Albums"
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        AlbumsRepository().getAlbums(self)
        tableView.register(AlbumCell.self, forCellReuseIdentifier: "AlbumCell")
        tableView.tableFooterView = UIView()
    }
    
    func onDataReady(albums: [Album]) {
        self.albums = albums
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.myActivityIndicator.stopAnimating()
        }
    }
}

extension AlbumsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumCell
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        let currentAlbum = albums[indexPath.row]
        let imageurl = URL(string: (currentAlbum.artworkUrl100))
        let data = try? Data(contentsOf: imageurl!)
        if let imageData = data {
            cell?.albumThumbnailImage.image = UIImage(data: imageData)
        }
        cell?.albumName.text = currentAlbum.name
        cell?.artistName.text = currentAlbum.artistName
        return cell ?? AlbumCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        let backItem = UIBarButtonItem()
        backItem.title = "Albums"
        navigationItem.backBarButtonItem = backItem
        let detailsViewController = AlbumDetailViewController()
        detailsViewController.album = album
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
