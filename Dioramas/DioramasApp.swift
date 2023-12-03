//
//  DioramasApp.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/2/23.
//

import SwiftUI

@main
struct DioramasApp: App {
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
