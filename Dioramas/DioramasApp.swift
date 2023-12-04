//
//  DioramasApp.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/2/23.
//

import SwiftUI

@main
struct DioramasApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var viewModel = ViewModel()
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }.windowStyle(.plain)
        
        ImmersiveSpace(id: viewModel.immersiveSpaceIdentifier) {
            DioramaView(viewModel: viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: UIApplication) -> Bool {
        return true
    }
}
