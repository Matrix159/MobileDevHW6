//
//  AppDelegate.swift
//  HW3
//
//  Created by user131266 on 9/21/17.
//  Copyright © 2017 eldridjo. All rights reserved.
//

import UIKit

let FOREGROUND_COLOR = UIColor.init(colorLiteralRed:0.5,
                                green:0.00, blue:0.5, alpha:1.00) // Purple
let BACKGROUND_COLOR = UIColor.init(colorLiteralRed:0.937,
                                green:0.188, blue:0.949, alpha:1.00) // Reddish

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        application.statusBarStyle = UIStatusBarStyle.lightContent
        
        let navAppearence = UINavigationBar.appearance()
        navAppearence.barTintColor = FOREGROUND_COLOR
        navAppearence.tintColor = BACKGROUND_COLOR
        navAppearence.isTranslucent = false
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

