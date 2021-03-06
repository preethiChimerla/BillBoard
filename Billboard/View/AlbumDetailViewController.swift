//
//  AlbumDetailViewController.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailViewController: UIViewController {
    
    var album: Album!
    let topImageContainerView = UIView()
    let albumImageview = UIImageView()
    let albumName = UILabel()
    let artistName = UILabel()
    let genre = UILabel()
    let releaseDate = UILabel()
    let copyright = UILabel()
    let stackView = UIStackView()
    let button = UIButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topImageContainerView)
        let imageUrl = URL(string: album.artworkUrl100.replacingOccurrences(of: "200x200", with: "600x600"))
        let data = try? Data(contentsOf: imageUrl!)
        if let imageData = data {
            albumImageview.image = UIImage(data: imageData)
            albumImageview.contentMode = .scaleAspectFit
        }
        albumImageview.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(albumImageview)
        setupStackElements()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  UIFont(name: "Helvetica", size: 12)
        button.setTitle("Click to navigate to itunes store", for: .normal)
        button.layer.borderColor = UIColor.purple.cgColor
        button.backgroundColor = UIColor.lightGray
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 9
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(self.btnclicked(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(button)
        setupLayout()
    }
    
    @objc private func setupStackElements() {
        albumName.defaultSetup()
        albumName.text = album.name
        albumName.textColor = UIColor.purple
        artistName.defaultSetup()
        artistName.text = album.artistName
        artistName.textColor = UIColor.blue
        genre.defaultSetup()
        genre.text = album.genres[0].name
        releaseDate.defaultSetup()
        releaseDate.text = album.releaseDate
        copyright.defaultSetup()
        copyright.text = album.copyright
        copyright.textColor = UIColor.gray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor.blue
        self.view.addSubview(stackView)
        stackView.addSubview(albumName)
        stackView.addSubview(artistName)
        stackView.addSubview(genre)
        stackView.addSubview(releaseDate)
        stackView.addSubview(copyright)
    }
    
    @objc func imageSetLayout() {
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            topImageContainerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            topImageContainerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        } else {
            if let navBar = self.navigationController {
                topImageContainerView.topAnchor.constraint(equalTo: navBar.view.bottomAnchor).isActive = true
            } else {
                topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0)
                    .isActive = true
            }
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            .isActive = true
        topImageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = false
        albumImageview.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
        albumImageview.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor)
            .isActive = true
        albumImageview.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor)
            .isActive = true
        albumImageview.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor)
            .isActive = true
        albumImageview.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor)
            .isActive = true
    }
    
    // MARK: setupLayout
    @objc private func setupLayout() {
        
        self.imageSetLayout()
        
        //stackview autolayout
        stackView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 8.0)
            .isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
        //albumName autolayout
        albumName.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        albumName.heightAnchor.constraint(equalToConstant: 12.0).isActive = true
        albumName.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
        
        //artistName autolayout
        artistName.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 14.0).isActive = true
        artistName.heightAnchor.constraint(equalToConstant: 12.0).isActive = true
        artistName.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
        
        //genre autolayout
        genre.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 3.0).isActive = true
        genre.heightAnchor.constraint(equalToConstant: 12.0).isActive = true
        genre.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
        
        //releaseDate autolayout
        releaseDate.topAnchor.constraint(equalTo: self.genre.bottomAnchor, constant: 3.0).isActive = true
        releaseDate.heightAnchor.constraint(equalToConstant: 12.0).isActive = true
        releaseDate.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
        
        //copyright autolayout
        copyright.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 3.0).isActive = true
        copyright.heightAnchor.constraint(equalToConstant: 12.0).isActive = true
        copyright.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
        copyright.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 5.0)
            .isActive = true
        copyright.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor, constant: -5.0)
            .isActive = true
        
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
    }
    
    @objc func btnclicked(sender: UIButton!) {
        print(album.artistUrl)
        let itunesUrl = URL(string: album.artistUrl)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(itunesUrl!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(itunesUrl!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.setupLayout()
    }
}

extension UILabel {
    func defaultSetup() {
        textAlignment = .center
        textColor = .black
        font = UIFont.systemFont(ofSize: 12)
        numberOfLines = 0
        lineBreakMode = .byCharWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
