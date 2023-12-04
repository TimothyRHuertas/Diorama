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
    var contentScaleSliderValue: Float = 0.5

    
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
    
    func updateScale() {
        let newScale = Float.lerp(a: 0.2, b: 1.0, t: contentScaleSliderValue)
        rootEntity?.setScale(SIMD3<Float>(repeating: newScale), relativeTo: nil)
    }
}

fileprivate extension Entity {
    var terrain: Entity? {
        findEntity(named: "FlatTerrain")
    }
}

public extension FloatingPoint {
    static func lerp(a: Self, b: Self, t: Self) -> Self {
        let one = Self(1)
        let oneMinusT = one - t
        let aTimesOneMinusT = a * oneMinusT
        let bTimesT = b * t
        return aTimesOneMinusT + bTimesT
    }
}
