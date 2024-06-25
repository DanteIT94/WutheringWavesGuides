//
//  WWGuidesApp.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//

import SwiftUI

@main
struct WWGuidesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black
                    .ignoresSafeArea(.all)
                ContentView()
            }
        }
    }
}
