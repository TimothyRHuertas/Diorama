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
    @State private var showIt:Bool = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Toggle(isOn: $showIt){
                Text("Show It")
                    .font(.title)
            }
            .onChange(of: showIt) {
                Task {
                    if(showIt) {
                        await openImmersiveSpace(id: "Immersive")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
          
                
        }
        
       
    }
}

#Preview() {
    ContentView().previewLayout(.sizeThatFits)
}
