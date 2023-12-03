//
//  DioramasApp.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/2/23.
//

import SwiftUI

@main
struct DioramasApp: App {
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)
        
        ImmersiveSpace(id: "Immersive") {
            DioramaView()
        }
    }
}
