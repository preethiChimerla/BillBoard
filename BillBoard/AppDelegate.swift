//
//  AppDelegate.swift
//  BillBoard
//
//  Created by Preethi Chimerla on 3/15/19.
//  Copyright © 2019 com.PreethiChimerla.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let top100 = AlbumsTableViewController(style: UITableView.Style.plain)
        let navigationController = UINavigationController(rootViewController: top100)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        
        return true
    }
}

