//
//  ViewModel.swift
//  Dioramas
//
//  Created by Timothy Huertas on 12/3/23.
//

import Foundation
import Observation
import RealityKit


@Observable
final class ViewModel {
    let materialParameterName = "Progress"
    let immersiveSpaceIdentifier = "Immersive"
    var showImmersiveContent = true
    var sliderValue:Float = 0.0
    var rootEntity: Entity? = nil
    
    private var terrainMaterial: ShaderGraphMaterial? {
       rootEntity?.terrain?.shaderGraphMaterial
    }
    
    
    
    func updateTerrainMaterial() {
        guard let terrain = rootEntity?.terrain,
                let terrainMaterial = terrainMaterial else { return }
        do {
            var material = terrainMaterial
            try material.setParameter(name: materialParameterName, value: .float(sliderValue))

            if var component = terrain.modelComponent {
                component.materials = [material]
                terrain.components.set(component)
            }

            try terrain.update(shaderGraphMaterial: terrainMaterial, { material in
                try material.setParameter(name: materialParameterName, value: .float(sliderValue))
            })
        } catch {
            print("problem: \(error)")
        }
    }
}

fileprivate extension Entity {
    var terrain: Entity? {
        findEntity(named: "FlatTerrain")
    }
}
