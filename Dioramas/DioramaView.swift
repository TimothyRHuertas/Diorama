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
    var viewModel:ViewModel
    var body: some View {
        @Bindable var viewModel = viewModel
        
        RealityView { content in
            do {
                let entity = try await Entity(named: "DioramaAssembled", in: realityKitContentBundle)
                viewModel.rootEntity = entity
                content.add(entity)
                viewModel.updateScale()
                entity.position = SIMD3<Float>(0, 0, -3)

            } catch {
                
            }
        } update: { _ in
            
        }
        
       
    }
}

#Preview() {
    DioramaView(viewModel: ViewModel()).previewLayout(.sizeThatFits)
}
