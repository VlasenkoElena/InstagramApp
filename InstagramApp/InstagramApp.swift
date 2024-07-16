//
//  InstagramAppApp.swift
//  InstagramApp
//
//  Created by Helen on 20.06.2024.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct InstagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AppViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if viewModel.userSession == nil {
                    LoginView()
                        .environmentObject(registrationViewModel)
                } else if let currentUser = viewModel.currentUser {
                    TabBarView(user: currentUser)
                }
            }
        }
    }
}
