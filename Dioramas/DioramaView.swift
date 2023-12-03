//
//  ContentView.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/2/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DioramaView: View {

    var body: some View {
        RealityView { content in
            do {
                let entity = try await Entity(named: "Scene", in: realityKitContentBundle)
                content.add(entity)
                entity.position = SIMD3<Float>(0, 0, -5)

            } catch {
                
            }
        } update: { _ in
            
        }
        
       
    }
}

#Preview() {
    DioramaView().previewLayout(.sizeThatFits)
}
