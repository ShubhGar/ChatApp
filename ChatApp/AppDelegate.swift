//
//  AppDelegate.swift
//  ChatApp
//
//  Created by shubham Garg on 26/07/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit
import ChatSDK
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let config = BConfiguration.init();
        config.rootPath = "test"
        // Configure other options here...

        config.allowUsersToCreatePublicChats = true
        BChatSDK.initialize(config, app: application, options: launchOptions)

        // Optional
//        AddContactWithQRCodeModule().activate()
            
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = BChatSDK.ui()?.splashScreenNavigationController()
        self.window?.makeKeyAndVisible();
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        BChatSDK.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        BChatSDK.application(application, didReceiveRemoteNotification: userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        BChatSDK.application(application, didReceiveRemoteNotification: userInfo)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return BChatSDK.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return BChatSDK.application(app, open: url, options: options)
    }


}

