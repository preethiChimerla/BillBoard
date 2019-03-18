//
//  AlbumCell.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/16/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    let albumThumbnailImage = UIImageView()
    let albumName = UILabel()
    let artistName = UILabel()
   
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.internalInit()
    }

    private func internalInit() {

        self.contentView.backgroundColor = .white

        // Make label multiline
        self.albumName.numberOfLines = 0
        self.albumName.font = UIFont.systemFont(ofSize: 20.0)
        self.albumName.lineBreakMode = .byWordWrapping
        self.albumName.textColor = .black
        
        self.artistName.numberOfLines = 0
        self.artistName.font = UIFont.systemFont(ofSize: 16.0)
        self.artistName.lineBreakMode = .byWordWrapping
        self.artistName.textColor = .gray
        
        // Enable autolayout
        self.albumThumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        self.albumName.translatesAutoresizingMaskIntoConstraints = false
        self.artistName.translatesAutoresizingMaskIntoConstraints = false
        

        // Add to content of the cell
        self.contentView.addSubview(self.albumThumbnailImage)
        self.contentView.addSubview(self.albumName)
        self.contentView.addSubview(self.artistName)
    
        self.setLayout()
        
    }
    
    func setLayout(){
        // Anchors
        self.albumThumbnailImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0).isActive = true
        self.albumThumbnailImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8.0).isActive = true
        self.albumThumbnailImage.widthAnchor.constraint(equalToConstant: 85.0).isActive = true
        self.albumThumbnailImage.heightAnchor.constraint(equalToConstant: 85.0).isActive = true
        
        
        self.albumName.leftAnchor.constraint(equalTo: self.albumThumbnailImage.rightAnchor, constant: 8.0).isActive = true
        self.albumName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        
        self.artistName.leadingAnchor.constraint(equalTo: self.albumName.leadingAnchor).isActive = true
        self.artistName.topAnchor.constraint(equalTo: self.albumName.bottomAnchor, constant: 10.0).isActive = true
        
        // Bottom constraint with low priority to skip warnings in console
        let bottom = self.albumThumbnailImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        bottom.priority = .defaultHigh
        bottom.isActive = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
