import RealityKit

public enum Region: String, Codable {
    case catalina
    case yosmite
}
// Ensure you register this component in your app’s delegate using:
// PointOfInterestComponent.registerComponent()
public struct PointOfInterestComponent: Component, Codable {
    var region: Region = .yosmite

    public init() {
    }
}
