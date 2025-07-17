//
//  AppDelegate.swift
//  Tarot2
//
//  Created by stuard bolaños on 11/07/25.
//

import SwiftUI
import Firebase // Make sure you have Firebase imported

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase configured in AppDelegate") // Optional: for debugging
        return true
    }

    // Add any other AppDelegate methods here that Firebase might need,
    // e.g., for push notifications, deep links, etc.
    // For example, for push notifications:
    // func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    //     Messaging.messaging().apnsToken = deviceToken
    // }
}
