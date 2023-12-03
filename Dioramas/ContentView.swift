//
//  ContentView.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/2/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var viewModel: ViewModel
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        VStack {
            Toggle(isOn: $viewModel.showImmersiveContent){
                Text("Show It")
                    .font(.title)
            }
            .onChange(of: viewModel.showImmersiveContent) {
                Task {
                    if(viewModel.showImmersiveContent) {
                        await openImmersiveSpace(id: "Immersive")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
            .onAppear{
                Task {
                    if(viewModel.showImmersiveContent) {
                        await openImmersiveSpace(id: "Immersive")
                    } 
                }
            }
          
                
        }
        
       
    }
}

#Preview() {
    ContentView(viewModel: ViewModel()).previewLayout(.sizeThatFits)
}
