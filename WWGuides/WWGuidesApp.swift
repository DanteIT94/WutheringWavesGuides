//
//  WWGuidesApp.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//

import SwiftUI
import Firebase

@main
struct WWGuidesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("Configured Firebase")
    return true
  }
}
